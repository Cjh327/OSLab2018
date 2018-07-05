
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <append>:
  100000:	80 3a 00             	cmpb   $0x0,(%edx)
  100003:	74 18                	je     10001d <append+0x1d>
  100005:	55                   	push   %ebp
  100006:	89 e5                	mov    %esp,%ebp
  100008:	53                   	push   %ebx
  100009:	8b 08                	mov    (%eax),%ecx
  10000b:	8d 59 01             	lea    0x1(%ecx),%ebx
  10000e:	89 18                	mov    %ebx,(%eax)
  100010:	42                   	inc    %edx
  100011:	8a 5a ff             	mov    -0x1(%edx),%bl
  100014:	88 19                	mov    %bl,(%ecx)
  100016:	80 3a 00             	cmpb   $0x0,(%edx)
  100019:	75 ee                	jne    100009 <append+0x9>
  10001b:	5b                   	pop    %ebx
  10001c:	5d                   	pop    %ebp
  10001d:	c3                   	ret    

0010001e <abort>:
  10001e:	55                   	push   %ebp
  10001f:	89 e5                	mov    %esp,%ebp
  100021:	57                   	push   %edi
  100022:	56                   	push   %esi
  100023:	53                   	push   %ebx
  100024:	83 ec 1c             	sub    $0x1c,%esp
  100027:	8b 7d 0c             	mov    0xc(%ebp),%edi
  10002a:	fa                   	cli    
  10002b:	c7 45 e4 12 10 10 00 	movl   $0x101012,-0x1c(%ebp)
  100032:	8b 55 08             	mov    0x8(%ebp),%edx
  100035:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100038:	e8 c3 ff ff ff       	call   100000 <append>
  10003d:	ba ec 05 10 00       	mov    $0x1005ec,%edx
  100042:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100045:	e8 b6 ff ff ff       	call   100000 <append>
  10004a:	b9 1d 11 10 00       	mov    $0x10111d,%ecx
  10004f:	be 0a 00 00 00       	mov    $0xa,%esi
  100054:	bb 67 66 66 66       	mov    $0x66666667,%ebx
  100059:	49                   	dec    %ecx
  10005a:	89 f8                	mov    %edi,%eax
  10005c:	99                   	cltd   
  10005d:	f7 fe                	idiv   %esi
  10005f:	83 c2 30             	add    $0x30,%edx
  100062:	88 11                	mov    %dl,(%ecx)
  100064:	89 f8                	mov    %edi,%eax
  100066:	f7 eb                	imul   %ebx
  100068:	89 d0                	mov    %edx,%eax
  10006a:	c1 f8 02             	sar    $0x2,%eax
  10006d:	c1 ff 1f             	sar    $0x1f,%edi
  100070:	29 f8                	sub    %edi,%eax
  100072:	89 c7                	mov    %eax,%edi
  100074:	85 c0                	test   %eax,%eax
  100076:	75 e1                	jne    100059 <abort+0x3b>
  100078:	89 ca                	mov    %ecx,%edx
  10007a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  10007d:	e8 7e ff ff ff       	call   100000 <append>
  100082:	ba ee 05 10 00       	mov    $0x1005ee,%edx
  100087:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  10008a:	e8 71 ff ff ff       	call   100000 <append>
  10008f:	c7 45 e4 00 10 10 00 	movl   $0x101000,-0x1c(%ebp)
  100096:	a0 00 10 10 00       	mov    0x101000,%al
  10009b:	84 c0                	test   %al,%al
  10009d:	74 1f                	je     1000be <abort+0xa0>
  10009f:	83 ec 0c             	sub    $0xc,%esp
  1000a2:	0f be c0             	movsbl %al,%eax
  1000a5:	50                   	push   %eax
  1000a6:	e8 3f 01 00 00       	call   1001ea <putChar>
  1000ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1000ae:	8d 50 01             	lea    0x1(%eax),%edx
  1000b1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1000b4:	8a 40 01             	mov    0x1(%eax),%al
  1000b7:	83 c4 10             	add    $0x10,%esp
  1000ba:	84 c0                	test   %al,%al
  1000bc:	75 e1                	jne    10009f <abort+0x81>
  1000be:	f4                   	hlt    
  1000bf:	eb fd                	jmp    1000be <abort+0xa0>

