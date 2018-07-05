#include "lib.h"
#include "types.h"
#include <stdarg.h>

#define SYS_exit 1
#define SYS_fork 2
#define SYS_write 4
#define SYS_sleep 100

/*
 * io lib here
 * 库函数写在这
 */
int32_t syscall(int num, uint32_t a1,uint32_t a2,
		uint32_t a3, uint32_t a4, uint32_t a5)
{
	int32_t ret = 0;

	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/

    asm volatile("int $0x80": "=a"(ret) : "a"(num), "b"(a1), "c"(a2), "d"(a3), "D"(a4), "S"(a5));
	return ret;
}

void printc(char c) {
    syscall(SYS_write, 1, (uint32_t)&c, 1, 0, 0);
}

void prints(char* s) {
    int i = 0;
    while(s[i] != '\0')
        i++;
    syscall(SYS_write, 1, (uint32_t)s, i, 0, 0);
}

void printd(int d) {
    int len = 0;
    char buf[20];
    if(d == 0) {
        prints("0");
        return;
    }
    else if(d == 0x80000000) {
        prints("-2147483648");
        return;
    }
    else if(d < 0) {
        d = -d;
        printc('-');
    }
    while(d != 0) {
        buf[len++] = d % 10 + '0';
        d /= 10;
    }
    for(int j = 0, i = len - 1; j < i; j++, i--) {
        char tmp = buf[j];
        buf[j] = buf[i];
        buf[i] = tmp;
    }
    buf[len] = '\0';
    prints(buf);
}

void printx(unsigned int d) {
    if(d == 0) {
        prints("0");
        return;
    }
    int len = 0;
    char buf[20];
    while(d != 0) {
        unsigned int x = d % 16;
        if(x >= 10)
            buf[len++] = x - 10 + 'a';
        else
            buf[len++] = x + '0';
        d /= 16;
    }
     for(int j = 0, i = len - 1; j < i; j++, i--) {
        char tmp = buf[j];
        buf[j] = buf[i];
        buf[i] = tmp;
    }
    buf[len] = '\0';
    prints(buf);
}

void printf(const char *format,...){
    va_list ap;
    va_start(ap, format);
    if(!format)
        return;
    const char* p = format;
    while(*p) {
        if(*p == '%') {
            switch(*(++p)) {
                case 'c': printc(va_arg(ap, int)); break;
                case 'x': printx(va_arg(ap, int)); break;
                case 'd': printd(va_arg(ap, int)); break;
                case 's': prints(va_arg(ap, char*)); break;
            }
        }
        else
            printc(*p);
        p++;
    }
    va_end(ap);
}

int fork() {
    return syscall(SYS_fork, 1, 1, 1, 0, 0);
}

int sleep(uint32_t time) {
    return syscall(SYS_sleep, time, 1, 1, 0, 0);
}

int exit() {
    return syscall(SYS_exit, 1, 1, 1, 0, 0);
}
