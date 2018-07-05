#include "x86.h"
#include "device.h"

#define SYS_exit 1
#define SYS_fork 2
#define SYS_write 4
#define SYS_sleep 100
#define SYS_sem_init 101
#define SYS_sem_post 102
#define SYS_sem_wait 103
#define SYS_sem_destroy 104


void syscallHandle(struct TrapFrame *tf);

void timerInterruptHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);

typedef int sem_t;

void *memcpy(void *dest, const void *src, size_t count) {
    char *tmp = dest;
    const char *s = src;
    while (count--)
    *tmp++ = *s++ ;
    return dest;
}


void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */

    asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_KDATA)));
    asm volatile("movw %ax, %ds");
    asm volatile("movw %ax, %fs");
    asm volatile("movw %ax, %es");
    asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_VIDEO)));
    asm volatile("movw %ax, %gs");

    switch(tf->irq) {
		case -1:                                break;
		case 0xd: GProtectFaultHandle(tf);      break;
        case 0x20: timerInterruptHandle(tf);    break;
		case 0x80: syscallHandle(tf);           break;
		default: assert(0);
	}
}

void sys_exit(struct TrapFrame *tf) {
    struct ProcessTable* p = pcb_head, *q = pcb_head->next;
    if (pcb_head == pcb_run) {
        pcb_head = pcb_head->next;
        p->next = pcb_free;
        pcb_free = p;
    }
    else {
        while (q && q != pcb_run) {
            p = q;
            q = q->next;
        }
        p->next = q->next;
        q->next = pcb_free;
        pcb_free = q;
    }
    pcb_run->state = DEAD;
    pcb_run = NULL;
    schedule();
}

void sys_fork(struct TrapFrame *tf) {
    struct ProcessTable* p = NULL;
    addPcb(&p);

    uint32_t src = 0x200000 + NR_PCB(pcb_run) * PROC_MEMSZ;
    uint32_t dst = 0x200000 + NR_PCB(p) * PROC_MEMSZ;

    for (int i = 0; i < PROC_MEMSZ; i++)
        *((uint8_t*)dst + i) = *((uint8_t*)src + i);

    for (int i = 0; i < MAX_STACK_SIZE; i++)
        p->stack[i] = pcb_run->stack[i];

    memcpy(&p->tf, &pcb_run->tf, sizeof(struct TrapFrame));

    p->tf.eax = 0;

    pcb_run->tf.eax = p->pid;
    pcb_run->state = RUNNABLE;

    addToEnd(pcb_run);
    schedule();
}

void sys_write(struct TrapFrame* tf)  {
    asm volatile("mov %0, %%eax":: "r"(KSEL(SEG_VIDEO)));
    asm volatile("movw %ax, %gs");
    static int row = 0, col = 0;
    char c = '\0';
    tf->ecx += ((pcb_run - pcb) * PROC_MEMSZ);
    if(tf->ebx == 1 || tf->ebx == 2) {
        for(int i = 0; i < tf->edx; i++) {
            c = *(char*)(tf->ecx + i);
            putChar(c);
            if(c == '\n') {
                row++, col = 0;
                continue;
            }
            if(col == 80) {
                row++, col = 0;
            }
            video_print(row, col++, c);
        }
        tf->eax = tf->edx;
    }
    else
        assert(0);
}

void sys_sleep(struct TrapFrame* tf) {
    pcb_run->sleepTime = tf->ebx;
    pcb_run->state = BLOCKED;
    addToEnd(pcb_run);
    schedule();
}

void sys_sem_init(struct TrapFrame* tf) {
    // ebx: *sem  ecx: value
    tf->ebx += (NR_PCB(pcb_run) * PROC_MEMSZ);
    sem_t *sem = (sem_t*)tf->ebx;
    int value = tf->ecx;

    int k = addSem(value);
    *sem = k;
    tf->eax = k;
}

void sys_sem_post(struct TrapFrame* tf) {
    tf->ebx += (NR_PCB(pcb_run) * PROC_MEMSZ);
    sem_t *sem = (sem_t*)tf->ebx;
    struct Semaphore* s = &semList[*sem];
    V(s);
    tf->eax = 0;
}

void sys_sem_wait(struct TrapFrame* tf) {
    tf->ebx += (NR_PCB(pcb_run) * PROC_MEMSZ);
    sem_t *sem = (sem_t*)tf->ebx;
    struct Semaphore* s = &semList[*sem];
    P(s);
    tf->eax = 0;
}

void sys_sem_destroy(struct TrapFrame* tf) {
    tf->ebx += (NR_PCB(pcb_run) * PROC_MEMSZ);
    sem_t *sem = (sem_t*)tf->ebx;
    struct Semaphore* s = &semList[*sem];
    s->inuse = false;
    if (s->n > 0) {
        assert(0);
        tf->eax = -1;
    }
    else tf->eax = 0;
}




void syscallHandle(struct TrapFrame *tf) {
    switch (tf->eax) {
        case SYS_exit: sys_exit(tf); break; //1
        case SYS_fork: sys_fork(tf); break; //2
        case SYS_write: sys_write(tf); break; //4
        case SYS_sleep: sys_sleep(tf); break; //100
        case SYS_sem_init: sys_sem_init(tf); break; //101
        case SYS_sem_post: sys_sem_post(tf); break; //102
        case SYS_sem_wait: sys_sem_wait(tf); break; //103
        case SYS_sem_destroy: sys_sem_destroy(tf); break; //104
        default: assert(0);
    }
}

void timerInterruptHandle(struct TrapFrame *tf) {
    struct ProcessTable *p = pcb_head;
    while (p != NULL) {
        if (p->sleepTime > 0) {
            assert(p->state == BLOCKED);
            --(p->sleepTime);
            if (p->sleepTime == 0) {
                p->state = RUNNABLE;
            }
        }
        p = p->next;
    }

    if (pcb_run == NULL) {  // IDLE
        schedule();
        return;
    }

    pcb_run->timeCount--;
    if (pcb_run->timeCount == 0) {
        pcb_run->state = RUNNABLE;
        pcb_run->timeCount = 10;
        addToEnd(pcb_run);
        schedule();
    }
}

void GProtectFaultHandle(struct TrapFrame *tf) {
	assert(0);
}