001000c1 <fs_write>:
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	53                   	push   %ebx
  1000c5:	83 ec 04             	sub    $0x4,%esp
  1000c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1000cb:	83 fb 02             	cmp    $0x2,%ebx
  1000ce:	7e 12                	jle    1000e2 <fs_write+0x21>
  1000d0:	83 ec 08             	sub    $0x8,%esp
  1000d3:	6a 1e                	push   $0x1e
  1000d5:	68 f0 05 10 00       	push   $0x1005f0
  1000da:	e8 3f ff ff ff       	call   10001e <abort>
  1000df:	83 c4 10             	add    $0x10,%esp
  1000e2:	b8 04 00 00 00       	mov    $0x4,%eax
  1000e7:	8b 55 10             	mov    0x10(%ebp),%edx
  1000ea:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000ed:	82                   	(bad)  
  1000ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000f1:	c9                   	leave  
  1000f2:	c3                   	ret    

001000f3 <sys_write>:
  1000f3:	55                   	push   %ebp
  1000f4:	89 e5                	mov    %esp,%ebp
  1000f6:	53                   	push   %ebx
  1000f7:	83 ec 08             	sub    $0x8,%esp
  1000fa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1000fd:	ff 73 14             	pushl  0x14(%ebx)
  100100:	ff 73 18             	pushl  0x18(%ebx)
  100103:	ff 73 10             	pushl  0x10(%ebx)
  100106:	e8 b6 ff ff ff       	call   1000c1 <fs_write>
  10010b:	89 43 1c             	mov    %eax,0x1c(%ebx)
  10010e:	83 c4 10             	add    $0x10,%esp
  100111:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100114:	c9                   	leave  
  100115:	c3                   	ret    

00100116 <syscallHandle>:
  100116:	55                   	push   %ebp
  100117:	89 e5                	mov    %esp,%ebp
  100119:	83 ec 08             	sub    $0x8,%esp
  10011c:	8b 45 08             	mov    0x8(%ebp),%eax
  10011f:	83 78 1c 04          	cmpl   $0x4,0x1c(%eax)
  100123:	75 0e                	jne    100133 <syscallHandle+0x1d>
  100125:	83 ec 0c             	sub    $0xc,%esp
  100128:	50                   	push   %eax
  100129:	e8 c5 ff ff ff       	call   1000f3 <sys_write>
  10012e:	83 c4 10             	add    $0x10,%esp
  100131:	eb 12                	jmp    100145 <syscallHandle+0x2f>
  100133:	83 ec 08             	sub    $0x8,%esp
  100136:	6a 2b                	push   $0x2b
  100138:	68 f0 05 10 00       	push   $0x1005f0
  10013d:	e8 dc fe ff ff       	call   10001e <abort>
  100142:	83 c4 10             	add    $0x10,%esp
  100145:	c9                   	leave  
  100146:	c3                   	ret    

00100147 <GProtectFaultHandle>:
  100147:	55                   	push   %ebp
  100148:	89 e5                	mov    %esp,%ebp
  10014a:	83 ec 10             	sub    $0x10,%esp
  10014d:	6a 30                	push   $0x30
  10014f:	68 f0 05 10 00       	push   $0x1005f0
  100154:	e8 c5 fe ff ff       	call   10001e <abort>
  100159:	83 c4 10             	add    $0x10,%esp
  10015c:	c9                   	leave  
  10015d:	c3                   	ret    

