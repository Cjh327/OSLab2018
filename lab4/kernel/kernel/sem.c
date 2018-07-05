#include "device.h"
#include "x86.h"

void P(struct Semaphore* s) {
    s->val--;
    if (s->val < 0)
        W(s);
}

void V(struct Semaphore* s) {
    s->val++;
    if (s->val <= 0)
        R(s);
}

void W(struct Semaphore* s) {
    s->pcb[s->n++] = pcb_run;
    pcb_run->state = BLOCKED;
    schedule();
}

void R(struct Semaphore* s) {
    struct ProcessTable* p = s->pcb[--s->n];
    p->state = RUNNABLE;
    p->timeCount = 10;
    pcb_run->state = RUNNABLE;
    schedule();
}

void initSem() {
    for (int i = 0; i < MAX_SEM_NUM; i++) {
        semList[i].inuse = false;
        semList[i].n = 0;
    }
}

int addSem(int val) {
    for (int i = 0; i < MAX_SEM_NUM; i++) {
        if (semList[i].inuse == false) {
            semList[i].inuse = true;
            semList[i].val = val;
            semList[i].n = 0;
            return i;
        }
    }
    return -1;
}
