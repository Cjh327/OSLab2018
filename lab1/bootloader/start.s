.code16

.global start
start:
    movw $message, %ax
    movw %ax, %bp
    movw $13, %cx                           #打印的字符串长度
    movw $0x1301, %ax                       #AH=0x13 打印字符串
    movw $0x000c, %bx                       #BH=0x00 黑底 BL=0x0c 红字
    movw $0x0000, %dx                       #在第0行0列开始打印
    int $0x10                               #陷入0x10号中断

    cli                             #关闭中断
    inb $0x92, %al                  #启动A20总线
    orb $0x02, %al
    outb %al, $0x92
    data32 addr32 lgdt gdtDesc      #加载GDTR
    movl %cr0, %eax                 #启动保护模式
    orb $0x01, %al
    movl %eax, %cr0
    data32 ljmp $0x08, $start32     #长跳转切换至保护模式

.code32
start32:
    movw    $(2 << 3), %ax
    movw    %ax, %ds                # %DS = %AX
    movw    %ax, %es                # %ES = %AX
    movw    %ax, %ss                # %SS = %AX
    movw    %ax, %fs                # %FS = %AX
    movw    $(3 << 3), %ax
    movw    %ax, %gs                # %GS = %AX

    movl    $0, %ebp
    movl    $(128 << 20), %esp

    jmp bootMain                    #跳转至bootMain函数 定义于boot.c

    message:
        .string "Hello, World!"

.p2align 2
gdt:
	.word 0,0                       # empty entry
	.byte 0,0,0,0

    .word 0xffff,0                  #代码段描述符
    .byte 0,0x9a,0xcf,0

    .word 0xffff,0                  #数据段描述符
    .byte 0,0x92,0xcf,0

    .word 0xffff,0x8000             #视频段描述符
    .byte 0x0b,0x92,0xcf,0

gdtDesc:
	.word (gdtDesc - gdt -1)
	.long gdt