0010015e <irqHandle>:
  10015e:	55                   	push   %ebp
  10015f:	89 e5                	mov    %esp,%ebp
  100161:	83 ec 08             	sub    $0x8,%esp
  100164:	8b 55 08             	mov    0x8(%ebp),%edx
  100167:	8b 42 20             	mov    0x20(%edx),%eax
  10016a:	83 f8 0d             	cmp    $0xd,%eax
  10016d:	74 0e                	je     10017d <irqHandle+0x1f>
  10016f:	3d 80 00 00 00       	cmp    $0x80,%eax
  100174:	74 15                	je     10018b <irqHandle+0x2d>
  100176:	83 f8 ff             	cmp    $0xffffffff,%eax
  100179:	75 1e                	jne    100199 <irqHandle+0x3b>
  10017b:	eb 2e                	jmp    1001ab <irqHandle+0x4d>
  10017d:	83 ec 0c             	sub    $0xc,%esp
  100180:	52                   	push   %edx
  100181:	e8 c1 ff ff ff       	call   100147 <GProtectFaultHandle>
  100186:	83 c4 10             	add    $0x10,%esp
  100189:	eb 20                	jmp    1001ab <irqHandle+0x4d>
  10018b:	83 ec 0c             	sub    $0xc,%esp
  10018e:	52                   	push   %edx
  10018f:	e8 82 ff ff ff       	call   100116 <syscallHandle>
  100194:	83 c4 10             	add    $0x10,%esp
  100197:	eb 12                	jmp    1001ab <irqHandle+0x4d>
  100199:	83 ec 08             	sub    $0x8,%esp
  10019c:	6a 19                	push   $0x19
  10019e:	68 f0 05 10 00       	push   $0x1005f0
  1001a3:	e8 76 fe ff ff       	call   10001e <abort>
  1001a8:	83 c4 10             	add    $0x10,%esp
  1001ab:	c9                   	leave  
  1001ac:	c3                   	ret    

001001ad <initSerial>:
  1001ad:	55                   	push   %ebp
  1001ae:	89 e5                	mov    %esp,%ebp
  1001b0:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1001b5:	b0 00                	mov    $0x0,%al
  1001b7:	ee                   	out    %al,(%dx)
  1001b8:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1001bd:	b0 80                	mov    $0x80,%al
  1001bf:	ee                   	out    %al,(%dx)
  1001c0:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1001c5:	b0 01                	mov    $0x1,%al
  1001c7:	ee                   	out    %al,(%dx)
  1001c8:	ba f9 03 00 00       	mov    $0x3f9,%edx
  1001cd:	b0 00                	mov    $0x0,%al
  1001cf:	ee                   	out    %al,(%dx)
  1001d0:	ba fb 03 00 00       	mov    $0x3fb,%edx
  1001d5:	b0 03                	mov    $0x3,%al
  1001d7:	ee                   	out    %al,(%dx)
  1001d8:	ba fa 03 00 00       	mov    $0x3fa,%edx
  1001dd:	b0 c7                	mov    $0xc7,%al
  1001df:	ee                   	out    %al,(%dx)
  1001e0:	ba fc 03 00 00       	mov    $0x3fc,%edx
  1001e5:	b0 0b                	mov    $0xb,%al
  1001e7:	ee                   	out    %al,(%dx)
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    

001001ea <putChar>:
  1001ea:	55                   	push   %ebp
  1001eb:	89 e5                	mov    %esp,%ebp
  1001ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1001f0:	ba fd 03 00 00       	mov    $0x3fd,%edx
  1001f5:	ec                   	in     (%dx),%al
  1001f6:	a8 20                	test   $0x20,%al
  1001f8:	74 fb                	je     1001f5 <putChar+0xb>
  1001fa:	ba f8 03 00 00       	mov    $0x3f8,%edx
  1001ff:	88 c8                	mov    %cl,%al
  100201:	ee                   	out    %al,(%dx)
  100202:	5d                   	pop    %ebp
  100203:	c3                   	ret    

