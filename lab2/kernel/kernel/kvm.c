#include "x86.h"
#include "device.h"

SegDesc gdt[NR_SEGMENTS];
TSS tss;

#define SECTSIZE 512

void waitDisk(void) {
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) {
	int i;
	waitDisk();

	outByte(0x1F2, 1);
	outByte(0x1F3, offset);
	outByte(0x1F4, offset >> 8);
	outByte(0x1F5, offset >> 16);
	outByte(0x1F6, (offset >> 24) | 0xE0);
	outByte(0x1F7, 0x20);

	waitDisk();
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}

void initSeg() {
	gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_KERN);
	gdt[SEG_KDATA] = SEG(STA_W,         0,       0xffffffff, DPL_KERN);
	gdt[SEG_UCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_USER);
	gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	gdt[SEG_TSS] = SEG16(STS_T32A,      &tss, sizeof(TSS)-1, DPL_KERN);
	gdt[SEG_TSS].s = 0;
	gdt[SEG_VIDEO] = SEG(STA_W,  0x0b8000,       0xffffffff, DPL_KERN);
	setGdt(gdt, sizeof(gdt));

	/*
	 * 初始化TSS
	 */
    tss.esp0 = 0x200000;
    tss.ss0 = KSEL(SEG_KDATA);
	asm volatile("ltr %%ax":: "a" (KSEL(SEG_TSS)));

	/*设置正确的段寄存器*/
    asm volatile("movl %0, %%eax":: "r"(KSEL(SEG_KDATA)));
    asm volatile("movw %ax, %ds");
    asm volatile("movw %ax, %es");
    asm volatile("movw %ax, %ss");
    asm volatile("movw %ax, %fs");
    asm volatile("movl %0, %%eax":: "r"(KSEL(SEG_VIDEO)));
    asm volatile("movw %ax, %gs");
	lLdt(0);
}

void enterUserSpace(uint32_t entry) {
	/*
	 * Before enter user space
	 * you should set the right segment registers here
	 * and use 'iret' to jump to ring3
	 */
    asm volatile("pushl %0":: "r"(USEL(SEG_UDATA)));
    asm volatile("pushl %0":: "r"(128 << 20));
    asm volatile("pushfl");
    asm volatile("pushl %0":: "r"(USEL(SEG_UCODE)));
    asm volatile("pushl %0":: "r"(entry));
    asm volatile("iret");
}

void loadUMain(void) {

	/*加载用户程序至内存*/
    unsigned char* buf = (unsigned char*)0x5000000;
    for (int i = 0; i < 50; i++)
        readSect((void*)(buf + i * 512), i + 201);
    struct ELFHeader* elf = (struct ELFHeader*)buf;
    struct ProgramHeader* ph = (struct ProgramHeader*)(buf + elf->phoff);

    for (int i = 0; i < elf->phnum; i++) {
        if (ph->type == 1) {
            unsigned int p = ph->vaddr, offset = ph->off;
            while (p < ph->vaddr + ph->filesz)
                *(unsigned char*)(p++) = *(unsigned char*)(buf + offset++);
            while (p < ph->vaddr + ph->memsz)
                *(unsigned char*)(p++) = 0;
        }
        ph++;
    }
    enterUserSpace(elf->entry);
}
