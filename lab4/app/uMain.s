
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	53                   	push   %ebx
  200005:	e8 3a 04 00 00       	call   200444 <fork>
  20000a:	85 c0                	test   %eax,%eax
  20000c:	75 4a                	jne    200058 <uEntry+0x58>
  20000e:	c7 05 f4 16 20 00 02 	movl   $0x2,0x2016f4
  200015:	00 00 00 
  200018:	b8 02 00 00 00       	mov    $0x2,%eax
  20001d:	bb 08 00 00 00       	mov    $0x8,%ebx
  200022:	eb 05                	jmp    200029 <uEntry+0x29>
  200024:	a1 f4 16 20 00       	mov    0x2016f4,%eax
  200029:	4b                   	dec    %ebx
  20002a:	51                   	push   %ecx
  20002b:	53                   	push   %ebx
  20002c:	50                   	push   %eax
  20002d:	68 a0 04 20 00       	push   $0x2004a0
  200032:	e8 ed 02 00 00       	call   200324 <printf>
  200037:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  20003e:	e8 21 04 00 00       	call   200464 <sleep>
  200043:	83 c4 10             	add    $0x10,%esp
  200046:	85 db                	test   %ebx,%ebx
  200048:	75 da                	jne    200024 <uEntry+0x24>
  20004a:	e8 35 04 00 00       	call   200484 <exit>
  20004f:	31 c0                	xor    %eax,%eax
  200051:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  200054:	c9                   	leave  
  200055:	c3                   	ret    
  200056:	66 90                	xchg   %ax,%ax
  200058:	40                   	inc    %eax
  200059:	74 f4                	je     20004f <uEntry+0x4f>
  20005b:	c7 05 f4 16 20 00 01 	movl   $0x1,0x2016f4
  200062:	00 00 00 
  200065:	b8 01 00 00 00       	mov    $0x1,%eax
  20006a:	bb 08 00 00 00       	mov    $0x8,%ebx
  20006f:	eb 08                	jmp    200079 <uEntry+0x79>
  200071:	8d 76 00             	lea    0x0(%esi),%esi
  200074:	a1 f4 16 20 00       	mov    0x2016f4,%eax
  200079:	4b                   	dec    %ebx
  20007a:	52                   	push   %edx
  20007b:	53                   	push   %ebx
  20007c:	50                   	push   %eax
  20007d:	68 bd 04 20 00       	push   $0x2004bd
  200082:	e8 9d 02 00 00       	call   200324 <printf>
  200087:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  20008e:	e8 d1 03 00 00       	call   200464 <sleep>
  200093:	83 c4 10             	add    $0x10,%esp
  200096:	85 db                	test   %ebx,%ebx
  200098:	75 da                	jne    200074 <uEntry+0x74>
  20009a:	eb ae                	jmp    20004a <uEntry+0x4a>

0020009c <syscall>:
  20009c:	55                   	push   %ebp
  20009d:	89 e5                	mov    %esp,%ebp
  20009f:	57                   	push   %edi
  2000a0:	56                   	push   %esi
  2000a1:	53                   	push   %ebx
  2000a2:	8b 55 14             	mov    0x14(%ebp),%edx
  2000a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2000a8:	8b 45 08             	mov    0x8(%ebp),%eax
  2000ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2000ae:	8b 7d 18             	mov    0x18(%ebp),%edi
  2000b1:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2000b4:	cd 80                	int    $0x80
  2000b6:	5b                   	pop    %ebx
  2000b7:	5e                   	pop    %esi
  2000b8:	5f                   	pop    %edi
  2000b9:	5d                   	pop    %ebp
  2000ba:	c3                   	ret    
  2000bb:	90                   	nop