00100204 <waitDisk>:
  100204:	55                   	push   %ebp
  100205:	89 e5                	mov    %esp,%ebp
  100207:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10020c:	ec                   	in     (%dx),%al
  10020d:	83 e0 c0             	and    $0xffffffc0,%eax
  100210:	3c 40                	cmp    $0x40,%al
  100212:	75 f8                	jne    10020c <waitDisk+0x8>
  100214:	5d                   	pop    %ebp
  100215:	c3                   	ret    

00100216 <readSect>:
  100216:	55                   	push   %ebp
  100217:	89 e5                	mov    %esp,%ebp
  100219:	56                   	push   %esi
  10021a:	53                   	push   %ebx
  10021b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10021e:	8b 75 0c             	mov    0xc(%ebp),%esi
  100221:	e8 de ff ff ff       	call   100204 <waitDisk>
  100226:	ba f2 01 00 00       	mov    $0x1f2,%edx
  10022b:	b0 01                	mov    $0x1,%al
  10022d:	ee                   	out    %al,(%dx)
  10022e:	ba f3 01 00 00       	mov    $0x1f3,%edx
  100233:	89 f0                	mov    %esi,%eax
  100235:	ee                   	out    %al,(%dx)
  100236:	89 f0                	mov    %esi,%eax
  100238:	c1 f8 08             	sar    $0x8,%eax
  10023b:	ba f4 01 00 00       	mov    $0x1f4,%edx
  100240:	ee                   	out    %al,(%dx)
  100241:	89 f0                	mov    %esi,%eax
  100243:	c1 f8 10             	sar    $0x10,%eax
  100246:	ba f5 01 00 00       	mov    $0x1f5,%edx
  10024b:	ee                   	out    %al,(%dx)
  10024c:	89 f0                	mov    %esi,%eax
  10024e:	c1 f8 18             	sar    $0x18,%eax
  100251:	83 c8 e0             	or     $0xffffffe0,%eax
  100254:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100259:	ee                   	out    %al,(%dx)
  10025a:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10025f:	b0 20                	mov    $0x20,%al
  100261:	ee                   	out    %al,(%dx)
  100262:	e8 9d ff ff ff       	call   100204 <waitDisk>
  100267:	89 d9                	mov    %ebx,%ecx
  100269:	81 c3 00 02 00 00    	add    $0x200,%ebx
  10026f:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100274:	ed                   	in     (%dx),%eax
  100275:	89 01                	mov    %eax,(%ecx)
  100277:	83 c1 04             	add    $0x4,%ecx
  10027a:	39 d9                	cmp    %ebx,%ecx
  10027c:	75 f6                	jne    100274 <readSect+0x5e>
  10027e:	5b                   	pop    %ebx
  10027f:	5e                   	pop    %esi
  100280:	5d                   	pop    %ebp
  100281:	c3                   	ret    

