
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <abort>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	57                   	push   %edi
  100004:	56                   	push   %esi
  100005:	53                   	push   %ebx
  100006:	83 ec 1c             	sub    $0x1c,%esp
  100009:	8b 55 08             	mov    0x8(%ebp),%edx
  10000c:	fa                   	cli    
  10000d:	8a 02                	mov    (%edx),%al
  10000f:	b9 12 22 10 00       	mov    $0x102212,%ecx
  100014:	84 c0                	test   %al,%al
  100016:	74 0b                	je     100023 <abort+0x23>
  100018:	41                   	inc    %ecx
  100019:	42                   	inc    %edx
  10001a:	88 41 ff             	mov    %al,-0x1(%ecx)
  10001d:	8a 02                	mov    (%edx),%al
  10001f:	84 c0                	test   %al,%al
  100021:	75 f5                	jne    100018 <abort+0x18>
  100023:	c6 01 3a             	movb   $0x3a,(%ecx)
  100026:	bb 1d 23 10 00       	mov    $0x10231d,%ebx
  10002b:	be 0a 00 00 00       	mov    $0xa,%esi
  100030:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100035:	4b                   	dec    %ebx
  100036:	8b 45 0c             	mov    0xc(%ebp),%eax
  100039:	99                   	cltd   
  10003a:	f7 fe                	idiv   %esi
  10003c:	8d 42 30             	lea    0x30(%edx),%eax
  10003f:	88 45 e7             	mov    %al,-0x19(%ebp)
  100042:	88 03                	mov    %al,(%ebx)
  100044:	89 f8                	mov    %edi,%eax
  100046:	f7 6d 0c             	imull  0xc(%ebp)
  100049:	c1 fa 02             	sar    $0x2,%edx
  10004c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10004f:	c1 f8 1f             	sar    $0x1f,%eax
  100052:	29 c2                	sub    %eax,%edx
  100054:	89 55 0c             	mov    %edx,0xc(%ebp)
  100057:	75 dc                	jne    100035 <abort+0x35>
  100059:	41                   	inc    %ecx
  10005a:	41                   	inc    %ecx
  10005b:	43                   	inc    %ebx
  10005c:	8a 45 e7             	mov    -0x19(%ebp),%al
  10005f:	88 41 ff             	mov    %al,-0x1(%ecx)
  100062:	8a 03                	mov    (%ebx),%al
  100064:	88 45 e7             	mov    %al,-0x19(%ebp)
  100067:	84 c0                	test   %al,%al
  100069:	75 ef                	jne    10005a <abort+0x5a>
  10006b:	c6 01 0a             	movb   $0xa,(%ecx)
  10006e:	0f be 05 00 22 10 00 	movsbl 0x102200,%eax
  100075:	84 c0                	test   %al,%al
  100077:	74 1b                	je     100094 <abort+0x94>
  100079:	bb 00 22 10 00       	mov    $0x102200,%ebx
  10007e:	83 ec 0c             	sub    $0xc,%esp
  100081:	50                   	push   %eax
  100082:	e8 c9 04 00 00       	call   100550 <putChar>
  100087:	43                   	inc    %ebx
  100088:	0f be 03             	movsbl (%ebx),%eax
  10008b:	83 c4 10             	add    $0x10,%esp
  10008e:	84 c0                	test   %al,%al
  100090:	75 ec                	jne    10007e <abort+0x7e>
  100092:	66 90                	xchg   %ax,%ax
  100094:	f4                   	hlt    
  100095:	eb fd                	jmp    100094 <abort+0x94>
  100097:	90                   	nop

00100098 <memcpy>:
  100098:	55                   	push   %ebp
  100099:	89 e5                	mov    %esp,%ebp
  10009b:	56                   	push   %esi
  10009c:	53                   	push   %ebx
  10009d:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1000a3:	8b 75 10             	mov    0x10(%ebp),%esi
  1000a6:	85 f6                	test   %esi,%esi
  1000a8:	74 0d                	je     1000b7 <memcpy+0x1f>
  1000aa:	31 d2                	xor    %edx,%edx
  1000ac:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  1000af:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  1000b2:	42                   	inc    %edx
  1000b3:	39 f2                	cmp    %esi,%edx
  1000b5:	75 f5                	jne    1000ac <memcpy+0x14>
  1000b7:	5b                   	pop    %ebx
  1000b8:	5e                   	pop    %esi
  1000b9:	5d                   	pop    %ebp
  1000ba:	c3                   	ret    
  1000bb:	90                   	nop

001000bc <sys_exit>:
  1000bc:	55                   	push   %ebp
  1000bd:	89 e5                	mov    %esp,%ebp
  1000bf:	53                   	push   %ebx
  1000c0:	a1 f0 24 15 00       	mov    0x1524f0,%eax
  1000c5:	8b 88 0c 40 00 00    	mov    0x400c(%eax),%ecx
  1000cb:	8b 1d 40 23 10 00    	mov    0x102340,%ebx
  1000d1:	8b 93 10 40 00 00    	mov    0x4010(%ebx),%edx
  1000d7:	3b 8b 0c 40 00 00    	cmp    0x400c(%ebx),%ecx
  1000dd:	74 61                	je     100140 <sys_exit+0x84>
  1000df:	85 d2                	test   %edx,%edx
  1000e1:	74 21                	je     100104 <sys_exit+0x48>
  1000e3:	3b 8a 0c 40 00 00    	cmp    0x400c(%edx),%ecx
  1000e9:	75 0f                	jne    1000fa <sys_exit+0x3e>
  1000eb:	eb 1e                	jmp    10010b <sys_exit+0x4f>
  1000ed:	8d 76 00             	lea    0x0(%esi),%esi
  1000f0:	3b 88 0c 40 00 00    	cmp    0x400c(%eax),%ecx
  1000f6:	74 18                	je     100110 <sys_exit+0x54>
  1000f8:	89 c2                	mov    %eax,%edx
  1000fa:	8b 82 10 40 00 00    	mov    0x4010(%edx),%eax
  100100:	85 c0                	test   %eax,%eax
  100102:	75 ec                	jne    1000f0 <sys_exit+0x34>
  100104:	a1 10 40 00 00       	mov    0x4010,%eax
  100109:	0f 0b                	ud2    
  10010b:	89 d0                	mov    %edx,%eax
  10010d:	89 da                	mov    %ebx,%edx
  10010f:	90                   	nop
  100110:	8b 88 10 40 00 00    	mov    0x4010(%eax),%ecx
  100116:	89 8a 10 40 00 00    	mov    %ecx,0x4010(%edx)
  10011c:	8b 15 44 23 10 00    	mov    0x102344,%edx
  100122:	89 90 10 40 00 00    	mov    %edx,0x4010(%eax)
  100128:	a3 44 23 10 00       	mov    %eax,0x102344
  10012d:	c7 05 f0 24 15 00 00 	movl   $0x0,0x1524f0
  100134:	00 00 00 
  100137:	5b                   	pop    %ebx
  100138:	5d                   	pop    %ebp
  100139:	e9 82 07 00 00       	jmp    1008c0 <schedule>
  10013e:	66 90                	xchg   %ax,%ax
  100140:	89 15 40 23 10 00    	mov    %edx,0x102340
  100146:	a1 44 23 10 00       	mov    0x102344,%eax
  10014b:	89 83 10 40 00 00    	mov    %eax,0x4010(%ebx)
  100151:	89 1d 44 23 10 00    	mov    %ebx,0x102344
  100157:	eb d4                	jmp    10012d <sys_exit+0x71>
  100159:	8d 76 00             	lea    0x0(%esi),%esi

