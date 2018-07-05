
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	83 ec 14             	sub    $0x14,%esp
  200006:	68 20 03 20 00       	push   $0x200320
  20000b:	e8 29 02 00 00       	call   200239 <printf>
  200010:	c7 04 24 36 03 20 00 	movl   $0x200336,(%esp)
  200017:	e8 1d 02 00 00       	call   200239 <printf>
  20001c:	c7 04 24 18 04 20 00 	movl   $0x200418,(%esp)
  200023:	e8 11 02 00 00       	call   200239 <printf>
  200028:	c7 04 24 54 04 20 00 	movl   $0x200454,(%esp)
  20002f:	e8 05 02 00 00       	call   200239 <printf>
  200034:	c7 04 24 88 04 20 00 	movl   $0x200488,(%esp)
  20003b:	e8 f9 01 00 00       	call   200239 <printf>
  200040:	c7 04 24 04 05 20 00 	movl   $0x200504,(%esp)
  200047:	e8 ed 01 00 00       	call   200239 <printf>
  20004c:	c7 04 24 4d 03 20 00 	movl   $0x20034d,(%esp)
  200053:	e8 e1 01 00 00       	call   200239 <printf>
  200058:	c7 04 24 28 05 20 00 	movl   $0x200528,(%esp)
  20005f:	e8 d5 01 00 00       	call   200239 <printf>
  200064:	c7 04 24 18 04 20 00 	movl   $0x200418,(%esp)
  20006b:	e8 c9 01 00 00       	call   200239 <printf>
  200070:	c7 04 24 6b 03 20 00 	movl   $0x20036b,(%esp)
  200077:	e8 bd 01 00 00       	call   200239 <printf>
  20007c:	c7 04 24 a8 05 20 00 	movl   $0x2005a8,(%esp)
  200083:	e8 b1 01 00 00       	call   200239 <printf>
  200088:	83 c4 08             	add    $0x8,%esp
  20008b:	68 a1 03 20 00       	push   $0x2003a1
  200090:	6a 74                	push   $0x74
  200092:	68 79 03 20 00       	push   $0x200379
  200097:	68 16 04 20 00       	push   $0x200416
  20009c:	68 7d 03 20 00       	push   $0x20037d
  2000a1:	68 84 03 20 00       	push   $0x200384
  2000a6:	e8 8e 01 00 00       	call   200239 <printf>
  2000ab:	83 c4 18             	add    $0x18,%esp
  2000ae:	6a 62                	push   $0x62
  2000b0:	6a 61                	push   $0x61
  2000b2:	6a 6c                	push   $0x6c
  2000b4:	6a 53                	push   $0x53
  2000b6:	6a 4f                	push   $0x4f
  2000b8:	68 96 03 20 00       	push   $0x200396
  2000bd:	e8 77 01 00 00       	call   200239 <printf>
  2000c2:	83 c4 1c             	add    $0x1c,%esp
  2000c5:	68 00 00 10 00       	push   $0x100000
  2000ca:	68 e4 05 20 00       	push   $0x2005e4
  2000cf:	68 00 00 10 00       	push   $0x100000
  2000d4:	68 1c 06 20 00       	push   $0x20061c
  2000d9:	68 a3 03 20 00       	push   $0x2003a3
  2000de:	68 ac 03 20 00       	push   $0x2003ac
  2000e3:	68 4c 06 20 00       	push   $0x20064c
  2000e8:	e8 4c 01 00 00       	call   200239 <printf>
  2000ed:	83 c4 14             	add    $0x14,%esp
  2000f0:	68 04 05 20 00       	push   $0x200504
  2000f5:	e8 3f 01 00 00       	call   200239 <printf>
  2000fa:	c7 04 24 4d 03 20 00 	movl   $0x20034d,(%esp)
  200101:	e8 33 01 00 00       	call   200239 <printf>
  200106:	83 c4 0c             	add    $0xc,%esp
  200109:	68 18 db 00 00       	push   $0xdb18
  20010e:	68 c8 01 00 00       	push   $0x1c8
  200113:	6a 7b                	push   $0x7b
  200115:	6a 02                	push   $0x2
  200117:	6a 01                	push   $0x1
  200119:	6a 01                	push   $0x1
  20011b:	68 b1 03 20 00       	push   $0x2003b1
  200120:	e8 14 01 00 00       	call   200239 <printf>
  200125:	83 c4 1c             	add    $0x1c,%esp
  200128:	68 8e 8e 01 00       	push   $0x18e8e
  20012d:	68 00 80 ff ff       	push   $0xffff8000
  200132:	68 01 df ce ab       	push   $0xabcedf01
  200137:	68 00 00 00 80       	push   $0x80000000
  20013c:	6a ff                	push   $0xffffffff
  20013e:	6a 00                	push   $0x0
  200140:	68 cd 03 20 00       	push   $0x2003cd
  200145:	e8 ef 00 00 00       	call   200239 <printf>
  20014a:	83 c4 1c             	add    $0x1c,%esp
  20014d:	68 8e 8e 01 00       	push   $0x18e8e
  200152:	68 00 80 ff ff       	push   $0xffff8000
  200157:	68 01 df ce ab       	push   $0xabcedf01
  20015c:	68 00 00 00 80       	push   $0x80000000
  200161:	6a ff                	push   $0xffffffff
  200163:	6a 00                	push   $0x0
  200165:	68 e5 03 20 00       	push   $0x2003e5
  20016a:	e8 ca 00 00 00       	call   200239 <printf>
  20016f:	83 c4 14             	add    $0x14,%esp
  200172:	68 a8 05 20 00       	push   $0x2005a8
  200177:	e8 bd 00 00 00       	call   200239 <printf>
  20017c:	c7 04 24 fd 03 20 00 	movl   $0x2003fd,(%esp)
  200183:	e8 b1 00 00 00       	call   200239 <printf>
  200188:	83 c4 10             	add    $0x10,%esp
  20018b:	eb fe                	jmp    20018b <uEntry+0x18b>