00100282 <initSeg>:
  100282:	55                   	push   %ebp
  100283:	89 e5                	mov    %esp,%ebp
  100285:	ba 40 11 10 00       	mov    $0x101140,%edx
  10028a:	66 c7 05 48 11 10 00 	movw   $0xffff,0x101148
  100291:	ff ff 
  100293:	66 c7 05 4a 11 10 00 	movw   $0x0,0x10114a
  10029a:	00 00 
  10029c:	c6 05 4c 11 10 00 00 	movb   $0x0,0x10114c
  1002a3:	c6 05 4d 11 10 00 9a 	movb   $0x9a,0x10114d
  1002aa:	c6 05 4e 11 10 00 cf 	movb   $0xcf,0x10114e
  1002b1:	c6 05 4f 11 10 00 00 	movb   $0x0,0x10114f
  1002b8:	66 c7 05 50 11 10 00 	movw   $0xffff,0x101150
  1002bf:	ff ff 
  1002c1:	66 c7 05 52 11 10 00 	movw   $0x0,0x101152
  1002c8:	00 00 
  1002ca:	c6 05 54 11 10 00 00 	movb   $0x0,0x101154
  1002d1:	c6 05 55 11 10 00 92 	movb   $0x92,0x101155
  1002d8:	c6 05 56 11 10 00 cf 	movb   $0xcf,0x101156
  1002df:	c6 05 57 11 10 00 00 	movb   $0x0,0x101157
  1002e6:	66 c7 05 58 11 10 00 	movw   $0xffff,0x101158
  1002ed:	ff ff 
  1002ef:	66 c7 05 5a 11 10 00 	movw   $0x0,0x10115a
  1002f6:	00 00 
  1002f8:	c6 05 5c 11 10 00 00 	movb   $0x0,0x10115c
  1002ff:	c6 05 5d 11 10 00 fa 	movb   $0xfa,0x10115d
  100306:	c6 05 5e 11 10 00 cf 	movb   $0xcf,0x10115e
  10030d:	c6 05 5f 11 10 00 00 	movb   $0x0,0x10115f
  100314:	66 c7 05 60 11 10 00 	movw   $0xffff,0x101160
  10031b:	ff ff 
  10031d:	66 c7 05 62 11 10 00 	movw   $0x0,0x101162
  100324:	00 00 
  100326:	c6 05 64 11 10 00 00 	movb   $0x0,0x101164
  10032d:	c6 05 65 11 10 00 f2 	movb   $0xf2,0x101165
  100334:	c6 05 66 11 10 00 cf 	movb   $0xcf,0x101166
  10033b:	c6 05 67 11 10 00 00 	movb   $0x0,0x101167
  100342:	66 c7 05 68 11 10 00 	movw   $0x63,0x101168
  100349:	63 00 
  10034b:	b8 80 11 10 00       	mov    $0x101180,%eax
  100350:	66 a3 6a 11 10 00    	mov    %ax,0x10116a
  100356:	89 c1                	mov    %eax,%ecx
  100358:	c1 e9 10             	shr    $0x10,%ecx
  10035b:	88 0d 6c 11 10 00    	mov    %cl,0x10116c
  100361:	c6 05 6d 11 10 00 89 	movb   $0x89,0x10116d
  100368:	c6 05 6e 11 10 00 40 	movb   $0x40,0x10116e
  10036f:	c1 e8 18             	shr    $0x18,%eax
  100372:	a2 6f 11 10 00       	mov    %al,0x10116f
  100377:	66 c7 05 20 11 10 00 	movw   $0x37,0x101120
  10037e:	37 00 
  100380:	66 89 15 22 11 10 00 	mov    %dx,0x101122
  100387:	c1 ea 10             	shr    $0x10,%edx
  10038a:	66 89 15 24 11 10 00 	mov    %dx,0x101124
  100391:	b8 20 11 10 00       	mov    $0x101120,%eax
  100396:	0f 01 10             	lgdtl  (%eax)
  100399:	c7 05 84 11 10 00 00 	movl   $0x200000,0x101184
  1003a0:	00 20 00 
  1003a3:	c7 05 88 11 10 00 28 	movl   $0x28,0x101188
  1003aa:	00 00 00 
  1003ad:	b8 28 00 00 00       	mov    $0x28,%eax
  1003b2:	0f 00 d8             	ltr    %ax
  1003b5:	b8 10 00 00 00       	mov    $0x10,%eax
  1003ba:	89 c0                	mov    %eax,%eax
  1003bc:	8e d8                	mov    %eax,%ds
  1003be:	8e c0                	mov    %eax,%es
  1003c0:	8e d0                	mov    %eax,%ss
  1003c2:	8e e0                	mov    %eax,%fs
  1003c4:	8e e8                	mov    %eax,%gs
  1003c6:	b8 00 00 00 00       	mov    $0x0,%eax
  1003cb:	0f 00 d0             	lldt   %ax
  1003ce:	5d                   	pop    %ebp
  1003cf:	c3                   	ret    