0010015c <sys_fork>:
  10015c:	55                   	push   %ebp
  10015d:	89 e5                	mov    %esp,%ebp
  10015f:	57                   	push   %edi
  100160:	56                   	push   %esi
  100161:	53                   	push   %ebx
  100162:	83 ec 0c             	sub    $0xc,%esp
  100165:	e8 0e 09 00 00       	call   100a78 <newPcb>
  10016a:	89 c7                	mov    %eax,%edi
  10016c:	8b 15 f0 24 15 00    	mov    0x1524f0,%edx
  100172:	81 ea 60 23 10 00    	sub    $0x102360,%edx
  100178:	c1 fa 02             	sar    $0x2,%edx
  10017b:	8d 0c 92             	lea    (%edx,%edx,4),%ecx
  10017e:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
  100181:	89 d9                	mov    %ebx,%ecx
  100183:	c1 e1 0b             	shl    $0xb,%ecx
  100186:	29 d9                	sub    %ebx,%ecx
  100188:	01 c9                	add    %ecx,%ecx
  10018a:	01 d1                	add    %edx,%ecx
  10018c:	c1 e1 05             	shl    $0x5,%ecx
  10018f:	01 d1                	add    %edx,%ecx
  100191:	01 c9                	add    %ecx,%ecx
  100193:	01 d1                	add    %edx,%ecx
  100195:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  100198:	01 c9                	add    %ecx,%ecx
  10019a:	01 d1                	add    %edx,%ecx
  10019c:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  10019f:	01 c9                	add    %ecx,%ecx
  1001a1:	01 d1                	add    %edx,%ecx
  1001a3:	f7 d9                	neg    %ecx
  1001a5:	8d 49 20             	lea    0x20(%ecx),%ecx
  1001a8:	c1 e1 10             	shl    $0x10,%ecx
  1001ab:	89 c2                	mov    %eax,%edx
  1001ad:	81 ea 60 23 10 00    	sub    $0x102360,%edx
  1001b3:	c1 fa 02             	sar    $0x2,%edx
  1001b6:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
  1001b9:	8d 34 9a             	lea    (%edx,%ebx,4),%esi
  1001bc:	89 f3                	mov    %esi,%ebx
  1001be:	c1 e3 0b             	shl    $0xb,%ebx
  1001c1:	29 f3                	sub    %esi,%ebx
  1001c3:	01 db                	add    %ebx,%ebx
  1001c5:	01 d3                	add    %edx,%ebx
  1001c7:	c1 e3 05             	shl    $0x5,%ebx
  1001ca:	01 d3                	add    %edx,%ebx
  1001cc:	01 db                	add    %ebx,%ebx
  1001ce:	01 d3                	add    %edx,%ebx
  1001d0:	8d 1c da             	lea    (%edx,%ebx,8),%ebx
  1001d3:	01 db                	add    %ebx,%ebx
  1001d5:	01 d3                	add    %edx,%ebx
  1001d7:	8d 1c da             	lea    (%edx,%ebx,8),%ebx
  1001da:	01 db                	add    %ebx,%ebx
  1001dc:	01 d3                	add    %edx,%ebx
  1001de:	f7 db                	neg    %ebx
  1001e0:	8d 5b 20             	lea    0x20(%ebx),%ebx
  1001e3:	c1 e3 10             	shl    $0x10,%ebx
  1001e6:	31 d2                	xor    %edx,%edx
  1001e8:	8a 04 0a             	mov    (%edx,%ecx,1),%al
  1001eb:	88 04 1a             	mov    %al,(%edx,%ebx,1)
  1001ee:	42                   	inc    %edx
  1001ef:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
  1001f5:	75 f1                	jne    1001e8 <sys_fork+0x8c>
  1001f7:	8b 0d f0 24 15 00    	mov    0x1524f0,%ecx
  1001fd:	31 d2                	xor    %edx,%edx
  1001ff:	90                   	nop
  100200:	8a 04 11             	mov    (%ecx,%edx,1),%al
  100203:	88 04 17             	mov    %al,(%edi,%edx,1)
  100206:	42                   	inc    %edx
  100207:	81 fa 00 40 00 00    	cmp    $0x4000,%edx
  10020d:	75 f1                	jne    100200 <sys_fork+0xa4>
  10020f:	81 c1 b4 3f 00 00    	add    $0x3fb4,%ecx
  100215:	8d 9f b4 3f 00 00    	lea    0x3fb4(%edi),%ebx
  10021b:	31 d2                	xor    %edx,%edx
  10021d:	8d 76 00             	lea    0x0(%esi),%esi
  100220:	8a 04 11             	mov    (%ecx,%edx,1),%al
  100223:	88 04 13             	mov    %al,(%ebx,%edx,1)
  100226:	42                   	inc    %edx
  100227:	83 fa 4c             	cmp    $0x4c,%edx
  10022a:	75 f4                	jne    100220 <sys_fork+0xc4>
  10022c:	c7 87 e0 3f 00 00 00 	movl   $0x0,0x3fe0(%edi)
  100233:	00 00 00 
  100236:	8b 15 f0 24 15 00    	mov    0x1524f0,%edx
  10023c:	8b 87 0c 40 00 00    	mov    0x400c(%edi),%eax
  100242:	89 82 e0 3f 00 00    	mov    %eax,0x3fe0(%edx)
  100248:	c7 82 00 40 00 00 01 	movl   $0x1,0x4000(%edx)
  10024f:	00 00 00 
  100252:	83 c4 0c             	add    $0xc,%esp
  100255:	5b                   	pop    %ebx
  100256:	5e                   	pop    %esi
  100257:	5f                   	pop    %edi
  100258:	5d                   	pop    %ebp
  100259:	e9 62 06 00 00       	jmp    1008c0 <schedule>
  10025e:	66 90                	xchg   %ax,%ax

00100260 <sys_write>:
  100260:	55                   	push   %ebp
  100261:	89 e5                	mov    %esp,%ebp
  100263:	57                   	push   %edi
  100264:	56                   	push   %esi
  100265:	53                   	push   %ebx
  100266:	83 ec 1c             	sub    $0x1c,%esp
  100269:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10026c:	b8 38 00 00 00       	mov    $0x38,%eax
  100271:	89 c0                	mov    %eax,%eax
  100273:	8e e8                	mov    %eax,%gs
  100275:	a1 f0 24 15 00       	mov    0x1524f0,%eax
  10027a:	2d 60 23 10 00       	sub    $0x102360,%eax
  10027f:	c1 f8 02             	sar    $0x2,%eax
  100282:	8d 14 80             	lea    (%eax,%eax,4),%edx
  100285:	8d 0c 90             	lea    (%eax,%edx,4),%ecx
  100288:	89 ca                	mov    %ecx,%edx
  10028a:	c1 e2 0b             	shl    $0xb,%edx
  10028d:	29 ca                	sub    %ecx,%edx
  10028f:	01 d2                	add    %edx,%edx
  100291:	01 c2                	add    %eax,%edx
  100293:	c1 e2 05             	shl    $0x5,%edx
  100296:	01 c2                	add    %eax,%edx
  100298:	01 d2                	add    %edx,%edx
  10029a:	01 c2                	add    %eax,%edx
  10029c:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  10029f:	01 d2                	add    %edx,%edx
  1002a1:	01 c2                	add    %eax,%edx
  1002a3:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  1002a6:	01 d2                	add    %edx,%edx
  1002a8:	01 d0                	add    %edx,%eax
  1002aa:	f7 d8                	neg    %eax
  1002ac:	c1 e0 10             	shl    $0x10,%eax
  1002af:	03 43 28             	add    0x28(%ebx),%eax
  1002b2:	89 43 28             	mov    %eax,0x28(%ebx)
  1002b5:	8b 4b 20             	mov    0x20(%ebx),%ecx
  1002b8:	8d 51 ff             	lea    -0x1(%ecx),%edx
  1002bb:	83 fa 01             	cmp    $0x1,%edx
  1002be:	76 1c                	jbe    1002dc <sys_write+0x7c>
  1002c0:	83 ec 08             	sub    $0x8,%esp
  1002c3:	6a 6f                	push   $0x6f
  1002c5:	68 94 0d 10 00       	push   $0x100d94
  1002ca:	e8 31 fd ff ff       	call   100000 <abort>
  1002cf:	83 c4 10             	add    $0x10,%esp
  1002d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1002d5:	5b                   	pop    %ebx
  1002d6:	5e                   	pop    %esi
  1002d7:	5f                   	pop    %edi
  1002d8:	5d                   	pop    %ebp
  1002d9:	c3                   	ret    
  1002da:	66 90                	xchg   %ax,%ax
  1002dc:	8b 53 24             	mov    0x24(%ebx),%edx
  1002df:	85 d2                	test   %edx,%edx
  1002e1:	74 69                	je     10034c <sys_write+0xec>
  1002e3:	31 f6                	xor    %esi,%esi
  1002e5:	eb 31                	jmp    100318 <sys_write+0xb8>
  1002e7:	90                   	nop
  1002e8:	a1 20 23 10 00       	mov    0x102320,%eax
  1002ed:	83 f8 50             	cmp    $0x50,%eax
  1002f0:	74 66                	je     100358 <sys_write+0xf8>
  1002f2:	8d 48 01             	lea    0x1(%eax),%ecx
  1002f5:	8b 15 24 23 10 00    	mov    0x102324,%edx
  1002fb:	89 0d 20 23 10 00    	mov    %ecx,0x102320
  100301:	51                   	push   %ecx
  100302:	57                   	push   %edi
  100303:	50                   	push   %eax
  100304:	52                   	push   %edx
  100305:	e8 62 02 00 00       	call   10056c <video_print>
  10030a:	83 c4 10             	add    $0x10,%esp
  10030d:	46                   	inc    %esi
  10030e:	8b 53 24             	mov    0x24(%ebx),%edx
  100311:	39 d6                	cmp    %edx,%esi
  100313:	73 37                	jae    10034c <sys_write+0xec>
  100315:	8b 43 28             	mov    0x28(%ebx),%eax
  100318:	0f be 3c 06          	movsbl (%esi,%eax,1),%edi
  10031c:	89 f8                	mov    %edi,%eax
  10031e:	88 45 e7             	mov    %al,-0x19(%ebp)
  100321:	83 ec 0c             	sub    $0xc,%esp
  100324:	57                   	push   %edi
  100325:	e8 26 02 00 00       	call   100550 <putChar>
  10032a:	83 c4 10             	add    $0x10,%esp
  10032d:	8a 45 e7             	mov    -0x19(%ebp),%al
  100330:	3c 0a                	cmp    $0xa,%al
  100332:	75 b4                	jne    1002e8 <sys_write+0x88>
  100334:	ff 05 24 23 10 00    	incl   0x102324
  10033a:	c7 05 20 23 10 00 00 	movl   $0x0,0x102320
  100341:	00 00 00 
  100344:	46                   	inc    %esi
  100345:	8b 53 24             	mov    0x24(%ebx),%edx
  100348:	39 d6                	cmp    %edx,%esi
  10034a:	72 c9                	jb     100315 <sys_write+0xb5>
  10034c:	89 53 2c             	mov    %edx,0x2c(%ebx)
  10034f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100352:	5b                   	pop    %ebx
  100353:	5e                   	pop    %esi
  100354:	5f                   	pop    %edi
  100355:	5d                   	pop    %ebp
  100356:	c3                   	ret    
  100357:	90                   	nop
  100358:	a1 24 23 10 00       	mov    0x102324,%eax
  10035d:	8d 50 01             	lea    0x1(%eax),%edx
  100360:	89 15 24 23 10 00    	mov    %edx,0x102324
  100366:	b9 01 00 00 00       	mov    $0x1,%ecx
  10036b:	31 c0                	xor    %eax,%eax
  10036d:	eb 8c                	jmp    1002fb <sys_write+0x9b>
  10036f:	90                   	nop

