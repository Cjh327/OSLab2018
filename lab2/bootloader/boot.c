#include "boot.h"

#define SECTSIZE 512

void bootMain(void) {
	/* 加载内核至内存，并跳转执行 */
    unsigned char* buf = (unsigned char*)0x5000000;
    for (int i = 0; i < 200; i++)
        readSect((void*)buf + i * 512, i + 1);
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
    void (*entry)(void);
    entry = (void*)elf->entry;
    entry();

}

void waitDisk(void) { // waiting for disk
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) { // reading a sector of disk
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