0020018d <syscall>:
  20018d:	55                   	push   %ebp
  20018e:	89 e5                	mov    %esp,%ebp
  200190:	57                   	push   %edi
  200191:	56                   	push   %esi
  200192:	53                   	push   %ebx
  200193:	8b 55 14             	mov    0x14(%ebp),%edx
  200196:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200199:	8b 45 08             	mov    0x8(%ebp),%eax
  20019c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  20019f:	8b 7d 18             	mov    0x18(%ebp),%edi
  2001a2:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2001a5:	cd 80                	int    $0x80
  2001a7:	5b                   	pop    %ebx
  2001a8:	5e                   	pop    %esi
  2001a9:	5f                   	pop    %edi
  2001aa:	5d                   	pop    %ebp
  2001ab:	c3                   	ret    

002001ac <printc>:
  2001ac:	55                   	push   %ebp
  2001ad:	89 e5                	mov    %esp,%ebp
  2001af:	57                   	push   %edi
  2001b0:	56                   	push   %esi
  2001b1:	53                   	push   %ebx
  2001b2:	83 ec 04             	sub    $0x4,%esp
  2001b5:	ba 01 00 00 00       	mov    $0x1,%edx
  2001ba:	8d 4d f0             	lea    -0x10(%ebp),%ecx
  2001bd:	be 00 00 00 00       	mov    $0x0,%esi
  2001c2:	b8 04 00 00 00       	mov    $0x4,%eax
  2001c7:	89 d3                	mov    %edx,%ebx
  2001c9:	89 f7                	mov    %esi,%edi
  2001cb:	cd 80                	int    $0x80
  2001cd:	83 c4 04             	add    $0x4,%esp
  2001d0:	5b                   	pop    %ebx
  2001d1:	5e                   	pop    %esi
  2001d2:	5f                   	pop    %edi
  2001d3:	5d                   	pop    %ebp
  2001d4:	c3                   	ret    

002001d5 <prints>:
  2001d5:	55                   	push   %ebp
  2001d6:	89 e5                	mov    %esp,%ebp
  2001d8:	57                   	push   %edi
  2001d9:	56                   	push   %esi
  2001da:	53                   	push   %ebx
  2001db:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2001de:	80 39 00             	cmpb   $0x0,(%ecx)
  2001e1:	74 10                	je     2001f3 <prints+0x1e>
  2001e3:	b8 00 00 00 00       	mov    $0x0,%eax
  2001e8:	40                   	inc    %eax
  2001e9:	89 c2                	mov    %eax,%edx
  2001eb:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2001ef:	75 f7                	jne    2001e8 <prints+0x13>
  2001f1:	eb 05                	jmp    2001f8 <prints+0x23>
  2001f3:	ba 00 00 00 00       	mov    $0x0,%edx
  2001f8:	be 00 00 00 00       	mov    $0x0,%esi
  2001fd:	bb 01 00 00 00       	mov    $0x1,%ebx
  200202:	b8 04 00 00 00       	mov    $0x4,%eax
  200207:	89 f7                	mov    %esi,%edi
  200209:	cd 80                	int    $0x80
  20020b:	5b                   	pop    %ebx
  20020c:	5e                   	pop    %esi
  20020d:	5f                   	pop    %edi
  20020e:	5d                   	pop    %ebp
  20020f:	c3                   	ret    

00200210 <printd>:
  200210:	55                   	push   %ebp
  200211:	89 e5                	mov    %esp,%ebp
  200213:	57                   	push   %edi
  200214:	56                   	push   %esi
  200215:	53                   	push   %ebx
  200216:	83 ec 10             	sub    $0x10,%esp
  200219:	ba 01 00 00 00       	mov    $0x1,%edx
  20021e:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  200221:	be 00 00 00 00       	mov    $0x0,%esi
  200226:	b8 04 00 00 00       	mov    $0x4,%eax
  20022b:	89 d3                	mov    %edx,%ebx
  20022d:	89 f7                	mov    %esi,%edi
  20022f:	cd 80                	int    $0x80
  200231:	83 c4 10             	add    $0x10,%esp
  200234:	5b                   	pop    %ebx
  200235:	5e                   	pop    %esi
  200236:	5f                   	pop    %edi
  200237:	5d                   	pop    %ebp
  200238:	c3                   	ret    