00100370 <sys_sleep>:
  100370:	55                   	push   %ebp
  100371:	89 e5                	mov    %esp,%ebp
  100373:	83 ec 08             	sub    $0x8,%esp
  100376:	a1 f0 24 15 00       	mov    0x1524f0,%eax
  10037b:	8b 55 08             	mov    0x8(%ebp),%edx
  10037e:	8b 52 20             	mov    0x20(%edx),%edx
  100381:	89 90 08 40 00 00    	mov    %edx,0x4008(%eax)
  100387:	c7 80 00 40 00 00 02 	movl   $0x2,0x4000(%eax)
  10038e:	00 00 00 
  100391:	e8 2a 05 00 00       	call   1008c0 <schedule>
  100396:	83 ec 08             	sub    $0x8,%esp
  100399:	6a 76                	push   $0x76
  10039b:	68 94 0d 10 00       	push   $0x100d94
  1003a0:	e8 5b fc ff ff       	call   100000 <abort>
  1003a5:	83 c4 10             	add    $0x10,%esp
  1003a8:	c9                   	leave  
  1003a9:	c3                   	ret    
  1003aa:	66 90                	xchg   %ax,%ax

001003ac <syscallHandle>:
  1003ac:	55                   	push   %ebp
  1003ad:	89 e5                	mov    %esp,%ebp
  1003af:	83 ec 08             	sub    $0x8,%esp
  1003b2:	8b 55 08             	mov    0x8(%ebp),%edx
  1003b5:	8b 42 2c             	mov    0x2c(%edx),%eax
  1003b8:	83 f8 02             	cmp    $0x2,%eax
  1003bb:	74 43                	je     100400 <syscallHandle+0x54>
  1003bd:	76 1d                	jbe    1003dc <syscallHandle+0x30>
  1003bf:	83 f8 04             	cmp    $0x4,%eax
  1003c2:	74 0c                	je     1003d0 <syscallHandle+0x24>
  1003c4:	83 f8 64             	cmp    $0x64,%eax
  1003c7:	75 1f                	jne    1003e8 <syscallHandle+0x3c>
  1003c9:	89 55 08             	mov    %edx,0x8(%ebp)
  1003cc:	c9                   	leave  
  1003cd:	eb a1                	jmp    100370 <sys_sleep>
  1003cf:	90                   	nop
  1003d0:	89 55 08             	mov    %edx,0x8(%ebp)
  1003d3:	c9                   	leave  
  1003d4:	e9 87 fe ff ff       	jmp    100260 <sys_write>
  1003d9:	8d 76 00             	lea    0x0(%esi),%esi
  1003dc:	48                   	dec    %eax
  1003dd:	75 09                	jne    1003e8 <syscallHandle+0x3c>
  1003df:	89 55 08             	mov    %edx,0x8(%ebp)
  1003e2:	c9                   	leave  
  1003e3:	e9 d4 fc ff ff       	jmp    1000bc <sys_exit>
  1003e8:	83 ec 08             	sub    $0x8,%esp
  1003eb:	68 81 00 00 00       	push   $0x81
  1003f0:	68 94 0d 10 00       	push   $0x100d94
  1003f5:	e8 06 fc ff ff       	call   100000 <abort>
  1003fa:	83 c4 10             	add    $0x10,%esp
  1003fd:	c9                   	leave  
  1003fe:	c3                   	ret    
  1003ff:	90                   	nop
  100400:	89 55 08             	mov    %edx,0x8(%ebp)
  100403:	c9                   	leave  
  100404:	e9 53 fd ff ff       	jmp    10015c <sys_fork>
  100409:	8d 76 00             	lea    0x0(%esi),%esi

0010040c <timerInterruptHandle>:
  10040c:	55                   	push   %ebp
  10040d:	89 e5                	mov    %esp,%ebp
  10040f:	a1 40 23 10 00       	mov    0x102340,%eax
  100414:	85 c0                	test   %eax,%eax
  100416:	74 29                	je     100441 <timerInterruptHandle+0x35>
  100418:	8b 90 08 40 00 00    	mov    0x4008(%eax),%edx
  10041e:	85 d2                	test   %edx,%edx
  100420:	7e 15                	jle    100437 <timerInterruptHandle+0x2b>
  100422:	4a                   	dec    %edx
  100423:	89 90 08 40 00 00    	mov    %edx,0x4008(%eax)
  100429:	85 d2                	test   %edx,%edx
  10042b:	75 0a                	jne    100437 <timerInterruptHandle+0x2b>
  10042d:	c7 80 00 40 00 00 01 	movl   $0x1,0x4000(%eax)
  100434:	00 00 00 
  100437:	8b 80 10 40 00 00    	mov    0x4010(%eax),%eax
  10043d:	85 c0                	test   %eax,%eax
  10043f:	75 d7                	jne    100418 <timerInterruptHandle+0xc>
  100441:	8b 15 f0 24 15 00    	mov    0x1524f0,%edx
  100447:	85 d2                	test   %edx,%edx
  100449:	74 21                	je     10046c <timerInterruptHandle+0x60>
  10044b:	ff 8a 04 40 00 00    	decl   0x4004(%edx)
  100451:	74 05                	je     100458 <timerInterruptHandle+0x4c>
  100453:	5d                   	pop    %ebp
  100454:	c3                   	ret    
  100455:	8d 76 00             	lea    0x0(%esi),%esi
  100458:	c7 82 00 40 00 00 01 	movl   $0x1,0x4000(%edx)
  10045f:	00 00 00 
  100462:	c7 82 04 40 00 00 0a 	movl   $0xa,0x4004(%edx)
  100469:	00 00 00 
  10046c:	5d                   	pop    %ebp
  10046d:	e9 4e 04 00 00       	jmp    1008c0 <schedule>
  100472:	66 90                	xchg   %ax,%ax

00100474 <irqHandle>:
  100474:	55                   	push   %ebp
  100475:	89 e5                	mov    %esp,%ebp
  100477:	83 ec 08             	sub    $0x8,%esp
  10047a:	8b 55 08             	mov    0x8(%ebp),%edx
  10047d:	b8 10 00 00 00       	mov    $0x10,%eax
  100482:	89 c0                	mov    %eax,%eax
  100484:	8e d8                	mov    %eax,%ds
  100486:	8e e0                	mov    %eax,%fs
  100488:	8e c0                	mov    %eax,%es
  10048a:	b8 38 00 00 00       	mov    $0x38,%eax
  10048f:	89 c0                	mov    %eax,%eax
  100491:	8e e8                	mov    %eax,%gs
  100493:	8b 42 30             	mov    0x30(%edx),%eax
  100496:	83 f8 20             	cmp    $0x20,%eax
  100499:	74 4d                	je     1004e8 <irqHandle+0x74>
  10049b:	76 2f                	jbe    1004cc <irqHandle+0x58>
  10049d:	3d 80 00 00 00       	cmp    $0x80,%eax
  1004a2:	74 08                	je     1004ac <irqHandle+0x38>
  1004a4:	40                   	inc    %eax
  1004a5:	75 11                	jne    1004b8 <irqHandle+0x44>
  1004a7:	c9                   	leave  
  1004a8:	c3                   	ret    
  1004a9:	8d 76 00             	lea    0x0(%esi),%esi
  1004ac:	89 55 08             	mov    %edx,0x8(%ebp)
  1004af:	c9                   	leave  
  1004b0:	e9 f7 fe ff ff       	jmp    1003ac <syscallHandle>
  1004b5:	8d 76 00             	lea    0x0(%esi),%esi
  1004b8:	83 ec 08             	sub    $0x8,%esp
  1004bb:	6a 2a                	push   $0x2a
  1004bd:	68 94 0d 10 00       	push   $0x100d94
  1004c2:	e8 39 fb ff ff       	call   100000 <abort>
  1004c7:	83 c4 10             	add    $0x10,%esp
  1004ca:	c9                   	leave  
  1004cb:	c3                   	ret    
  1004cc:	83 f8 0d             	cmp    $0xd,%eax
  1004cf:	75 e7                	jne    1004b8 <irqHandle+0x44>
  1004d1:	83 ec 08             	sub    $0x8,%esp
  1004d4:	68 a3 00 00 00       	push   $0xa3
  1004d9:	68 94 0d 10 00       	push   $0x100d94
  1004de:	e8 1d fb ff ff       	call   100000 <abort>
  1004e3:	83 c4 10             	add    $0x10,%esp
  1004e6:	c9                   	leave  
  1004e7:	c3                   	ret    
  1004e8:	89 55 08             	mov    %edx,0x8(%ebp)
  1004eb:	c9                   	leave  
  1004ec:	e9 1b ff ff ff       	jmp    10040c <timerInterruptHandle>
  1004f1:	8d 76 00             	lea    0x0(%esi),%esi

