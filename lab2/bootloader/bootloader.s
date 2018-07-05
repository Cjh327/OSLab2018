
bootloader.elf:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
    7c00:	fa                   	cli    
    7c01:	e4 92                	in     $0x92,%al
    7c03:	0c 02                	or     $0x2,%al
    7c05:	e6 92                	out    %al,$0x92
    7c07:	67 66 0f 01 15       	lgdtw  (%di)
    7c0c:	54                   	push   %esp
    7c0d:	7c 00                	jl     7c0f <start+0xf>
    7c0f:	00 0f                	add    %cl,(%edi)
    7c11:	20 c0                	and    %al,%al
    7c13:	0c 01                	or     $0x1,%al
    7c15:	0f 22 c0             	mov    %eax,%cr0
    7c18:	66 ea 20 7c 00 00    	ljmpw  $0x0,$0x7c20
    7c1e:	08 00                	or     %al,(%eax)

00007c20 <start32>:
    7c20:	66 b8 10 00          	mov    $0x10,%ax
    7c24:	8e d0                	mov    %eax,%ss
    7c26:	66 b8 18 00          	mov    $0x18,%ax
    7c2a:	8e e8                	mov    %eax,%gs
    7c2c:	bd 00 00 00 00       	mov    $0x0,%ebp
    7c31:	bc 00 00 00 08       	mov    $0x8000000,%esp
    7c36:	e9 9b 00 00 00       	jmp    7cd6 <bootMain>
    7c3b:	90                   	nop

00007c3c <gdt>:
	...
    7c44:	ff                   	(bad)  
    7c45:	ff 00                	incl   (%eax)
    7c47:	00 00                	add    %al,(%eax)
    7c49:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7c50:	00                   	.byte 0x0
    7c51:	92                   	xchg   %eax,%edx
    7c52:	cf                   	iret   
	...

00007c54 <gdtDesc>:
    7c54:	17                   	pop    %ss
    7c55:	00 3c 7c             	add    %bh,(%esp,%edi,2)
	...

00007c5a <waitDisk>:
    7c5a:	55                   	push   %ebp
    7c5b:	89 e5                	mov    %esp,%ebp
    7c5d:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7c62:	ec                   	in     (%dx),%al
    7c63:	25 c0 00 00 00       	and    $0xc0,%eax
    7c68:	83 f8 40             	cmp    $0x40,%eax
    7c6b:	75 f5                	jne    7c62 <waitDisk+0x8>
    7c6d:	5d                   	pop    %ebp
    7c6e:	c3                   	ret    

00007c6f <readSect>:
    7c6f:	55                   	push   %ebp
    7c70:	89 e5                	mov    %esp,%ebp
    7c72:	53                   	push   %ebx
    7c73:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7c76:	e8 df ff ff ff       	call   7c5a <waitDisk>
    7c7b:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7c80:	b0 01                	mov    $0x1,%al
    7c82:	ee                   	out    %al,(%dx)
    7c83:	ba f3 01 00 00       	mov    $0x1f3,%edx
    7c88:	88 c8                	mov    %cl,%al
    7c8a:	ee                   	out    %al,(%dx)
    7c8b:	89 c8                	mov    %ecx,%eax
    7c8d:	c1 f8 08             	sar    $0x8,%eax
    7c90:	ba f4 01 00 00       	mov    $0x1f4,%edx
    7c95:	ee                   	out    %al,(%dx)
    7c96:	89 c8                	mov    %ecx,%eax
    7c98:	c1 f8 10             	sar    $0x10,%eax
    7c9b:	ba f5 01 00 00       	mov    $0x1f5,%edx
    7ca0:	ee                   	out    %al,(%dx)
    7ca1:	89 c8                	mov    %ecx,%eax
    7ca3:	c1 f8 18             	sar    $0x18,%eax
    7ca6:	83 c8 e0             	or     $0xffffffe0,%eax
    7ca9:	ba f6 01 00 00       	mov    $0x1f6,%edx
    7cae:	ee                   	out    %al,(%dx)
    7caf:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7cb4:	b0 20                	mov    $0x20,%al
    7cb6:	ee                   	out    %al,(%dx)
    7cb7:	e8 9e ff ff ff       	call   7c5a <waitDisk>
    7cbc:	31 c9                	xor    %ecx,%ecx
    7cbe:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7cc3:	ed                   	in     (%dx),%eax
    7cc4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7cc7:	89 04 8b             	mov    %eax,(%ebx,%ecx,4)
    7cca:	41                   	inc    %ecx
    7ccb:	81 f9 80 00 00 00    	cmp    $0x80,%ecx
    7cd1:	75 f0                	jne    7cc3 <readSect+0x54>
    7cd3:	5b                   	pop    %ebx
    7cd4:	5d                   	pop    %ebp
    7cd5:	c3                   	ret    