002000bc <printc>:
  2000bc:	55                   	push   %ebp
  2000bd:	89 e5                	mov    %esp,%ebp
  2000bf:	57                   	push   %edi
  2000c0:	56                   	push   %esi
  2000c1:	53                   	push   %ebx
  2000c2:	50                   	push   %eax
  2000c3:	ba 01 00 00 00       	mov    $0x1,%edx
  2000c8:	8d 4d f0             	lea    -0x10(%ebp),%ecx
  2000cb:	31 f6                	xor    %esi,%esi
  2000cd:	b8 04 00 00 00       	mov    $0x4,%eax
  2000d2:	89 d3                	mov    %edx,%ebx
  2000d4:	89 f7                	mov    %esi,%edi
  2000d6:	cd 80                	int    $0x80
  2000d8:	5a                   	pop    %edx
  2000d9:	5b                   	pop    %ebx
  2000da:	5e                   	pop    %esi
  2000db:	5f                   	pop    %edi
  2000dc:	5d                   	pop    %ebp
  2000dd:	c3                   	ret    
  2000de:	66 90                	xchg   %ax,%ax

002000e0 <prints>:
  2000e0:	55                   	push   %ebp
  2000e1:	89 e5                	mov    %esp,%ebp
  2000e3:	57                   	push   %edi
  2000e4:	56                   	push   %esi
  2000e5:	53                   	push   %ebx
  2000e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2000e9:	80 39 00             	cmpb   $0x0,(%ecx)
  2000ec:	74 20                	je     20010e <prints+0x2e>
  2000ee:	31 c0                	xor    %eax,%eax
  2000f0:	40                   	inc    %eax
  2000f1:	89 c2                	mov    %eax,%edx
  2000f3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2000f7:	75 f7                	jne    2000f0 <prints+0x10>
  2000f9:	31 f6                	xor    %esi,%esi
  2000fb:	bb 01 00 00 00       	mov    $0x1,%ebx
  200100:	b8 04 00 00 00       	mov    $0x4,%eax
  200105:	89 f7                	mov    %esi,%edi
  200107:	cd 80                	int    $0x80
  200109:	5b                   	pop    %ebx
  20010a:	5e                   	pop    %esi
  20010b:	5f                   	pop    %edi
  20010c:	5d                   	pop    %ebp
  20010d:	c3                   	ret    
  20010e:	31 d2                	xor    %edx,%edx
  200110:	eb e7                	jmp    2000f9 <prints+0x19>
  200112:	66 90                	xchg   %ax,%ax