001004f4 <GProtectFaultHandle>:
  1004f4:	55                   	push   %ebp
  1004f5:	89 e5                	mov    %esp,%ebp
  1004f7:	83 ec 10             	sub    $0x10,%esp
  1004fa:	68 a3 00 00 00       	push   $0xa3
  1004ff:	68 94 0d 10 00       	push   $0x100d94
  100504:	e8 f7 fa ff ff       	call   100000 <abort>
  100509:	83 c4 10             	add    $0x10,%esp
  10050c:	c9                   	leave  
  10050d:	c3                   	ret    
  10050e:	66 90                	xchg   %ax,%ax

00100510 <initSerial>:
  100510:	55                   	push   %ebp
  100511:	89 e5                	mov    %esp,%ebp
  100513:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100518:	31 c0                	xor    %eax,%eax
  10051a:	ee                   	out    %al,(%dx)
  10051b:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100520:	b0 80                	mov    $0x80,%al
  100522:	ee                   	out    %al,(%dx)
  100523:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100528:	b0 01                	mov    $0x1,%al
  10052a:	ee                   	out    %al,(%dx)
  10052b:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100530:	31 c0                	xor    %eax,%eax
  100532:	ee                   	out    %al,(%dx)
  100533:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100538:	b0 03                	mov    $0x3,%al
  10053a:	ee                   	out    %al,(%dx)
  10053b:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100540:	b0 c7                	mov    $0xc7,%al
  100542:	ee                   	out    %al,(%dx)
  100543:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100548:	b0 0b                	mov    $0xb,%al
  10054a:	ee                   	out    %al,(%dx)
  10054b:	5d                   	pop    %ebp
  10054c:	c3                   	ret    
  10054d:	8d 76 00             	lea    0x0(%esi),%esi

00100550 <putChar>:
  100550:	55                   	push   %ebp
  100551:	89 e5                	mov    %esp,%ebp
  100553:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100556:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10055b:	90                   	nop
  10055c:	ec                   	in     (%dx),%al
  10055d:	a8 20                	test   $0x20,%al
  10055f:	74 fb                	je     10055c <putChar+0xc>
  100561:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100566:	88 c8                	mov    %cl,%al
  100568:	ee                   	out    %al,(%dx)
  100569:	5d                   	pop    %ebp
  10056a:	c3                   	ret    
  10056b:	90                   	nop

0010056c <video_print>:
  10056c:	55                   	push   %ebp
  10056d:	89 e5                	mov    %esp,%ebp
  10056f:	8b 45 08             	mov    0x8(%ebp),%eax
  100572:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100575:	c1 e0 04             	shl    $0x4,%eax
  100578:	03 45 0c             	add    0xc(%ebp),%eax
  10057b:	8d 84 00 00 80 0b 00 	lea    0xb8000(%eax,%eax,1),%eax
  100582:	8b 55 10             	mov    0x10(%ebp),%edx
  100585:	88 10                	mov    %dl,(%eax)
  100587:	c6 40 01 0c          	movb   $0xc,0x1(%eax)
  10058b:	5d                   	pop    %ebp
  10058c:	c3                   	ret    
  10058d:	66 90                	xchg   %ax,%ax
  10058f:	90                   	nop

00100590 <waitDisk>:
  100590:	55                   	push   %ebp
  100591:	89 e5                	mov    %esp,%ebp
  100593:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100598:	ec                   	in     (%dx),%al
  100599:	83 e0 c0             	and    $0xffffffc0,%eax
  10059c:	3c 40                	cmp    $0x40,%al
  10059e:	75 f8                	jne    100598 <waitDisk+0x8>
  1005a0:	5d                   	pop    %ebp
  1005a1:	c3                   	ret    
  1005a2:	66 90                	xchg   %ax,%ax

001005a4 <readSect>:
  1005a4:	55                   	push   %ebp
  1005a5:	89 e5                	mov    %esp,%ebp
  1005a7:	53                   	push   %ebx
  1005a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1005ab:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1005b0:	ec                   	in     (%dx),%al
  1005b1:	83 e0 c0             	and    $0xffffffc0,%eax
  1005b4:	3c 40                	cmp    $0x40,%al
  1005b6:	75 f8                	jne    1005b0 <readSect+0xc>
  1005b8:	ba f2 01 00 00       	mov    $0x1f2,%edx
  1005bd:	b0 01                	mov    $0x1,%al
  1005bf:	ee                   	out    %al,(%dx)
  1005c0:	ba f3 01 00 00       	mov    $0x1f3,%edx
  1005c5:	88 c8                	mov    %cl,%al
  1005c7:	ee                   	out    %al,(%dx)
  1005c8:	89 c8                	mov    %ecx,%eax
  1005ca:	c1 f8 08             	sar    $0x8,%eax
  1005cd:	ba f4 01 00 00       	mov    $0x1f4,%edx
  1005d2:	ee                   	out    %al,(%dx)
  1005d3:	89 c8                	mov    %ecx,%eax
  1005d5:	c1 f8 10             	sar    $0x10,%eax
  1005d8:	ba f5 01 00 00       	mov    $0x1f5,%edx
  1005dd:	ee                   	out    %al,(%dx)
  1005de:	89 c8                	mov    %ecx,%eax
  1005e0:	c1 f8 18             	sar    $0x18,%eax
  1005e3:	83 c8 e0             	or     $0xffffffe0,%eax
  1005e6:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1005eb:	ee                   	out    %al,(%dx)
  1005ec:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1005f1:	b0 20                	mov    $0x20,%al
  1005f3:	ee                   	out    %al,(%dx)
  1005f4:	ec                   	in     (%dx),%al
  1005f5:	83 e0 c0             	and    $0xffffffc0,%eax
  1005f8:	3c 40                	cmp    $0x40,%al
  1005fa:	75 f8                	jne    1005f4 <readSect+0x50>
  1005fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1005ff:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100605:	ba f0 01 00 00       	mov    $0x1f0,%edx
  10060a:	66 90                	xchg   %ax,%ax
  10060c:	ed                   	in     (%dx),%eax
  10060d:	89 01                	mov    %eax,(%ecx)
  10060f:	83 c1 04             	add    $0x4,%ecx
  100612:	39 d9                	cmp    %ebx,%ecx
  100614:	75 f6                	jne    10060c <readSect+0x68>
  100616:	5b                   	pop    %ebx
  100617:	5d                   	pop    %ebp
  100618:	c3                   	ret    
  100619:	8d 76 00             	lea    0x0(%esi),%esi

