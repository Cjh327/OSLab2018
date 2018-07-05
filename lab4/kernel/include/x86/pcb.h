#ifndef __X86_PCB_H__
#define __X86_PCB_H__

#include <common.h>
#include "memory.h"

#define PROC_MEMSZ (1 << 16)
#define APP_START 0X200000

#define MAX_STACK_SIZE (16 << 10)
#define MAX_PCB_NUM 20

#define RUNNING 0
#define RUNNABLE 1
#define BLOCKED 2
#define DEAD 3

#define NR_PCB(p) (p - pcb)

struct ProcessTable {
    uint32_t stack[MAX_STACK_SIZE];     // 内核堆栈
    struct TrapFrame tf;
    int state;
    int timeCount;
    int sleepTime;
    uint32_t pid;
    struct ProcessTable* next;
};

struct ProcessTable pcb[MAX_PCB_NUM];

struct ProcessTable* pcb_head;
struct ProcessTable* pcb_free;
struct ProcessTable* pcb_run;

void initPcb();
void initIdlePcb();
void EnterUserPcb(uint32_t);
void schedule();
void addPcb(struct ProcessTable**);
void enterPcb(struct ProcessTable*);

void addToEnd(struct ProcessTable*);
uint32_t getPid(struct ProcessTable*);

#endif