00200114 <printd>:
  200114:	55                   	push   %ebp
  200115:	89 e5                	mov    %esp,%ebp
  200117:	57                   	push   %edi
  200118:	56                   	push   %esi
  200119:	53                   	push   %ebx
  20011a:	83 ec 28             	sub    $0x28,%esp
  20011d:	8b 55 08             	mov    0x8(%ebp),%edx
  200120:	85 d2                	test   %edx,%edx
  200122:	0f 84 c8 00 00 00    	je     2001f0 <printd+0xdc>
  200128:	81 7d 08 00 00 00 80 	cmpl   $0x80000000,0x8(%ebp)
  20012f:	0f 84 db 00 00 00    	je     200210 <printd+0xfc>
  200135:	8b 45 08             	mov    0x8(%ebp),%eax
  200138:	85 c0                	test   %eax,%eax
  20013a:	0f 88 fc 00 00 00    	js     20023c <printd+0x128>
  200140:	8d 45 df             	lea    -0x21(%ebp),%eax
  200143:	89 45 cc             	mov    %eax,-0x34(%ebp)
  200146:	31 f6                	xor    %esi,%esi
  200148:	8d 4d e0             	lea    -0x20(%ebp),%ecx
  20014b:	89 75 d0             	mov    %esi,-0x30(%ebp)
  20014e:	8b 75 08             	mov    0x8(%ebp),%esi
  200151:	eb 04                	jmp    200157 <printd+0x43>
  200153:	90                   	nop
  200154:	89 7d d0             	mov    %edi,-0x30(%ebp)
  200157:	8b 45 d0             	mov    -0x30(%ebp),%eax
  20015a:	8d 78 01             	lea    0x1(%eax),%edi
  20015d:	89 f0                	mov    %esi,%eax
  20015f:	bb 0a 00 00 00       	mov    $0xa,%ebx
  200164:	99                   	cltd   
  200165:	f7 fb                	idiv   %ebx
  200167:	8d 42 30             	lea    0x30(%edx),%eax
  20016a:	88 c3                	mov    %al,%bl
  20016c:	8b 55 cc             	mov    -0x34(%ebp),%edx
  20016f:	88 04 3a             	mov    %al,(%edx,%edi,1)
  200172:	b8 67 66 66 66       	mov    $0x66666667,%eax
  200177:	f7 ee                	imul   %esi
  200179:	89 d0                	mov    %edx,%eax
  20017b:	c1 f8 02             	sar    $0x2,%eax
  20017e:	c1 fe 1f             	sar    $0x1f,%esi
  200181:	29 f0                	sub    %esi,%eax
  200183:	89 c6                	mov    %eax,%esi
  200185:	75 cd                	jne    200154 <printd+0x40>
  200187:	8b 75 d0             	mov    -0x30(%ebp),%esi
  20018a:	85 f6                	test   %esi,%esi
  20018c:	74 2a                	je     2001b8 <printd+0xa4>
  20018e:	8d 14 31             	lea    (%ecx,%esi,1),%edx
  200191:	31 c0                	xor    %eax,%eax
  200193:	88 5d d0             	mov    %bl,-0x30(%ebp)
  200196:	eb 05                	jmp    20019d <printd+0x89>
  200198:	8a 1a                	mov    (%edx),%bl
  20019a:	88 5d d0             	mov    %bl,-0x30(%ebp)
  20019d:	8a 1c 01             	mov    (%ecx,%eax,1),%bl
  2001a0:	88 5d cc             	mov    %bl,-0x34(%ebp)
  2001a3:	8a 5d d0             	mov    -0x30(%ebp),%bl
  2001a6:	88 1c 01             	mov    %bl,(%ecx,%eax,1)
  2001a9:	8a 5d cc             	mov    -0x34(%ebp),%bl
  2001ac:	88 1a                	mov    %bl,(%edx)
  2001ae:	40                   	inc    %eax
  2001af:	4a                   	dec    %edx
  2001b0:	89 f3                	mov    %esi,%ebx
  2001b2:	29 c3                	sub    %eax,%ebx
  2001b4:	39 c3                	cmp    %eax,%ebx
  2001b6:	7f e0                	jg     200198 <printd+0x84>
  2001b8:	c6 44 3d e0 00       	movb   $0x0,-0x20(%ebp,%edi,1)
  2001bd:	80 7d e0 00          	cmpb   $0x0,-0x20(%ebp)
  2001c1:	0f 84 99 00 00 00    	je     200260 <printd+0x14c>
  2001c7:	31 c0                	xor    %eax,%eax
  2001c9:	8d 76 00             	lea    0x0(%esi),%esi
  2001cc:	40                   	inc    %eax
  2001cd:	89 c2                	mov    %eax,%edx
  2001cf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2001d3:	75 f7                	jne    2001cc <printd+0xb8>
  2001d5:	31 f6                	xor    %esi,%esi
  2001d7:	bb 01 00 00 00       	mov    $0x1,%ebx
  2001dc:	b8 04 00 00 00       	mov    $0x4,%eax
  2001e1:	89 f7                	mov    %esi,%edi
  2001e3:	cd 80                	int    $0x80
  2001e5:	83 c4 28             	add    $0x28,%esp
  2001e8:	5b                   	pop    %ebx
  2001e9:	5e                   	pop    %esi
  2001ea:	5f                   	pop    %edi
  2001eb:	5d                   	pop    %ebp
  2001ec:	c3                   	ret    
  2001ed:	8d 76 00             	lea    0x0(%esi),%esi
  2001f0:	ba 01 00 00 00       	mov    $0x1,%edx
  2001f5:	b9 db 04 20 00       	mov    $0x2004db,%ecx
  2001fa:	b8 04 00 00 00       	mov    $0x4,%eax
  2001ff:	89 d3                	mov    %edx,%ebx
  200201:	8b 7d 08             	mov    0x8(%ebp),%edi
  200204:	89 fe                	mov    %edi,%esi
  200206:	cd 80                	int    $0x80
  200208:	83 c4 28             	add    $0x28,%esp
  20020b:	5b                   	pop    %ebx
  20020c:	5e                   	pop    %esi
  20020d:	5f                   	pop    %edi
  20020e:	5d                   	pop    %ebp
  20020f:	c3                   	ret    
  200210:	31 d2                	xor    %edx,%edx
  200212:	66 90                	xchg   %ax,%ax
  200214:	42                   	inc    %edx
  200215:	80 ba dd 04 20 00 00 	cmpb   $0x0,0x2004dd(%edx)
  20021c:	75 f6                	jne    200214 <printd+0x100>
  20021e:	31 f6                	xor    %esi,%esi
  200220:	bb 01 00 00 00       	mov    $0x1,%ebx
  200225:	b8 04 00 00 00       	mov    $0x4,%eax
  20022a:	b9 dd 04 20 00       	mov    $0x2004dd,%ecx
  20022f:	89 f7                	mov    %esi,%edi
  200231:	cd 80                	int    $0x80
  200233:	83 c4 28             	add    $0x28,%esp
  200236:	5b                   	pop    %ebx
  200237:	5e                   	pop    %esi
  200238:	5f                   	pop    %edi
  200239:	5d                   	pop    %ebp
  20023a:	c3                   	ret    
  20023b:	90                   	nop
  20023c:	f7 5d 08             	negl   0x8(%ebp)
  20023f:	c6 45 df 2d          	movb   $0x2d,-0x21(%ebp)
  200243:	ba 01 00 00 00       	mov    $0x1,%edx
  200248:	8d 4d df             	lea    -0x21(%ebp),%ecx
  20024b:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  20024e:	31 f6                	xor    %esi,%esi
  200250:	b8 04 00 00 00       	mov    $0x4,%eax
  200255:	89 d3                	mov    %edx,%ebx
  200257:	89 f7                	mov    %esi,%edi
  200259:	cd 80                	int    $0x80
  20025b:	e9 e6 fe ff ff       	jmp    200146 <printd+0x32>
  200260:	31 d2                	xor    %edx,%edx
  200262:	e9 6e ff ff ff       	jmp    2001d5 <printd+0xc1>
  200267:	90                   	nop