0010061c <initSeg>:
  10061c:	55                   	push   %ebp
  10061d:	89 e5                	mov    %esp,%ebp
  10061f:	b9 00 25 15 00       	mov    $0x152500,%ecx
  100624:	66 c7 05 08 25 15 00 	movw   $0xffff,0x152508
  10062b:	ff ff 
  10062d:	66 c7 05 0a 25 15 00 	movw   $0x0,0x15250a
  100634:	00 00 
  100636:	c6 05 0c 25 15 00 00 	movb   $0x0,0x15250c
  10063d:	c6 05 0d 25 15 00 9a 	movb   $0x9a,0x15250d
  100644:	c6 05 0e 25 15 00 cf 	movb   $0xcf,0x15250e
  10064b:	c6 05 0f 25 15 00 00 	movb   $0x0,0x15250f
  100652:	66 c7 05 10 25 15 00 	movw   $0xffff,0x152510
  100659:	ff ff 
  10065b:	66 c7 05 12 25 15 00 	movw   $0x0,0x152512
  100662:	00 00 
  100664:	c6 05 14 25 15 00 00 	movb   $0x0,0x152514
  10066b:	c6 05 15 25 15 00 92 	movb   $0x92,0x152515
  100672:	c6 05 16 25 15 00 cf 	movb   $0xcf,0x152516
  100679:	c6 05 17 25 15 00 00 	movb   $0x0,0x152517
  100680:	66 c7 05 20 25 15 00 	movw   $0xffff,0x152520
  100687:	ff ff 
  100689:	66 c7 05 22 25 15 00 	movw   $0x0,0x152522
  100690:	00 00 
  100692:	c6 05 24 25 15 00 00 	movb   $0x0,0x152524
  100699:	c6 05 25 25 15 00 fa 	movb   $0xfa,0x152525
  1006a0:	c6 05 26 25 15 00 cf 	movb   $0xcf,0x152526
  1006a7:	c6 05 27 25 15 00 00 	movb   $0x0,0x152527
  1006ae:	66 c7 05 18 25 15 00 	movw   $0xffff,0x152518
  1006b5:	ff ff 
  1006b7:	66 c7 05 1a 25 15 00 	movw   $0x0,0x15251a
  1006be:	00 00 
  1006c0:	c6 05 1c 25 15 00 00 	movb   $0x0,0x15251c
  1006c7:	c6 05 1d 25 15 00 92 	movb   $0x92,0x15251d
  1006ce:	c6 05 1e 25 15 00 cf 	movb   $0xcf,0x15251e
  1006d5:	c6 05 1f 25 15 00 00 	movb   $0x0,0x15251f
  1006dc:	66 c7 05 28 25 15 00 	movw   $0xffff,0x152528
  1006e3:	ff ff 
  1006e5:	66 c7 05 2a 25 15 00 	movw   $0x0,0x15252a
  1006ec:	00 00 
  1006ee:	c6 05 2c 25 15 00 00 	movb   $0x0,0x15252c
  1006f5:	c6 05 2d 25 15 00 f2 	movb   $0xf2,0x15252d
  1006fc:	c6 05 2e 25 15 00 cf 	movb   $0xcf,0x15252e
  100703:	c6 05 2f 25 15 00 00 	movb   $0x0,0x15252f
  10070a:	66 c7 05 30 25 15 00 	movw   $0x63,0x152530
  100711:	63 00 
  100713:	b8 40 25 15 00       	mov    $0x152540,%eax
  100718:	66 a3 32 25 15 00    	mov    %ax,0x152532
  10071e:	89 c2                	mov    %eax,%edx
  100720:	c1 ea 10             	shr    $0x10,%edx
  100723:	88 15 34 25 15 00    	mov    %dl,0x152534
  100729:	c6 05 35 25 15 00 89 	movb   $0x89,0x152535
  100730:	c6 05 36 25 15 00 40 	movb   $0x40,0x152536
  100737:	c1 e8 18             	shr    $0x18,%eax
  10073a:	a2 37 25 15 00       	mov    %al,0x152537
  10073f:	a1 a8 0d 10 00       	mov    0x100da8,%eax
  100744:	8b 15 ac 0d 10 00    	mov    0x100dac,%edx
  10074a:	a3 38 25 15 00       	mov    %eax,0x152538
  10074f:	89 15 3c 25 15 00    	mov    %edx,0x15253c
  100755:	66 c7 05 28 23 10 00 	movw   $0x3f,0x102328
  10075c:	3f 00 
  10075e:	66 89 0d 2a 23 10 00 	mov    %cx,0x10232a
  100765:	c1 e9 10             	shr    $0x10,%ecx
  100768:	66 89 0d 2c 23 10 00 	mov    %cx,0x10232c
  10076f:	b8 28 23 10 00       	mov    $0x102328,%eax
  100774:	0f 01 10             	lgdtl  (%eax)
  100777:	c7 05 44 25 15 00 60 	movl   $0x106360,0x152544
  10077e:	63 10 00 
  100781:	c7 05 48 25 15 00 10 	movl   $0x10,0x152548
  100788:	00 00 00 
  10078b:	b8 30 00 00 00       	mov    $0x30,%eax
  100790:	0f 00 d8             	ltr    %ax
  100793:	b8 10 00 00 00       	mov    $0x10,%eax
  100798:	89 c0                	mov    %eax,%eax
  10079a:	8e d8                	mov    %eax,%ds
  10079c:	8e c0                	mov    %eax,%es
  10079e:	8e d0                	mov    %eax,%ss
  1007a0:	8e e0                	mov    %eax,%fs
  1007a2:	b8 38 00 00 00       	mov    $0x38,%eax
  1007a7:	89 c0                	mov    %eax,%eax
  1007a9:	8e e8                	mov    %eax,%gs
  1007ab:	31 c0                	xor    %eax,%eax
  1007ad:	0f 00 d0             	lldt   %ax
  1007b0:	5d                   	pop    %ebp
  1007b1:	c3                   	ret    
  1007b2:	66 90                	xchg   %ax,%ax

001007b4 <enterUserSpace>:
  1007b4:	55                   	push   %ebp
  1007b5:	89 e5                	mov    %esp,%ebp
  1007b7:	b8 2b 00 00 00       	mov    $0x2b,%eax
  1007bc:	50                   	push   %eax
  1007bd:	b8 00 00 00 08       	mov    $0x8000000,%eax
  1007c2:	50                   	push   %eax
  1007c3:	9c                   	pushf  
  1007c4:	b8 23 00 00 00       	mov    $0x23,%eax
  1007c9:	50                   	push   %eax
  1007ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1007cd:	50                   	push   %eax
  1007ce:	cf                   	iret   
  1007cf:	5d                   	pop    %ebp
  1007d0:	c3                   	ret    
  1007d1:	8d 76 00             	lea    0x0(%esi),%esi

001007d4 <loadUMain>:
  1007d4:	55                   	push   %ebp
  1007d5:	89 e5                	mov    %esp,%ebp
  1007d7:	57                   	push   %edi
  1007d8:	56                   	push   %esi
  1007d9:	53                   	push   %ebx
  1007da:	83 ec 0c             	sub    $0xc,%esp
  1007dd:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1007e2:	be 00 00 00 05       	mov    $0x5000000,%esi
  1007e7:	90                   	nop
  1007e8:	53                   	push   %ebx
  1007e9:	56                   	push   %esi
  1007ea:	e8 b5 fd ff ff       	call   1005a4 <readSect>
  1007ef:	81 c6 00 02 00 00    	add    $0x200,%esi
  1007f5:	43                   	inc    %ebx
  1007f6:	58                   	pop    %eax
  1007f7:	5a                   	pop    %edx
  1007f8:	81 fb fb 00 00 00    	cmp    $0xfb,%ebx
  1007fe:	75 e8                	jne    1007e8 <loadUMain+0x14>
  100800:	a1 1c 00 00 05       	mov    0x500001c,%eax
  100805:	8d 90 00 00 00 05    	lea    0x5000000(%eax),%edx
  10080b:	31 db                	xor    %ebx,%ebx
  10080d:	66 83 3d 2c 00 00 05 	cmpw   $0x0,0x500002c
  100814:	00 
  100815:	75 14                	jne    10082b <loadUMain+0x57>
  100817:	eb 69                	jmp    100882 <loadUMain+0xae>
  100819:	8d 76 00             	lea    0x0(%esi),%esi
  10081c:	83 c2 20             	add    $0x20,%edx
  10081f:	43                   	inc    %ebx
  100820:	0f b7 05 2c 00 00 05 	movzwl 0x500002c,%eax
  100827:	39 d8                	cmp    %ebx,%eax
  100829:	7e 57                	jle    100882 <loadUMain+0xae>
  10082b:	83 3a 01             	cmpl   $0x1,(%edx)
  10082e:	75 ec                	jne    10081c <loadUMain+0x48>
  100830:	8b 42 08             	mov    0x8(%edx),%eax
  100833:	8b 7a 04             	mov    0x4(%edx),%edi
  100836:	8b 4a 10             	mov    0x10(%edx),%ecx
  100839:	01 c1                	add    %eax,%ecx
  10083b:	39 c8                	cmp    %ecx,%eax
  10083d:	73 59                	jae    100898 <loadUMain+0xc4>
  10083f:	29 c7                	sub    %eax,%edi
  100841:	8d 76 00             	lea    0x0(%esi),%esi
  100844:	40                   	inc    %eax
  100845:	8a 8c 07 ff ff ff 04 	mov    0x4ffffff(%edi,%eax,1),%cl
  10084c:	88 48 ff             	mov    %cl,-0x1(%eax)
  10084f:	8b 4a 08             	mov    0x8(%edx),%ecx
  100852:	8b 72 10             	mov    0x10(%edx),%esi
  100855:	01 ce                	add    %ecx,%esi
  100857:	39 c6                	cmp    %eax,%esi
  100859:	77 e9                	ja     100844 <loadUMain+0x70>
  10085b:	03 4a 14             	add    0x14(%edx),%ecx
  10085e:	39 c8                	cmp    %ecx,%eax
  100860:	73 ba                	jae    10081c <loadUMain+0x48>
  100862:	66 90                	xchg   %ax,%ax
  100864:	40                   	inc    %eax
  100865:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
  100869:	8b 4a 14             	mov    0x14(%edx),%ecx
  10086c:	03 4a 08             	add    0x8(%edx),%ecx
  10086f:	39 c1                	cmp    %eax,%ecx
  100871:	77 f1                	ja     100864 <loadUMain+0x90>
  100873:	83 c2 20             	add    $0x20,%edx
  100876:	43                   	inc    %ebx
  100877:	0f b7 05 2c 00 00 05 	movzwl 0x500002c,%eax
  10087e:	39 d8                	cmp    %ebx,%eax
  100880:	7f a9                	jg     10082b <loadUMain+0x57>
  100882:	83 ec 0c             	sub    $0xc,%esp
  100885:	ff 35 18 00 00 05    	pushl  0x5000018
  10088b:	e8 d8 02 00 00       	call   100b68 <EnterUserPcb>
  100890:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100893:	5b                   	pop    %ebx
  100894:	5e                   	pop    %esi
  100895:	5f                   	pop    %edi
  100896:	5d                   	pop    %ebp
  100897:	c3                   	ret    
  100898:	89 c1                	mov    %eax,%ecx
  10089a:	eb bf                	jmp    10085b <loadUMain+0x87>