001003d0 <enterUserSpace>:
  1003d0:	55                   	push   %ebp
  1003d1:	89 e5                	mov    %esp,%ebp
  1003d3:	b8 23 00 00 00       	mov    $0x23,%eax
  1003d8:	50                   	push   %eax
  1003d9:	b8 00 00 00 08       	mov    $0x8000000,%eax
  1003de:	50                   	push   %eax
  1003df:	9c                   	pushf  
  1003e0:	b8 1b 00 00 00       	mov    $0x1b,%eax
  1003e5:	50                   	push   %eax
  1003e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1003e9:	50                   	push   %eax
  1003ea:	cf                   	iret   
  1003eb:	5d                   	pop    %ebp
  1003ec:	c3                   	ret    

001003ed <loadUMain>:
  1003ed:	55                   	push   %ebp
  1003ee:	89 e5                	mov    %esp,%ebp
  1003f0:	56                   	push   %esi
  1003f1:	53                   	push   %ebx
  1003f2:	bb c9 00 00 00       	mov    $0xc9,%ebx
  1003f7:	be 00 00 00 05       	mov    $0x5000000,%esi
  1003fc:	53                   	push   %ebx
  1003fd:	56                   	push   %esi
  1003fe:	e8 13 fe ff ff       	call   100216 <readSect>
  100403:	81 c6 00 02 00 00    	add    $0x200,%esi
  100409:	43                   	inc    %ebx
  10040a:	83 c4 08             	add    $0x8,%esp
  10040d:	81 fb 2d 01 00 00    	cmp    $0x12d,%ebx
  100413:	75 e7                	jne    1003fc <loadUMain+0xf>
  100415:	a1 1c 00 00 05       	mov    0x500001c,%eax
  10041a:	8d 90 00 00 00 05    	lea    0x5000000(%eax),%edx
  100420:	66 83 3d 2c 00 00 05 	cmpw   $0x0,0x500002c
  100427:	00 
  100428:	74 5e                	je     100488 <loadUMain+0x9b>
  10042a:	bb 00 00 00 00       	mov    $0x0,%ebx
  10042f:	83 3a 01             	cmpl   $0x1,(%edx)
  100432:	75 45                	jne    100479 <loadUMain+0x8c>
  100434:	8b 4a 08             	mov    0x8(%edx),%ecx
  100437:	8b 72 04             	mov    0x4(%edx),%esi
  10043a:	89 c8                	mov    %ecx,%eax
  10043c:	03 42 10             	add    0x10(%edx),%eax
  10043f:	39 c1                	cmp    %eax,%ecx
  100441:	73 1b                	jae    10045e <loadUMain+0x71>
  100443:	89 c8                	mov    %ecx,%eax
  100445:	29 ce                	sub    %ecx,%esi
  100447:	40                   	inc    %eax
  100448:	8a 8c 06 ff ff ff 04 	mov    0x4ffffff(%esi,%eax,1),%cl
  10044f:	88 48 ff             	mov    %cl,-0x1(%eax)
  100452:	8b 4a 10             	mov    0x10(%edx),%ecx
  100455:	03 4a 08             	add    0x8(%edx),%ecx
  100458:	39 c1                	cmp    %eax,%ecx
  10045a:	77 eb                	ja     100447 <loadUMain+0x5a>
  10045c:	eb 02                	jmp    100460 <loadUMain+0x73>
  10045e:	89 c8                	mov    %ecx,%eax
  100460:	8b 4a 14             	mov    0x14(%edx),%ecx
  100463:	03 4a 08             	add    0x8(%edx),%ecx
  100466:	39 c1                	cmp    %eax,%ecx
  100468:	76 0f                	jbe    100479 <loadUMain+0x8c>
  10046a:	40                   	inc    %eax
  10046b:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
  10046f:	8b 4a 14             	mov    0x14(%edx),%ecx
  100472:	03 4a 08             	add    0x8(%edx),%ecx
  100475:	39 c1                	cmp    %eax,%ecx
  100477:	77 f1                	ja     10046a <loadUMain+0x7d>
  100479:	83 c2 20             	add    $0x20,%edx
  10047c:	43                   	inc    %ebx
  10047d:	0f b7 05 2c 00 00 05 	movzwl 0x500002c,%eax
  100484:	39 d8                	cmp    %ebx,%eax
  100486:	7f a7                	jg     10042f <loadUMain+0x42>
  100488:	ff 35 18 00 00 05    	pushl  0x5000018
  10048e:	e8 3d ff ff ff       	call   1003d0 <enterUserSpace>
  100493:	83 c4 04             	add    $0x4,%esp
  100496:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100499:	5b                   	pop    %ebx
  10049a:	5e                   	pop    %esi
  10049b:	5d                   	pop    %ebp
  10049c:	c3                   	ret    

