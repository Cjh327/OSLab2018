.code32

.global start
start:
    movl $((80*5+0)*2), %edi                #在第5行第0列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x48, %al                         #0x48为H的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+1)*2), %edi                #在第5行第1列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x45, %al                         #0x45为E的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+2)*2), %edi                #在第5行第2列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x4C, %al                         #0x4C为L的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+3)*2), %edi                #在第5行第3列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x4C, %al                         #0x4c为L的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+4)*2), %edi                #在第5行第4列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x4F, %al                         #0x4F为O的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+5)*2), %edi                #在第5行第5列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x2C, %al                         #0x2c为,的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+6)*2), %edi                #在第5行第6列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x57, %al                         #0x57为W的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+7)*2), %edi                #在第5行第7列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x4F, %al                         #0x4F为O的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+8)*2), %edi                #在第5行第7列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x52, %al                         #0x52为R的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+9)*2), %edi                #在第5行第8列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x4c, %al                         #0x4c为L的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+10)*2), %edi                #在第5行第9列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x44, %al                         #0x44为D的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    movl $((80*5+11)*2), %edi                #在第5行第10列打印
    movb $0x0c, %ah                         #黑底红字
    movb $0x21, %al                         #0x21为!的ASCII码
    movw %ax, %gs:(%edi)                    #写显存

    loop:
        jmp loop