00200239 <printf>:
  200239:	55                   	push   %ebp
  20023a:	89 e5                	mov    %esp,%ebp
  20023c:	57                   	push   %edi
  20023d:	56                   	push   %esi
  20023e:	53                   	push   %ebx
  20023f:	83 ec 18             	sub    $0x18,%esp
  200242:	8d 45 0c             	lea    0xc(%ebp),%eax
  200245:	89 45 dc             	mov    %eax,-0x24(%ebp)
  200248:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  20024c:	0f 84 c4 00 00 00    	je     200316 <printf+0xdd>
  200252:	8b 45 08             	mov    0x8(%ebp),%eax
  200255:	8a 00                	mov    (%eax),%al
  200257:	84 c0                	test   %al,%al
  200259:	0f 84 b7 00 00 00    	je     200316 <printf+0xdd>
  20025f:	3c 25                	cmp    $0x25,%al
  200261:	75 7e                	jne    2002e1 <printf+0xa8>
  200263:	8b 45 08             	mov    0x8(%ebp),%eax
  200266:	40                   	inc    %eax
  200267:	89 45 e0             	mov    %eax,-0x20(%ebp)
  20026a:	8b 45 08             	mov    0x8(%ebp),%eax
  20026d:	8a 40 01             	mov    0x1(%eax),%al
  200270:	3c 64                	cmp    $0x64,%al
  200272:	74 34                	je     2002a8 <printf+0x6f>
  200274:	3c 73                	cmp    $0x73,%al
  200276:	74 52                	je     2002ca <printf+0x91>
  200278:	3c 63                	cmp    $0x63,%al
  20027a:	0f 85 82 00 00 00    	jne    200302 <printf+0xc9>
  200280:	8b 45 dc             	mov    -0x24(%ebp),%eax
  200283:	8d 78 04             	lea    0x4(%eax),%edi
  200286:	89 7d dc             	mov    %edi,-0x24(%ebp)
  200289:	8b 00                	mov    (%eax),%eax
  20028b:	88 45 f1             	mov    %al,-0xf(%ebp)
  20028e:	ba 01 00 00 00       	mov    $0x1,%edx
  200293:	be 00 00 00 00       	mov    $0x0,%esi
  200298:	b8 04 00 00 00       	mov    $0x4,%eax
  20029d:	89 d3                	mov    %edx,%ebx
  20029f:	8d 4d f1             	lea    -0xf(%ebp),%ecx
  2002a2:	89 f7                	mov    %esi,%edi
  2002a4:	cd 80                	int    $0x80
  2002a6:	eb 5a                	jmp    200302 <printf+0xc9>
  2002a8:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
  2002ac:	c6 45 f2 64          	movb   $0x64,-0xe(%ebp)
  2002b0:	ba 01 00 00 00       	mov    $0x1,%edx
  2002b5:	be 00 00 00 00       	mov    $0x0,%esi
  2002ba:	b8 04 00 00 00       	mov    $0x4,%eax
  2002bf:	89 d3                	mov    %edx,%ebx
  2002c1:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  2002c4:	89 f7                	mov    %esi,%edi
  2002c6:	cd 80                	int    $0x80
  2002c8:	eb 38                	jmp    200302 <printf+0xc9>
  2002ca:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  2002cd:	89 d8                	mov    %ebx,%eax
  2002cf:	83 c3 04             	add    $0x4,%ebx
  2002d2:	89 5d dc             	mov    %ebx,-0x24(%ebp)
  2002d5:	ff 30                	pushl  (%eax)
  2002d7:	e8 f9 fe ff ff       	call   2001d5 <prints>
  2002dc:	83 c4 04             	add    $0x4,%esp
  2002df:	eb 21                	jmp    200302 <printf+0xc9>
  2002e1:	88 45 f3             	mov    %al,-0xd(%ebp)
  2002e4:	ba 01 00 00 00       	mov    $0x1,%edx
  2002e9:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  2002ec:	be 00 00 00 00       	mov    $0x0,%esi
  2002f1:	b8 04 00 00 00       	mov    $0x4,%eax
  2002f6:	89 d3                	mov    %edx,%ebx
  2002f8:	89 f7                	mov    %esi,%edi
  2002fa:	cd 80                	int    $0x80
  2002fc:	8b 45 08             	mov    0x8(%ebp),%eax
  2002ff:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200302:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  200305:	89 c8                	mov    %ecx,%eax
  200307:	40                   	inc    %eax
  200308:	89 45 08             	mov    %eax,0x8(%ebp)
  20030b:	8a 41 01             	mov    0x1(%ecx),%al
  20030e:	84 c0                	test   %al,%al
  200310:	0f 85 49 ff ff ff    	jne    20025f <printf+0x26>
  200316:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200319:	5b                   	pop    %ebx
  20031a:	5e                   	pop    %esi
  20031b:	5f                   	pop    %edi
  20031c:	5d                   	pop    %ebp
  20031d:	c3                   	ret    