00200268 <printx>:
  200268:	55                   	push   %ebp
  200269:	89 e5                	mov    %esp,%ebp
  20026b:	57                   	push   %edi
  20026c:	56                   	push   %esi
  20026d:	53                   	push   %ebx
  20026e:	83 ec 20             	sub    $0x20,%esp
  200271:	8b 75 08             	mov    0x8(%ebp),%esi
  200274:	85 f6                	test   %esi,%esi
  200276:	0f 84 84 00 00 00    	je     200300 <printx+0x98>
  20027c:	b8 01 00 00 00       	mov    $0x1,%eax
  200281:	eb 0e                	jmp    200291 <printx+0x29>
  200283:	90                   	nop
  200284:	83 c1 57             	add    $0x57,%ecx
  200287:	88 4c 05 df          	mov    %cl,-0x21(%ebp,%eax,1)
  20028b:	40                   	inc    %eax
  20028c:	c1 ee 04             	shr    $0x4,%esi
  20028f:	74 1c                	je     2002ad <printx+0x45>
  200291:	8d 58 ff             	lea    -0x1(%eax),%ebx
  200294:	89 f1                	mov    %esi,%ecx
  200296:	83 e1 0f             	and    $0xf,%ecx
  200299:	89 c7                	mov    %eax,%edi
  20029b:	83 f9 09             	cmp    $0x9,%ecx
  20029e:	77 e4                	ja     200284 <printx+0x1c>
  2002a0:	83 c1 30             	add    $0x30,%ecx
  2002a3:	88 4c 05 df          	mov    %cl,-0x21(%ebp,%eax,1)
  2002a7:	40                   	inc    %eax
  2002a8:	c1 ee 04             	shr    $0x4,%esi
  2002ab:	75 e4                	jne    200291 <printx+0x29>
  2002ad:	85 db                	test   %ebx,%ebx
  2002af:	74 6c                	je     20031d <printx+0xb5>
  2002b1:	31 c0                	xor    %eax,%eax
  2002b3:	8d 4d e0             	lea    -0x20(%ebp),%ecx
  2002b6:	66 90                	xchg   %ax,%ax
  2002b8:	0f b6 34 01          	movzbl (%ecx,%eax,1),%esi
  2002bc:	8a 14 19             	mov    (%ecx,%ebx,1),%dl
  2002bf:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  2002c2:	89 f2                	mov    %esi,%edx
  2002c4:	88 14 19             	mov    %dl,(%ecx,%ebx,1)
  2002c7:	40                   	inc    %eax
  2002c8:	4b                   	dec    %ebx
  2002c9:	39 d8                	cmp    %ebx,%eax
  2002cb:	7c eb                	jl     2002b8 <printx+0x50>
  2002cd:	c6 44 3d e0 00       	movb   $0x0,-0x20(%ebp,%edi,1)
  2002d2:	31 c0                	xor    %eax,%eax
  2002d4:	31 d2                	xor    %edx,%edx
  2002d6:	80 7d e0 00          	cmpb   $0x0,-0x20(%ebp)
  2002da:	74 09                	je     2002e5 <printx+0x7d>
  2002dc:	40                   	inc    %eax
  2002dd:	89 c2                	mov    %eax,%edx
  2002df:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  2002e3:	75 f7                	jne    2002dc <printx+0x74>
  2002e5:	31 f6                	xor    %esi,%esi
  2002e7:	bb 01 00 00 00       	mov    $0x1,%ebx
  2002ec:	b8 04 00 00 00       	mov    $0x4,%eax
  2002f1:	89 f7                	mov    %esi,%edi
  2002f3:	cd 80                	int    $0x80
  2002f5:	83 c4 20             	add    $0x20,%esp
  2002f8:	5b                   	pop    %ebx
  2002f9:	5e                   	pop    %esi
  2002fa:	5f                   	pop    %edi
  2002fb:	5d                   	pop    %ebp
  2002fc:	c3                   	ret    
  2002fd:	8d 76 00             	lea    0x0(%esi),%esi
  200300:	ba 01 00 00 00       	mov    $0x1,%edx
  200305:	b9 db 04 20 00       	mov    $0x2004db,%ecx
  20030a:	b8 04 00 00 00       	mov    $0x4,%eax
  20030f:	89 d3                	mov    %edx,%ebx
  200311:	89 f7                	mov    %esi,%edi
  200313:	cd 80                	int    $0x80
  200315:	83 c4 20             	add    $0x20,%esp
  200318:	5b                   	pop    %ebx
  200319:	5e                   	pop    %esi
  20031a:	5f                   	pop    %edi
  20031b:	5d                   	pop    %ebp
  20031c:	c3                   	ret    
  20031d:	8d 4d e0             	lea    -0x20(%ebp),%ecx
  200320:	eb ab                	jmp    2002cd <printx+0x65>
  200322:	66 90                	xchg   %ax,%ax