0010089c <initTimer>:
  10089c:	55                   	push   %ebp
  10089d:	89 e5                	mov    %esp,%ebp
  10089f:	ba 43 00 00 00       	mov    $0x43,%edx
  1008a4:	b0 34                	mov    $0x34,%al
  1008a6:	ee                   	out    %al,(%dx)
  1008a7:	ba 40 00 00 00       	mov    $0x40,%edx
  1008ac:	b0 9b                	mov    $0x9b,%al
  1008ae:	ee                   	out    %al,(%dx)
  1008af:	b0 2e                	mov    $0x2e,%al
  1008b1:	ee                   	out    %al,(%dx)
  1008b2:	5d                   	pop    %ebp
  1008b3:	c3                   	ret    

001008b4 <IDLE>:
  1008b4:	55                   	push   %ebp
  1008b5:	89 e5                	mov    %esp,%ebp
  1008b7:	bc 00 00 20 00       	mov    $0x200000,%esp
  1008bc:	fb                   	sti    
  1008bd:	f4                   	hlt    
  1008be:	5d                   	pop    %ebp
  1008bf:	c3                   	ret    

001008c0 <schedule>:
  1008c0:	55                   	push   %ebp
  1008c1:	89 e5                	mov    %esp,%ebp
  1008c3:	53                   	push   %ebx
  1008c4:	83 ec 10             	sub    $0x10,%esp
  1008c7:	6a 61                	push   $0x61
  1008c9:	e8 82 fc ff ff       	call   100550 <putChar>
  1008ce:	a1 f0 24 15 00       	mov    0x1524f0,%eax
  1008d3:	8b 80 0c 40 00 00    	mov    0x400c(%eax),%eax
  1008d9:	83 c0 48             	add    $0x48,%eax
  1008dc:	0f be c0             	movsbl %al,%eax
  1008df:	89 04 24             	mov    %eax,(%esp)
  1008e2:	e8 69 fc ff ff       	call   100550 <putChar>
  1008e7:	8b 1d f0 24 15 00    	mov    0x1524f0,%ebx
  1008ed:	83 c4 10             	add    $0x10,%esp
  1008f0:	85 db                	test   %ebx,%ebx
  1008f2:	0f 84 5c 01 00 00    	je     100a54 <schedule+0x194>
  1008f8:	8b 83 10 40 00 00    	mov    0x4010(%ebx),%eax
  1008fe:	85 c0                	test   %eax,%eax
  100900:	0f 84 4e 01 00 00    	je     100a54 <schedule+0x194>
  100906:	a3 40 23 10 00       	mov    %eax,0x102340
  10090b:	89 c1                	mov    %eax,%ecx
  10090d:	eb 03                	jmp    100912 <schedule+0x52>
  10090f:	90                   	nop
  100910:	89 d1                	mov    %edx,%ecx
  100912:	8b 91 10 40 00 00    	mov    0x4010(%ecx),%edx
  100918:	85 d2                	test   %edx,%edx
  10091a:	75 f4                	jne    100910 <schedule+0x50>
  10091c:	89 99 10 40 00 00    	mov    %ebx,0x4010(%ecx)
  100922:	c7 83 10 40 00 00 00 	movl   $0x0,0x4010(%ebx)
  100929:	00 00 00 
  10092c:	eb 10                	jmp    10093e <schedule+0x7e>
  10092e:	66 90                	xchg   %ax,%ax
  100930:	8b 80 10 40 00 00    	mov    0x4010(%eax),%eax
  100936:	85 c0                	test   %eax,%eax
  100938:	0f 84 23 01 00 00    	je     100a61 <schedule+0x1a1>
  10093e:	83 b8 00 40 00 00 01 	cmpl   $0x1,0x4000(%eax)
  100945:	75 e9                	jne    100930 <schedule+0x70>
  100947:	a3 f0 24 15 00       	mov    %eax,0x1524f0
  10094c:	83 ec 0c             	sub    $0xc,%esp
  10094f:	6a 62                	push   $0x62
  100951:	e8 fa fb ff ff       	call   100550 <putChar>
  100956:	a1 f0 24 15 00       	mov    0x1524f0,%eax
  10095b:	8b 80 0c 40 00 00    	mov    0x400c(%eax),%eax
  100961:	83 c0 48             	add    $0x48,%eax
  100964:	0f be c0             	movsbl %al,%eax
  100967:	89 04 24             	mov    %eax,(%esp)
  10096a:	e8 e1 fb ff ff       	call   100550 <putChar>
  10096f:	8b 15 f0 24 15 00    	mov    0x1524f0,%edx
  100975:	c7 82 00 40 00 00 00 	movl   $0x0,0x4000(%edx)
  10097c:	00 00 00 
  10097f:	8d 82 00 40 00 00    	lea    0x4000(%edx),%eax
  100985:	a3 44 25 15 00       	mov    %eax,0x152544
  10098a:	c7 05 48 25 15 00 10 	movl   $0x10,0x152548
  100991:	00 00 00 
  100994:	89 d0                	mov    %edx,%eax
  100996:	2d 60 23 10 00       	sub    $0x102360,%eax
  10099b:	c1 f8 02             	sar    $0x2,%eax
  10099e:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  1009a1:	8d 1c 88             	lea    (%eax,%ecx,4),%ebx
  1009a4:	89 d9                	mov    %ebx,%ecx
  1009a6:	c1 e1 0b             	shl    $0xb,%ecx
  1009a9:	29 d9                	sub    %ebx,%ecx
  1009ab:	01 c9                	add    %ecx,%ecx
  1009ad:	01 c1                	add    %eax,%ecx
  1009af:	c1 e1 05             	shl    $0x5,%ecx
  1009b2:	01 c1                	add    %eax,%ecx
  1009b4:	01 c9                	add    %ecx,%ecx
  1009b6:	01 c1                	add    %eax,%ecx
  1009b8:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
  1009bb:	01 c9                	add    %ecx,%ecx
  1009bd:	01 c1                	add    %eax,%ecx
  1009bf:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
  1009c2:	01 c9                	add    %ecx,%ecx
  1009c4:	01 c8                	add    %ecx,%eax
  1009c6:	f7 d8                	neg    %eax
  1009c8:	c1 e0 10             	shl    $0x10,%eax
  1009cb:	89 c1                	mov    %eax,%ecx
  1009cd:	c1 e9 10             	shr    $0x10,%ecx
  1009d0:	c1 e8 18             	shr    $0x18,%eax
  1009d3:	66 c7 05 20 25 15 00 	movw   $0xffff,0x152520
  1009da:	ff ff 
  1009dc:	66 c7 05 22 25 15 00 	movw   $0x0,0x152522
  1009e3:	00 00 
  1009e5:	88 0d 24 25 15 00    	mov    %cl,0x152524
  1009eb:	c6 05 25 25 15 00 fa 	movb   $0xfa,0x152525
  1009f2:	c6 05 26 25 15 00 cf 	movb   $0xcf,0x152526
  1009f9:	a2 27 25 15 00       	mov    %al,0x152527
  1009fe:	66 c7 05 28 25 15 00 	movw   $0xffff,0x152528
  100a05:	ff ff 
  100a07:	66 c7 05 2a 25 15 00 	movw   $0x0,0x15252a
  100a0e:	00 00 
  100a10:	88 0d 2c 25 15 00    	mov    %cl,0x15252c
  100a16:	c6 05 2d 25 15 00 f2 	movb   $0xf2,0x15252d
  100a1d:	c6 05 2e 25 15 00 cf 	movb   $0xcf,0x15252e
  100a24:	a2 2f 25 15 00       	mov    %al,0x15252f
  100a29:	50                   	push   %eax
  100a2a:	b8 2b 00 00 00       	mov    $0x2b,%eax
  100a2f:	89 c0                	mov    %eax,%eax
  100a31:	8e d8                	mov    %eax,%ds
  100a33:	8e c0                	mov    %eax,%es
  100a35:	58                   	pop    %eax
  100a36:	81 c2 b4 3f 00 00    	add    $0x3fb4,%edx
  100a3c:	89 d4                	mov    %edx,%esp
  100a3e:	0f a9                	pop    %gs
  100a40:	0f a1                	pop    %fs
  100a42:	07                   	pop    %es
  100a43:	1f                   	pop    %ds
  100a44:	61                   	popa   
  100a45:	83 c4 04             	add    $0x4,%esp
  100a48:	83 c4 04             	add    $0x4,%esp
  100a4b:	cf                   	iret   
  100a4c:	83 c4 10             	add    $0x10,%esp
  100a4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a52:	c9                   	leave  
  100a53:	c3                   	ret    
  100a54:	a1 40 23 10 00       	mov    0x102340,%eax
  100a59:	85 c0                	test   %eax,%eax
  100a5b:	0f 85 dd fe ff ff    	jne    10093e <schedule+0x7e>
  100a61:	c7 05 f0 24 15 00 00 	movl   $0x0,0x1524f0
  100a68:	00 00 00 
  100a6b:	bc 00 00 20 00       	mov    $0x200000,%esp
  100a70:	fb                   	sti    
  100a71:	f4                   	hlt    
  100a72:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a75:	c9                   	leave  
  100a76:	c3                   	ret    
  100a77:	90                   	nop