00007cd6 <bootMain>:
    7cd6:	55                   	push   %ebp
    7cd7:	89 e5                	mov    %esp,%ebp
    7cd9:	56                   	push   %esi
    7cda:	53                   	push   %ebx
    7cdb:	31 db                	xor    %ebx,%ebx
    7cdd:	43                   	inc    %ebx
    7cde:	53                   	push   %ebx
    7cdf:	8d 83 ff 7f 02 00    	lea    0x27fff(%ebx),%eax
    7ce5:	c1 e0 09             	shl    $0x9,%eax
    7ce8:	50                   	push   %eax
    7ce9:	e8 81 ff ff ff       	call   7c6f <readSect>
    7cee:	58                   	pop    %eax
    7cef:	5a                   	pop    %edx
    7cf0:	81 fb c8 00 00 00    	cmp    $0xc8,%ebx
    7cf6:	75 e5                	jne    7cdd <bootMain+0x7>
    7cf8:	a1 1c 00 00 05       	mov    0x500001c,%eax
    7cfd:	05 00 00 00 05       	add    $0x5000000,%eax
    7d02:	31 c9                	xor    %ecx,%ecx
    7d04:	0f b7 15 2c 00 00 05 	movzwl 0x500002c,%edx
    7d0b:	39 d1                	cmp    %edx,%ecx
    7d0d:	7d 3b                	jge    7d4a <bootMain+0x74>
    7d0f:	83 38 01             	cmpl   $0x1,(%eax)
    7d12:	74 06                	je     7d1a <bootMain+0x44>
    7d14:	83 c0 20             	add    $0x20,%eax
    7d17:	41                   	inc    %ecx
    7d18:	eb ea                	jmp    7d04 <bootMain+0x2e>
    7d1a:	8b 50 08             	mov    0x8(%eax),%edx
    7d1d:	8b 70 04             	mov    0x4(%eax),%esi
    7d20:	29 d6                	sub    %edx,%esi
    7d22:	8b 58 10             	mov    0x10(%eax),%ebx
    7d25:	03 58 08             	add    0x8(%eax),%ebx
    7d28:	39 da                	cmp    %ebx,%edx
    7d2a:	73 0d                	jae    7d39 <bootMain+0x63>
    7d2c:	42                   	inc    %edx
    7d2d:	8a 9c 16 ff ff ff 04 	mov    0x4ffffff(%esi,%edx,1),%bl
    7d34:	88 5a ff             	mov    %bl,-0x1(%edx)
    7d37:	eb e9                	jmp    7d22 <bootMain+0x4c>
    7d39:	8b 58 14             	mov    0x14(%eax),%ebx
    7d3c:	03 58 08             	add    0x8(%eax),%ebx
    7d3f:	39 da                	cmp    %ebx,%edx
    7d41:	73 d1                	jae    7d14 <bootMain+0x3e>
    7d43:	42                   	inc    %edx
    7d44:	c6 42 ff 00          	movb   $0x0,-0x1(%edx)
    7d48:	eb ef                	jmp    7d39 <bootMain+0x63>
    7d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    7d4d:	5b                   	pop    %ebx
    7d4e:	5e                   	pop    %esi
    7d4f:	5d                   	pop    %ebp
    7d50:	ff 25 18 00 00 05    	jmp    *0x5000018