0010049d <initIdt>:
  10049d:	55                   	push   %ebp
  10049e:	89 e5                	mov    %esp,%ebp
  1004a0:	53                   	push   %ebx
  1004a1:	ba c7 05 10 00       	mov    $0x1005c7,%edx
  1004a6:	89 d0                	mov    %edx,%eax
  1004a8:	c1 e8 10             	shr    $0x10,%eax
  1004ab:	89 c3                	mov    %eax,%ebx
  1004ad:	b9 00 1a 10 00       	mov    $0x101a00,%ecx
  1004b2:	b8 00 12 10 00       	mov    $0x101200,%eax
  1004b7:	66 89 10             	mov    %dx,(%eax)
  1004ba:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  1004c0:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  1004c4:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  1004c8:	66 89 58 06          	mov    %bx,0x6(%eax)
  1004cc:	83 c0 08             	add    $0x8,%eax
  1004cf:	39 c8                	cmp    %ecx,%eax
  1004d1:	75 e4                	jne    1004b7 <initIdt+0x1a>
  1004d3:	b8 cd 05 10 00       	mov    $0x1005cd,%eax
  1004d8:	66 a3 68 12 10 00    	mov    %ax,0x101268
  1004de:	66 c7 05 6a 12 10 00 	movw   $0x8,0x10126a
  1004e5:	08 00 
  1004e7:	c6 05 6c 12 10 00 00 	movb   $0x0,0x10126c
  1004ee:	c6 05 6d 12 10 00 8f 	movb   $0x8f,0x10126d
  1004f5:	c1 e8 10             	shr    $0x10,%eax
  1004f8:	66 a3 6e 12 10 00    	mov    %ax,0x10126e
  1004fe:	b8 d1 05 10 00       	mov    $0x1005d1,%eax
  100503:	66 a3 00 16 10 00    	mov    %ax,0x101600
  100509:	66 c7 05 02 16 10 00 	movw   $0x8,0x101602
  100510:	08 00 
  100512:	c6 05 04 16 10 00 00 	movb   $0x0,0x101604
  100519:	c6 05 05 16 10 00 ee 	movb   $0xee,0x101605
  100520:	c1 e8 10             	shr    $0x10,%eax
  100523:	66 a3 06 16 10 00    	mov    %ax,0x101606
  100529:	66 c7 05 28 11 10 00 	movw   $0x7ff,0x101128
  100530:	ff 07 
  100532:	b8 00 12 10 00       	mov    $0x101200,%eax
  100537:	66 a3 2a 11 10 00    	mov    %ax,0x10112a
  10053d:	c1 e8 10             	shr    $0x10,%eax
  100540:	66 a3 2c 11 10 00    	mov    %ax,0x10112c
  100546:	b8 28 11 10 00       	mov    $0x101128,%eax
  10054b:	0f 01 18             	lidtl  (%eax)
  10054e:	5b                   	pop    %ebx
  10054f:	5d                   	pop    %ebp
  100550:	c3                   	ret    