00200324 <printf>:
  200324:	55                   	push   %ebp
  200325:	89 e5                	mov    %esp,%ebp
  200327:	57                   	push   %edi
  200328:	56                   	push   %esi
  200329:	53                   	push   %ebx
  20032a:	83 ec 18             	sub    $0x18,%esp
  20032d:	8d 45 0c             	lea    0xc(%ebp),%eax
  200330:	89 45 dc             	mov    %eax,-0x24(%ebp)
  200333:	8b 4d 08             	mov    0x8(%ebp),%ecx
  200336:	85 c9                	test   %ecx,%ecx
  200338:	0f 84 82 00 00 00    	je     2003c0 <printf+0x9c>
  20033e:	8b 45 08             	mov    0x8(%ebp),%eax
  200341:	8a 00                	mov    (%eax),%al
  200343:	84 c0                	test   %al,%al
  200345:	75 33                	jne    20037a <printf+0x56>
  200347:	eb 77                	jmp    2003c0 <printf+0x9c>
  200349:	8d 76 00             	lea    0x0(%esi),%esi
  20034c:	88 45 f3             	mov    %al,-0xd(%ebp)
  20034f:	ba 01 00 00 00       	mov    $0x1,%edx
  200354:	31 f6                	xor    %esi,%esi
  200356:	b8 04 00 00 00       	mov    $0x4,%eax
  20035b:	89 d3                	mov    %edx,%ebx
  20035d:	8d 4d f3             	lea    -0xd(%ebp),%ecx
  200360:	89 f7                	mov    %esi,%edi
  200362:	cd 80                	int    $0x80
  200364:	8b 45 08             	mov    0x8(%ebp),%eax
  200367:	89 45 e0             	mov    %eax,-0x20(%ebp)
  20036a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  20036d:	89 d8                	mov    %ebx,%eax
  20036f:	40                   	inc    %eax
  200370:	89 45 08             	mov    %eax,0x8(%ebp)
  200373:	8a 43 01             	mov    0x1(%ebx),%al
  200376:	84 c0                	test   %al,%al
  200378:	74 46                	je     2003c0 <printf+0x9c>
  20037a:	3c 25                	cmp    $0x25,%al
  20037c:	75 ce                	jne    20034c <printf+0x28>
  20037e:	8b 45 08             	mov    0x8(%ebp),%eax
  200381:	40                   	inc    %eax
  200382:	89 45 e0             	mov    %eax,-0x20(%ebp)
  200385:	8b 45 08             	mov    0x8(%ebp),%eax
  200388:	8a 40 01             	mov    0x1(%eax),%al
  20038b:	3c 64                	cmp    $0x64,%al
  20038d:	0f 84 95 00 00 00    	je     200428 <printf+0x104>
  200393:	7e 33                	jle    2003c8 <printf+0xa4>
  200395:	3c 73                	cmp    $0x73,%al
  200397:	74 5b                	je     2003f4 <printf+0xd0>
  200399:	3c 78                	cmp    $0x78,%al
  20039b:	75 cd                	jne    20036a <printf+0x46>
  20039d:	8b 7d dc             	mov    -0x24(%ebp),%edi
  2003a0:	89 f8                	mov    %edi,%eax
  2003a2:	83 c7 04             	add    $0x4,%edi
  2003a5:	89 7d dc             	mov    %edi,-0x24(%ebp)
  2003a8:	ff 30                	pushl  (%eax)
  2003aa:	e8 b9 fe ff ff       	call   200268 <printx>
  2003af:	5a                   	pop    %edx
  2003b0:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  2003b3:	89 d8                	mov    %ebx,%eax
  2003b5:	40                   	inc    %eax
  2003b6:	89 45 08             	mov    %eax,0x8(%ebp)
  2003b9:	8a 43 01             	mov    0x1(%ebx),%al
  2003bc:	84 c0                	test   %al,%al
  2003be:	75 ba                	jne    20037a <printf+0x56>
  2003c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2003c3:	5b                   	pop    %ebx
  2003c4:	5e                   	pop    %esi
  2003c5:	5f                   	pop    %edi
  2003c6:	5d                   	pop    %ebp
  2003c7:	c3                   	ret    
  2003c8:	3c 63                	cmp    $0x63,%al
  2003ca:	75 9e                	jne    20036a <printf+0x46>
  2003cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  2003cf:	8d 48 04             	lea    0x4(%eax),%ecx
  2003d2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  2003d5:	8b 00                	mov    (%eax),%eax
  2003d7:	88 45 f2             	mov    %al,-0xe(%ebp)
  2003da:	ba 01 00 00 00       	mov    $0x1,%edx
  2003df:	31 f6                	xor    %esi,%esi
  2003e1:	b8 04 00 00 00       	mov    $0x4,%eax
  2003e6:	89 d3                	mov    %edx,%ebx
  2003e8:	8d 4d f2             	lea    -0xe(%ebp),%ecx
  2003eb:	89 f7                	mov    %esi,%edi
  2003ed:	cd 80                	int    $0x80
  2003ef:	e9 76 ff ff ff       	jmp    20036a <printf+0x46>
  2003f4:	8b 7d dc             	mov    -0x24(%ebp),%edi
  2003f7:	89 f8                	mov    %edi,%eax
  2003f9:	83 c7 04             	add    $0x4,%edi
  2003fc:	89 7d dc             	mov    %edi,-0x24(%ebp)
  2003ff:	8b 08                	mov    (%eax),%ecx
  200401:	80 39 00             	cmpb   $0x0,(%ecx)
  200404:	74 3a                	je     200440 <printf+0x11c>
  200406:	31 c0                	xor    %eax,%eax
  200408:	40                   	inc    %eax
  200409:	89 c2                	mov    %eax,%edx
  20040b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  20040f:	75 f7                	jne    200408 <printf+0xe4>
  200411:	31 f6                	xor    %esi,%esi
  200413:	bb 01 00 00 00       	mov    $0x1,%ebx
  200418:	b8 04 00 00 00       	mov    $0x4,%eax
  20041d:	89 f7                	mov    %esi,%edi
  20041f:	cd 80                	int    $0x80
  200421:	e9 44 ff ff ff       	jmp    20036a <printf+0x46>
  200426:	66 90                	xchg   %ax,%ax
  200428:	8b 7d dc             	mov    -0x24(%ebp),%edi
  20042b:	89 f8                	mov    %edi,%eax
  20042d:	83 c7 04             	add    $0x4,%edi
  200430:	89 7d dc             	mov    %edi,-0x24(%ebp)
  200433:	ff 30                	pushl  (%eax)
  200435:	e8 da fc ff ff       	call   200114 <printd>
  20043a:	58                   	pop    %eax
  20043b:	e9 2a ff ff ff       	jmp    20036a <printf+0x46>
  200440:	31 d2                	xor    %edx,%edx
  200442:	eb cd                	jmp    200411 <printf+0xed>