00100a78 <newPcb>:
  100a78:	55                   	push   %ebp
  100a79:	89 e5                	mov    %esp,%ebp
  100a7b:	53                   	push   %ebx
  100a7c:	a1 44 23 10 00       	mov    0x102344,%eax
  100a81:	8b 90 10 40 00 00    	mov    0x4010(%eax),%edx
  100a87:	89 15 44 23 10 00    	mov    %edx,0x102344
  100a8d:	c7 80 10 40 00 00 00 	movl   $0x0,0x4010(%eax)
  100a94:	00 00 00 
  100a97:	c7 80 00 40 00 00 01 	movl   $0x1,0x4000(%eax)
  100a9e:	00 00 00 
  100aa1:	c7 80 04 40 00 00 0a 	movl   $0xa,0x4004(%eax)
  100aa8:	00 00 00 
  100aab:	c7 80 08 40 00 00 00 	movl   $0x0,0x4008(%eax)
  100ab2:	00 00 00 
  100ab5:	89 c2                	mov    %eax,%edx
  100ab7:	81 ea 60 23 10 00    	sub    $0x102360,%edx
  100abd:	c1 fa 02             	sar    $0x2,%edx
  100ac0:	8d 0c 92             	lea    (%edx,%edx,4),%ecx
  100ac3:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
  100ac6:	89 d9                	mov    %ebx,%ecx
  100ac8:	c1 e1 0b             	shl    $0xb,%ecx
  100acb:	29 d9                	sub    %ebx,%ecx
  100acd:	01 c9                	add    %ecx,%ecx
  100acf:	01 d1                	add    %edx,%ecx
  100ad1:	c1 e1 05             	shl    $0x5,%ecx
  100ad4:	01 d1                	add    %edx,%ecx
  100ad6:	01 c9                	add    %ecx,%ecx
  100ad8:	01 d1                	add    %edx,%ecx
  100ada:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  100add:	01 c9                	add    %ecx,%ecx
  100adf:	01 d1                	add    %edx,%ecx
  100ae1:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  100ae4:	01 c9                	add    %ecx,%ecx
  100ae6:	01 ca                	add    %ecx,%edx
  100ae8:	f7 da                	neg    %edx
  100aea:	81 c2 e8 03 00 00    	add    $0x3e8,%edx
  100af0:	89 90 0c 40 00 00    	mov    %edx,0x400c(%eax)
  100af6:	8b 0d 40 23 10 00    	mov    0x102340,%ecx
  100afc:	85 c9                	test   %ecx,%ecx
  100afe:	75 06                	jne    100b06 <newPcb+0x8e>
  100b00:	eb 1a                	jmp    100b1c <newPcb+0xa4>
  100b02:	66 90                	xchg   %ax,%ax
  100b04:	89 d1                	mov    %edx,%ecx
  100b06:	8b 91 10 40 00 00    	mov    0x4010(%ecx),%edx
  100b0c:	85 d2                	test   %edx,%edx
  100b0e:	75 f4                	jne    100b04 <newPcb+0x8c>
  100b10:	89 81 10 40 00 00    	mov    %eax,0x4010(%ecx)
  100b16:	5b                   	pop    %ebx
  100b17:	5d                   	pop    %ebp
  100b18:	c3                   	ret    
  100b19:	8d 76 00             	lea    0x0(%esi),%esi
  100b1c:	a3 40 23 10 00       	mov    %eax,0x102340
  100b21:	5b                   	pop    %ebx
  100b22:	5d                   	pop    %ebp
  100b23:	c3                   	ret    

00100b24 <initPcb>:
  100b24:	55                   	push   %ebp
  100b25:	89 e5                	mov    %esp,%ebp
  100b27:	b8 74 63 10 00       	mov    $0x106374,%eax
  100b2c:	89 40 fc             	mov    %eax,-0x4(%eax)
  100b2f:	05 14 40 00 00       	add    $0x4014,%eax
  100b34:	3d f0 24 15 00       	cmp    $0x1524f0,%eax
  100b39:	75 f1                	jne    100b2c <initPcb+0x8>
  100b3b:	c7 05 ec 24 15 00 00 	movl   $0x0,0x1524ec
  100b42:	00 00 00 
  100b45:	c7 05 44 23 10 00 60 	movl   $0x102360,0x102344
  100b4c:	23 10 00 
  100b4f:	c7 05 40 23 10 00 00 	movl   $0x0,0x102340
  100b56:	00 00 00 
  100b59:	c7 05 f0 24 15 00 00 	movl   $0x0,0x1524f0
  100b60:	00 00 00 
  100b63:	5d                   	pop    %ebp
  100b64:	c3                   	ret    
  100b65:	8d 76 00             	lea    0x0(%esi),%esi

00100b68 <EnterUserPcb>:
  100b68:	55                   	push   %ebp
  100b69:	89 e5                	mov    %esp,%ebp
  100b6b:	53                   	push   %ebx
  100b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100b6f:	e8 04 ff ff ff       	call   100a78 <newPcb>
  100b74:	a3 f0 24 15 00       	mov    %eax,0x1524f0
  100b79:	ba 2b 00 00 00       	mov    $0x2b,%edx
  100b7e:	89 d0                	mov    %edx,%eax
  100b80:	8e d8                	mov    %eax,%ds
  100b82:	8e c0                	mov    %eax,%es
  100b84:	8e e0                	mov    %eax,%fs
  100b86:	fb                   	sti    
  100b87:	9c                   	pushf  
  100b88:	fa                   	cli    
  100b89:	8b 14 24             	mov    (%esp),%edx
  100b8c:	89 90 f4 3f 00 00    	mov    %edx,0x3ff4(%eax)
  100b92:	c7 80 fc 3f 00 00 2b 	movl   $0x2b,0x3ffc(%eax)
  100b99:	00 00 00 
  100b9c:	c7 80 f8 3f 00 00 00 	movl   $0x210000,0x3ff8(%eax)
  100ba3:	00 21 00 
  100ba6:	c7 80 f0 3f 00 00 23 	movl   $0x23,0x3ff0(%eax)
  100bad:	00 00 00 
  100bb0:	89 98 ec 3f 00 00    	mov    %ebx,0x3fec(%eax)
  100bb6:	c7 80 00 40 00 00 00 	movl   $0x0,0x4000(%eax)
  100bbd:	00 00 00 
  100bc0:	c7 80 04 40 00 00 0a 	movl   $0xa,0x4004(%eax)
  100bc7:	00 00 00 
  100bca:	c7 80 08 40 00 00 00 	movl   $0x0,0x4008(%eax)
  100bd1:	00 00 00 
  100bd4:	c7 80 0c 40 00 00 e8 	movl   $0x3e8,0x400c(%eax)
  100bdb:	03 00 00 
  100bde:	b8 2b 00 00 00       	mov    $0x2b,%eax
  100be3:	50                   	push   %eax
  100be4:	b8 00 00 21 00       	mov    $0x210000,%eax
  100be9:	50                   	push   %eax
  100bea:	52                   	push   %edx
  100beb:	b8 23 00 00 00       	mov    $0x23,%eax
  100bf0:	50                   	push   %eax
  100bf1:	53                   	push   %ebx
  100bf2:	cf                   	iret   
  100bf3:	5b                   	pop    %ebx
  100bf4:	5d                   	pop    %ebp
  100bf5:	c3                   	ret    
  100bf6:	66 90                	xchg   %ax,%ax

