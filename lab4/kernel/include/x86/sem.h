#ifndef __X86_SEM_H__
#define __X86_SEM_H__

#include <common.h>
#include "memory.h"
#include <stdbool.h>

#define MAX_SEM_NUM 20

struct Semaphore {
    bool inuse;
    int val;
    struct ProcessTable* pcb[MAX_PCB_NUM];
    int n;
};

struct Semaphore semList[MAX_SEM_NUM];

void P(struct Semaphore* s);
void V(struct Semaphore* s);
void W(struct Semaphore* s);
void R(struct Semaphore* s);
void initSem();
int addSem(int val);

#endif
