#include "common.h"
#include "x86.h"
#include "device.h"

void kEntry(void) {

	initSerial();// initialize serial port
	initIdt(); // initialize idt
	initIntr(); // iniialize 8259a
    initTimer();
	initSeg(); // initialize gdt, tss
    initPcb();
    //initIdlePcb();
    //initVga();
	loadUMain(); // load user program, enter user space

	while(1);
	assert(0);
}