00100bf8 <initIdt>:
  100bf8:	55                   	push   %ebp
  100bf9:	89 e5                	mov    %esp,%ebp
  100bfb:	53                   	push   %ebx
  100bfc:	ba 5b 0d 10 00       	mov    $0x100d5b,%edx
  100c01:	89 d3                	mov    %edx,%ebx
  100c03:	c1 ea 10             	shr    $0x10,%edx
  100c06:	b9 c0 2d 15 00       	mov    $0x152dc0,%ecx
  100c0b:	b8 c0 25 15 00       	mov    $0x1525c0,%eax
  100c10:	66 89 18             	mov    %bx,(%eax)
  100c13:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100c19:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100c1d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100c21:	66 89 50 06          	mov    %dx,0x6(%eax)
  100c25:	83 c0 08             	add    $0x8,%eax
  100c28:	39 c1                	cmp    %eax,%ecx
  100c2a:	75 e4                	jne    100c10 <initIdt+0x18>
  100c2c:	b8 61 0d 10 00       	mov    $0x100d61,%eax
  100c31:	66 a3 28 26 15 00    	mov    %ax,0x152628
  100c37:	66 c7 05 2a 26 15 00 	movw   $0x8,0x15262a
  100c3e:	08 00 
  100c40:	c6 05 2c 26 15 00 00 	movb   $0x0,0x15262c
  100c47:	c6 05 2d 26 15 00 8f 	movb   $0x8f,0x15262d
  100c4e:	c1 e8 10             	shr    $0x10,%eax
  100c51:	66 a3 2e 26 15 00    	mov    %ax,0x15262e
  100c57:	b8 65 0d 10 00       	mov    $0x100d65,%eax
  100c5c:	66 a3 c0 26 15 00    	mov    %ax,0x1526c0
  100c62:	66 c7 05 c2 26 15 00 	movw   $0x8,0x1526c2
  100c69:	08 00 
  100c6b:	c6 05 c4 26 15 00 00 	movb   $0x0,0x1526c4
  100c72:	c6 05 c5 26 15 00 8e 	movb   $0x8e,0x1526c5
  100c79:	c1 e8 10             	shr    $0x10,%eax
  100c7c:	66 a3 c6 26 15 00    	mov    %ax,0x1526c6
  100c82:	b8 6b 0d 10 00       	mov    $0x100d6b,%eax
  100c87:	66 a3 c0 29 15 00    	mov    %ax,0x1529c0
  100c8d:	66 c7 05 c2 29 15 00 	movw   $0x8,0x1529c2
  100c94:	08 00 
  100c96:	c6 05 c4 29 15 00 00 	movb   $0x0,0x1529c4
  100c9d:	c6 05 c5 29 15 00 ee 	movb   $0xee,0x1529c5
  100ca4:	c1 e8 10             	shr    $0x10,%eax
  100ca7:	66 a3 c6 29 15 00    	mov    %ax,0x1529c6
  100cad:	66 c7 05 30 23 10 00 	movw   $0x7ff,0x102330
  100cb4:	ff 07 
  100cb6:	b8 c0 25 15 00       	mov    $0x1525c0,%eax
  100cbb:	66 a3 32 23 10 00    	mov    %ax,0x102332
  100cc1:	c1 e8 10             	shr    $0x10,%eax
  100cc4:	66 a3 34 23 10 00    	mov    %ax,0x102334
  100cca:	b8 30 23 10 00       	mov    $0x102330,%eax
  100ccf:	0f 01 18             	lidtl  (%eax)
  100cd2:	5b                   	pop    %ebx
  100cd3:	5d                   	pop    %ebp
  100cd4:	c3                   	ret    
  100cd5:	66 90                	xchg   %ax,%ax
  100cd7:	90                   	nop

00100cd8 <initIntr>:
  100cd8:	55                   	push   %ebp
  100cd9:	89 e5                	mov    %esp,%ebp
  100cdb:	ba 21 00 00 00       	mov    $0x21,%edx
  100ce0:	b0 ff                	mov    $0xff,%al
  100ce2:	ee                   	out    %al,(%dx)
  100ce3:	ba a1 00 00 00       	mov    $0xa1,%edx
  100ce8:	ee                   	out    %al,(%dx)
  100ce9:	ba 20 00 00 00       	mov    $0x20,%edx
  100cee:	b0 11                	mov    $0x11,%al
  100cf0:	ee                   	out    %al,(%dx)
  100cf1:	ba 21 00 00 00       	mov    $0x21,%edx
  100cf6:	b0 20                	mov    $0x20,%al
  100cf8:	ee                   	out    %al,(%dx)
  100cf9:	b0 04                	mov    $0x4,%al
  100cfb:	ee                   	out    %al,(%dx)
  100cfc:	b0 03                	mov    $0x3,%al
  100cfe:	ee                   	out    %al,(%dx)
  100cff:	ba a0 00 00 00       	mov    $0xa0,%edx
  100d04:	b0 11                	mov    $0x11,%al
  100d06:	ee                   	out    %al,(%dx)
  100d07:	ba a1 00 00 00       	mov    $0xa1,%edx
  100d0c:	b0 28                	mov    $0x28,%al
  100d0e:	ee                   	out    %al,(%dx)
  100d0f:	b0 02                	mov    $0x2,%al
  100d11:	ee                   	out    %al,(%dx)
  100d12:	b0 03                	mov    $0x3,%al
  100d14:	ee                   	out    %al,(%dx)
  100d15:	ba 20 00 00 00       	mov    $0x20,%edx
  100d1a:	b0 68                	mov    $0x68,%al
  100d1c:	ee                   	out    %al,(%dx)
  100d1d:	b0 0a                	mov    $0xa,%al
  100d1f:	ee                   	out    %al,(%dx)
  100d20:	ba a0 00 00 00       	mov    $0xa0,%edx
  100d25:	b0 68                	mov    $0x68,%al
  100d27:	ee                   	out    %al,(%dx)
  100d28:	b0 0a                	mov    $0xa,%al
  100d2a:	ee                   	out    %al,(%dx)
  100d2b:	5d                   	pop    %ebp
  100d2c:	c3                   	ret    
  100d2d:	66 90                	xchg   %ax,%ax
  100d2f:	90                   	nop

00100d30 <kEntry>:
  100d30:	55                   	push   %ebp
  100d31:	89 e5                	mov    %esp,%ebp
  100d33:	83 ec 08             	sub    $0x8,%esp
  100d36:	e8 d5 f7 ff ff       	call   100510 <initSerial>
  100d3b:	e8 b8 fe ff ff       	call   100bf8 <initIdt>
  100d40:	e8 93 ff ff ff       	call   100cd8 <initIntr>
  100d45:	e8 52 fb ff ff       	call   10089c <initTimer>
  100d4a:	e8 cd f8 ff ff       	call   10061c <initSeg>
  100d4f:	e8 d0 fd ff ff       	call   100b24 <initPcb>
  100d54:	e8 7b fa ff ff       	call   1007d4 <loadUMain>
  100d59:	eb fe                	jmp    100d59 <kEntry+0x29>

00100d5b <irqEmpty>:
  100d5b:	6a 00                	push   $0x0
  100d5d:	6a ff                	push   $0xffffffff
  100d5f:	eb 13                	jmp    100d74 <asmDoIrq>

00100d61 <irqGProtectFault>:
  100d61:	6a 0d                	push   $0xd
  100d63:	eb 0f                	jmp    100d74 <asmDoIrq>

00100d65 <irqTimerInterrupt>:
  100d65:	6a 00                	push   $0x0
  100d67:	6a 20                	push   $0x20
  100d69:	eb 09                	jmp    100d74 <asmDoIrq>

00100d6b <irqSyscall>:
  100d6b:	6a 00                	push   $0x0
  100d6d:	68 80 00 00 00       	push   $0x80
  100d72:	eb 00                	jmp    100d74 <asmDoIrq>

00100d74 <asmDoIrq>:
  100d74:	60                   	pusha  
  100d75:	1e                   	push   %ds
  100d76:	06                   	push   %es
  100d77:	0f a0                	push   %fs
  100d79:	0f a8                	push   %gs
  100d7b:	54                   	push   %esp
  100d7c:	e8 f3 f6 ff ff       	call   100474 <irqHandle>
  100d81:	83 c4 04             	add    $0x4,%esp
  100d84:	0f a9                	pop    %gs
  100d86:	0f a1                	pop    %fs
  100d88:	07                   	pop    %es
  100d89:	1f                   	pop    %ds
  100d8a:	61                   	popa   
  100d8b:	83 c4 04             	add    $0x4,%esp
  100d8e:	83 c4 04             	add    $0x4,%esp
  100d91:	cf                   	iret   
