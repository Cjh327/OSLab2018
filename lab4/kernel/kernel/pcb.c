#include "device.h"
#include "x86.h"

extern SegDesc gdt[NR_SEGMENTS];
extern TSS tss;

uint32_t getPid(struct ProcessTable* p ) {
    return (uint32_t)NR_PCB(p) + 1;
}

void IDLE() {
    putChar('.');
    asm volatile("movl %0, %%esp;" ::"i"(0x200000));
    asm volatile("sti");
    waitForInterrupt();
}

void addToEnd(struct ProcessTable* p) {
    if (p != NULL) {
        struct ProcessTable* q = p->next;
        if (q != NULL) {
            pcb_head = q;
            while (q->next != NULL)
                q = q->next;
            q->next = p;
            p->next = NULL;
        }
    }
}

void schedule() {
    struct ProcessTable* p = pcb_head;
    while (p != NULL && p->state != RUNNABLE)
        p = p->next;
    pcb_run = p;
    if (pcb_run == NULL) {
        IDLE();
    }
    else {
        pcb_run->state = RUNNING;
        enterPcb(pcb_run);
    }

}

void enterPcb(struct ProcessTable* p) {

    tss.esp0 = (uint32_t)&(p->state);
    tss.ss0 = KSEL(SEG_KDATA);

    gdt[SEG_UCODE] = SEG(STA_X | STA_R, NR_PCB(p) * PROC_MEMSZ, 0xffffffff, DPL_USER);
    gdt[SEG_UDATA] = SEG(STA_W,         NR_PCB(p) * PROC_MEMSZ, 0xffffffff, DPL_USER);

    asm volatile("pushl %eax"); // save eax
    asm volatile("movl %0, %%eax" ::"r"(USEL(SEG_UDATA)));
    asm volatile("movw %ax, %ds");
    asm volatile("movw %ax, %es");
    asm volatile("popl %eax");

    asm volatile("movl %0, %%esp" ::"r"(&(p->tf.gs)));
    asm volatile("popl %gs");
    asm volatile("popl %fs");
    asm volatile("popl %es");
    asm volatile("popl %ds");
    asm volatile("popal");

    asm volatile("addl $4, %esp");
    asm volatile("addl $4, %esp");

    asm volatile("iret");
}


void addPcb(struct ProcessTable** p) {
    *p = pcb_free;
    pcb_free = pcb_free->next;
    (*p)->next = NULL;
    (*p)->state = RUNNABLE;
    (*p)->timeCount = 10;
    (*p)->sleepTime = 0;
    (*p)->pid = getPid(*p);

    if (pcb_head == NULL)
        pcb_head = *p;
    else {
        struct ProcessTable* q = pcb_head;
        while (q->next != NULL)
            q = q->next;
        q->next = *p;
    }
}


void initPcb() {
    pcb_free = &pcb[0];
    for (int i = 0; i < MAX_PCB_NUM - 1; i++) {
        pcb[i].next = &pcb[i + 1];
        pcb[i].state = DEAD;
    }
    pcb[MAX_PCB_NUM - 1].next = NULL;
    pcb[MAX_PCB_NUM - 1].state = DEAD;

    pcb_head = NULL;
    pcb_run = NULL;
}

void EnterUserPcb(uint32_t entry) {

    struct ProcessTable* p = NULL;
    addPcb(&p);
    pcb_run = p;
    p->state = RUNNING;

    asm volatile("movl %0, %%eax" ::"r"(USEL(SEG_UDATA)));
    asm volatile("movw %ax, %ds");
    asm volatile("movw %ax, %es");
    asm volatile("movw %ax, %fs");

    asm volatile("sti");
    asm volatile("pushfl");  // %eflags
    asm volatile("cli");
    asm volatile("movl (%%esp), %0" : "=r"(p->tf.eflags) :);
    p->tf.ss = USEL(SEG_UDATA);
    p->tf.esp = 0x200000 + PROC_MEMSZ;
    p->tf.cs = USEL(SEG_UCODE);
    p->tf.eip = entry;

    asm volatile("pushl %0":: "r"(p->tf.ss));       // %ss
    asm volatile("pushl %0":: "r"(p->tf.esp));      // %esp
    asm volatile("pushl %0":: "r"(p->tf.eflags));   // %eflags
    asm volatile("pushl %0":: "r"(p->tf.cs));       // %cs
    asm volatile("pushl %0":: "r"(p->tf.eip));      // %eip

    asm volatile("iret");

}