00200444 <fork>:
  200444:	55                   	push   %ebp
  200445:	89 e5                	mov    %esp,%ebp
  200447:	57                   	push   %edi
  200448:	56                   	push   %esi
  200449:	53                   	push   %ebx
  20044a:	ba 01 00 00 00       	mov    $0x1,%edx
  20044f:	31 f6                	xor    %esi,%esi
  200451:	b8 02 00 00 00       	mov    $0x2,%eax
  200456:	89 d3                	mov    %edx,%ebx
  200458:	89 d1                	mov    %edx,%ecx
  20045a:	89 f7                	mov    %esi,%edi
  20045c:	cd 80                	int    $0x80
  20045e:	5b                   	pop    %ebx
  20045f:	5e                   	pop    %esi
  200460:	5f                   	pop    %edi
  200461:	5d                   	pop    %ebp
  200462:	c3                   	ret    
  200463:	90                   	nop

00200464 <sleep>:
  200464:	55                   	push   %ebp
  200465:	89 e5                	mov    %esp,%ebp
  200467:	57                   	push   %edi
  200468:	56                   	push   %esi
  200469:	53                   	push   %ebx
  20046a:	ba 01 00 00 00       	mov    $0x1,%edx
  20046f:	31 f6                	xor    %esi,%esi
  200471:	b8 64 00 00 00       	mov    $0x64,%eax
  200476:	8b 5d 08             	mov    0x8(%ebp),%ebx
  200479:	89 d1                	mov    %edx,%ecx
  20047b:	89 f7                	mov    %esi,%edi
  20047d:	cd 80                	int    $0x80
  20047f:	5b                   	pop    %ebx
  200480:	5e                   	pop    %esi
  200481:	5f                   	pop    %edi
  200482:	5d                   	pop    %ebp
  200483:	c3                   	ret    

00200484 <exit>:
  200484:	55                   	push   %ebp
  200485:	89 e5                	mov    %esp,%ebp
  200487:	57                   	push   %edi
  200488:	56                   	push   %esi
  200489:	53                   	push   %ebx
  20048a:	b8 01 00 00 00       	mov    $0x1,%eax
  20048f:	31 f6                	xor    %esi,%esi
  200491:	89 c3                	mov    %eax,%ebx
  200493:	89 c1                	mov    %eax,%ecx
  200495:	89 c2                	mov    %eax,%edx
  200497:	89 f7                	mov    %esi,%edi
  200499:	cd 80                	int    $0x80
  20049b:	5b                   	pop    %ebx
  20049c:	5e                   	pop    %esi
  20049d:	5f                   	pop    %edi
  20049e:	5d                   	pop    %ebp
  20049f:	c3                   	ret    