00100551 <initIntr>:
  100551:	55                   	push   %ebp
  100552:	89 e5                	mov    %esp,%ebp
  100554:	ba 21 00 00 00       	mov    $0x21,%edx
  100559:	b0 ff                	mov    $0xff,%al
  10055b:	ee                   	out    %al,(%dx)
  10055c:	ba a1 00 00 00       	mov    $0xa1,%edx
  100561:	ee                   	out    %al,(%dx)
  100562:	ba 20 00 00 00       	mov    $0x20,%edx
  100567:	b0 11                	mov    $0x11,%al
  100569:	ee                   	out    %al,(%dx)
  10056a:	ba 21 00 00 00       	mov    $0x21,%edx
  10056f:	b0 20                	mov    $0x20,%al
  100571:	ee                   	out    %al,(%dx)
  100572:	b0 04                	mov    $0x4,%al
  100574:	ee                   	out    %al,(%dx)
  100575:	b0 03                	mov    $0x3,%al
  100577:	ee                   	out    %al,(%dx)
  100578:	ba a0 00 00 00       	mov    $0xa0,%edx
  10057d:	b0 11                	mov    $0x11,%al
  10057f:	ee                   	out    %al,(%dx)
  100580:	ba a1 00 00 00       	mov    $0xa1,%edx
  100585:	b0 28                	mov    $0x28,%al
  100587:	ee                   	out    %al,(%dx)
  100588:	b0 02                	mov    $0x2,%al
  10058a:	ee                   	out    %al,(%dx)
  10058b:	b0 03                	mov    $0x3,%al
  10058d:	ee                   	out    %al,(%dx)
  10058e:	ba 20 00 00 00       	mov    $0x20,%edx
  100593:	b0 68                	mov    $0x68,%al
  100595:	ee                   	out    %al,(%dx)
  100596:	b0 0a                	mov    $0xa,%al
  100598:	ee                   	out    %al,(%dx)
  100599:	ba a0 00 00 00       	mov    $0xa0,%edx
  10059e:	b0 68                	mov    $0x68,%al
  1005a0:	ee                   	out    %al,(%dx)
  1005a1:	b0 0a                	mov    $0xa,%al
  1005a3:	ee                   	out    %al,(%dx)
  1005a4:	5d                   	pop    %ebp
  1005a5:	c3                   	ret    

001005a6 <kEntry>:
  1005a6:	55                   	push   %ebp
  1005a7:	89 e5                	mov    %esp,%ebp
  1005a9:	83 ec 08             	sub    $0x8,%esp
  1005ac:	e8 fc fb ff ff       	call   1001ad <initSerial>
  1005b1:	e8 e7 fe ff ff       	call   10049d <initIdt>
  1005b6:	e8 96 ff ff ff       	call   100551 <initIntr>
  1005bb:	e8 c2 fc ff ff       	call   100282 <initSeg>
  1005c0:	e8 28 fe ff ff       	call   1003ed <loadUMain>
  1005c5:	eb fe                	jmp    1005c5 <kEntry+0x1f>

001005c7 <irqEmpty>:
  1005c7:	6a 00                	push   $0x0
  1005c9:	6a ff                	push   $0xffffffff
  1005cb:	eb 0d                	jmp    1005da <asmDoIrq>

001005cd <irqGProtectFault>:
  1005cd:	6a 0d                	push   $0xd
  1005cf:	eb 09                	jmp    1005da <asmDoIrq>

001005d1 <irqSyscall>:
  1005d1:	6a 00                	push   $0x0
  1005d3:	68 80 00 00 00       	push   $0x80
  1005d8:	eb 00                	jmp    1005da <asmDoIrq>

001005da <asmDoIrq>:
  1005da:	60                   	pusha  
  1005db:	54                   	push   %esp
  1005dc:	e8 7d fb ff ff       	call   10015e <irqHandle>
  1005e1:	83 c4 04             	add    $0x4,%esp
  1005e4:	61                   	popa   
  1005e5:	83 c4 04             	add    $0x4,%esp
  1005e8:	83 c4 04             	add    $0x4,%esp
  1005eb:	cf                   	iret   
