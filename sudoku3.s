	.file	"sudoku3.cpp"
	.section .rdata,"dr"
LC0:
	.ascii "%3d \0"
	.text
	.align 2
	.p2align 4,,15
.globl __ZNK5Board5printEv
	.def	__ZNK5Board5printEv;	.scl	2;	.type	32;	.endef
__ZNK5Board5printEv:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	xorl	%edi, %edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %eax
	movl	$0, -20(%ebp)
	movl	%eax, -16(%ebp)
	.p2align 4,,15
L9:
	movl	-16(%ebp), %eax
	movl	$8, %esi
	leal	(%edi,%eax), %ebx
	.p2align 4,,15
L8:
	movzbl	(%ebx), %eax
	incl	%ebx
	movl	$LC0, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	decl	%esi
	jns	L8
	movl	$10, (%esp)
	call	_putchar
	incl	-20(%ebp)
	addl	$9, %edi
	cmpl	$8, -20(%ebp)
	jle	L9
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.align 2
	.p2align 4,,15
.globl __ZN11SolveSudoku9initTableEv
	.def	__ZN11SolveSudoku9initTableEv;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku9initTableEv:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	subl	$124, %esp
	movl	8(%ebp), %eax
	movl	$0, -128(%ebp)
	movl	%eax, -124(%ebp)
L43:
	xorl	%ecx, %ecx
	.p2align 4,,15
L22:
	movb	$0, -120(%ecx,%ebp)
	incl	%ecx
	cmpl	$80, %ecx
	jle	L22
	movl	$954437177, %eax
	imull	-128(%ebp)
	movl	-128(%ebp), %eax
	movl	%edx, %ecx
	sarl	%ecx
	cltd
	subl	%edx, %ecx
	leal	0(,%ecx,8), %edx
	movl	%ecx, %edi
	leal	(%edx,%ecx), %eax
	movl	-128(%ebp), %ecx
	movl	%eax, %ebx
	subl	%eax, %ecx
	movl	%ecx, -132(%ebp)
	movl	-132(%ebp), %eax
	xorl	%ecx, %ecx
	leal	-120(%eax,%ebp), %edx
	.p2align 4,,15
L28:
	movb	$1, (%edx)
	leal	(%ebx,%ecx), %eax
	incl	%ecx
	movb	$1, -120(%eax,%ebp)
	addl	$9, %edx
	cmpl	$8, %ecx
	jle	L28
	movl	$1431655766, %eax
	leal	-24(%ebp), %ecx
	xorl	%ebx, %ebx
	imull	-132(%ebp)
	movl	-132(%ebp), %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%edx,%edx,2), %edx
	movl	$1431655766, %eax
	movl	%edx, -132(%ebp)
	imull	%edi
	movl	%edi, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	-132(%ebp), %eax
	leal	(%edx,%edx,2), %edx
	leal	(%edx,%edx,8), %edx
	addl	%eax, %edx
	addl	%ecx, %edx
L37:
	leal	-96(%edx), %ecx
	movl	$2, %eax
L36:
	movb	$1, (%ecx)
	incl	%ecx
	decl	%eax
	jns	L36
	incl	%ebx
	addl	$9, %edx
	cmpl	$2, %ebx
	jle	L37
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	.p2align 4,,15
L42:
	cmpb	$0, -120(%ecx,%ebp)
	je	L40
	movl	-124(%ebp), %ebx
	leal	(%esi,%edx), %eax
	incl	%edx
	movl	%ecx, 324(%ebx,%eax,4)
L40:
	incl	%ecx
	cmpl	$80, %ecx
	jle	L42
	incl	-128(%ebp)
	addl	$20, %esi
	cmpl	$80, -128(%ebp)
	jle	L43
	addl	$124, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.align 2
	.p2align 4,,15
.globl __ZNK11SolveSudoku9checkCellEi
	.def	__ZNK11SolveSudoku9checkCellEi;	.scl	2;	.type	32;	.endef
__ZNK11SolveSudoku9checkCellEi:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	12(%ebp), %edx
	movl	8(%ebp), %ecx
	cmpl	$80, %edx
	ja	L56
	jmp	*L140(,%edx,4)
	.section .rdata,"dr"
	.align 4
L140:
	.long	L59
	.long	L60
	.long	L61
	.long	L62
	.long	L63
	.long	L64
	.long	L65
	.long	L66
	.long	L67
	.long	L68
	.long	L69
	.long	L70
	.long	L71
	.long	L72
	.long	L73
	.long	L74
	.long	L75
	.long	L76
	.long	L77
	.long	L78
	.long	L79
	.long	L80
	.long	L81
	.long	L82
	.long	L83
	.long	L84
	.long	L85
	.long	L86
	.long	L87
	.long	L88
	.long	L89
	.long	L90
	.long	L91
	.long	L92
	.long	L93
	.long	L94
	.long	L95
	.long	L96
	.long	L97
	.long	L98
	.long	L99
	.long	L100
	.long	L101
	.long	L102
	.long	L103
	.long	L104
	.long	L105
	.long	L106
	.long	L107
	.long	L108
	.long	L109
	.long	L110
	.long	L111
	.long	L112
	.long	L113
	.long	L114
	.long	L115
	.long	L116
	.long	L117
	.long	L118
	.long	L119
	.long	L120
	.long	L121
	.long	L122
	.long	L123
	.long	L124
	.long	L125
	.long	L126
	.long	L127
	.long	L128
	.long	L129
	.long	L130
	.long	L131
	.long	L132
	.long	L133
	.long	L134
	.long	L135
	.long	L136
	.long	L137
	.long	L138
	.long	L139
	.text
L139:
	movl	32(%ecx), %edx
	movl	68(%ecx), %eax
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L253:
	orl	%edx, %eax
	movl	240(%ecx), %edx
	orl	%edx, %eax
	movl	244(%ecx), %edx
	orl	%edx, %eax
	movl	248(%ecx), %edx
	orl	%edx, %eax
	movl	276(%ecx), %edx
	orl	%edx, %eax
	movl	280(%ecx), %edx
	orl	%edx, %eax
	movl	284(%ecx), %edx
L254:
	orl	%edx, %eax
	movl	288(%ecx), %edx
	orl	%edx, %eax
	movl	292(%ecx), %edx
	orl	%edx, %eax
	movl	296(%ecx), %edx
	orl	%edx, %eax
	movl	300(%ecx), %edx
	orl	%edx, %eax
	movl	304(%ecx), %edx
	orl	%edx, %eax
	movl	308(%ecx), %edx
L255:
	orl	%edx, %eax
	movl	312(%ecx), %edx
	orl	%edx, %eax
	movl	316(%ecx), %edx
	orl	%edx, %eax
	.p2align 4,,15
L56:
	popl	%ebp
	ret
L138:
	movl	28(%ecx), %edx
	movl	64(%ecx), %eax
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	jmp	L253
L137:
	movl	24(%ecx), %edx
	movl	60(%ecx), %eax
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	jmp	L253
L136:
	movl	20(%ecx), %edx
	movl	56(%ecx), %eax
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
L252:
	orl	%edx, %eax
	movl	228(%ecx), %edx
	orl	%edx, %eax
	movl	232(%ecx), %edx
	orl	%edx, %eax
	movl	236(%ecx), %edx
	orl	%edx, %eax
	movl	264(%ecx), %edx
	orl	%edx, %eax
	movl	268(%ecx), %edx
	orl	%edx, %eax
	movl	272(%ecx), %edx
	jmp	L254
L135:
	movl	16(%ecx), %edx
	movl	52(%ecx), %eax
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	jmp	L252
L134:
	movl	12(%ecx), %edx
	movl	48(%ecx), %eax
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	jmp	L252
L133:
	movl	8(%ecx), %edx
	movl	44(%ecx), %eax
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
L251:
	orl	%edx, %eax
	movl	216(%ecx), %edx
	orl	%edx, %eax
	movl	220(%ecx), %edx
	orl	%edx, %eax
	movl	224(%ecx), %edx
	orl	%edx, %eax
	movl	252(%ecx), %edx
	orl	%edx, %eax
	movl	256(%ecx), %edx
	orl	%edx, %eax
	movl	260(%ecx), %edx
	jmp	L254
L132:
	movl	4(%ecx), %edx
	movl	40(%ecx), %eax
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	jmp	L251
L131:
	movl	(%ecx), %edx
	movl	36(%ecx), %eax
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	jmp	L251
L130:
	movl	32(%ecx), %edx
	movl	68(%ecx), %eax
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L250:
	orl	%edx, %eax
	movl	240(%ecx), %edx
	orl	%edx, %eax
	movl	244(%ecx), %edx
	orl	%edx, %eax
	movl	248(%ecx), %edx
	orl	%edx, %eax
	movl	252(%ecx), %edx
	orl	%edx, %eax
	movl	256(%ecx), %edx
	orl	%edx, %eax
	movl	260(%ecx), %edx
	orl	%edx, %eax
	movl	264(%ecx), %edx
	orl	%edx, %eax
	movl	268(%ecx), %edx
	orl	%edx, %eax
	movl	272(%ecx), %edx
L245:
	orl	%edx, %eax
	movl	276(%ecx), %edx
	orl	%edx, %eax
	movl	280(%ecx), %edx
	orl	%edx, %eax
	movl	284(%ecx), %edx
	jmp	L255
L129:
	movl	28(%ecx), %edx
	movl	64(%ecx), %eax
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	jmp	L250
L128:
	movl	24(%ecx), %edx
	movl	60(%ecx), %eax
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	jmp	L250
L127:
	movl	20(%ecx), %edx
	movl	56(%ecx), %eax
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
L248:
	orl	%edx, %eax
	movl	228(%ecx), %edx
	orl	%edx, %eax
	movl	232(%ecx), %edx
	orl	%edx, %eax
	movl	236(%ecx), %edx
	orl	%edx, %eax
	movl	252(%ecx), %edx
	orl	%edx, %eax
	movl	256(%ecx), %edx
	orl	%edx, %eax
	movl	260(%ecx), %edx
	orl	%edx, %eax
	movl	264(%ecx), %edx
	orl	%edx, %eax
	movl	268(%ecx), %edx
	orl	%edx, %eax
	movl	272(%ecx), %edx
	orl	%edx, %eax
	movl	276(%ecx), %edx
	orl	%edx, %eax
	movl	280(%ecx), %edx
	orl	%edx, %eax
	movl	284(%ecx), %edx
L249:
	orl	%edx, %eax
	movl	300(%ecx), %edx
	orl	%edx, %eax
	movl	304(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L126:
	movl	16(%ecx), %edx
	movl	52(%ecx), %eax
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	jmp	L248
L125:
	movl	12(%ecx), %edx
	movl	48(%ecx), %eax
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	jmp	L248
L124:
	movl	8(%ecx), %edx
	movl	44(%ecx), %eax
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
L246:
	orl	%edx, %eax
	movl	216(%ecx), %edx
	orl	%edx, %eax
	movl	220(%ecx), %edx
	orl	%edx, %eax
	movl	224(%ecx), %edx
	orl	%edx, %eax
	movl	252(%ecx), %edx
	orl	%edx, %eax
	movl	256(%ecx), %edx
	orl	%edx, %eax
	movl	260(%ecx), %edx
	orl	%edx, %eax
	movl	264(%ecx), %edx
	orl	%edx, %eax
	movl	268(%ecx), %edx
	orl	%edx, %eax
	movl	272(%ecx), %edx
	orl	%edx, %eax
	movl	276(%ecx), %edx
	orl	%edx, %eax
	movl	280(%ecx), %edx
	orl	%edx, %eax
	movl	284(%ecx), %edx
L247:
	orl	%edx, %eax
	movl	288(%ecx), %edx
	orl	%edx, %eax
	movl	292(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L123:
	movl	4(%ecx), %edx
	movl	40(%ecx), %eax
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	jmp	L246
L122:
	movl	(%ecx), %edx
	movl	36(%ecx), %eax
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	jmp	L246
L121:
	movl	32(%ecx), %edx
	movl	68(%ecx), %eax
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L244:
	orl	%edx, %eax
	movl	216(%ecx), %edx
	orl	%edx, %eax
	movl	220(%ecx), %edx
	orl	%edx, %eax
	movl	224(%ecx), %edx
	orl	%edx, %eax
	movl	228(%ecx), %edx
	orl	%edx, %eax
	movl	232(%ecx), %edx
	orl	%edx, %eax
	movl	236(%ecx), %edx
	orl	%edx, %eax
	movl	240(%ecx), %edx
	orl	%edx, %eax
	movl	244(%ecx), %edx
	orl	%edx, %eax
	movl	248(%ecx), %edx
	jmp	L245
L120:
	movl	28(%ecx), %edx
	movl	64(%ecx), %eax
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	jmp	L244
L119:
	movl	24(%ecx), %edx
	movl	60(%ecx), %eax
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	jmp	L244
L118:
	movl	20(%ecx), %edx
	movl	56(%ecx), %eax
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
L243:
	orl	%edx, %eax
	movl	216(%ecx), %edx
	orl	%edx, %eax
	movl	220(%ecx), %edx
	orl	%edx, %eax
	movl	224(%ecx), %edx
	orl	%edx, %eax
	movl	228(%ecx), %edx
	orl	%edx, %eax
	movl	232(%ecx), %edx
	orl	%edx, %eax
	movl	236(%ecx), %edx
	orl	%edx, %eax
	movl	240(%ecx), %edx
	orl	%edx, %eax
	movl	244(%ecx), %edx
	orl	%edx, %eax
	movl	248(%ecx), %edx
	orl	%edx, %eax
	movl	264(%ecx), %edx
	orl	%edx, %eax
	movl	268(%ecx), %edx
	orl	%edx, %eax
	movl	272(%ecx), %edx
	jmp	L249
L117:
	movl	16(%ecx), %edx
	movl	52(%ecx), %eax
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	jmp	L243
L116:
	movl	12(%ecx), %edx
	movl	48(%ecx), %eax
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	jmp	L243
L115:
	movl	8(%ecx), %edx
	movl	44(%ecx), %eax
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
L242:
	orl	%edx, %eax
	movl	216(%ecx), %edx
	orl	%edx, %eax
	movl	220(%ecx), %edx
	orl	%edx, %eax
	movl	224(%ecx), %edx
	orl	%edx, %eax
	movl	228(%ecx), %edx
	orl	%edx, %eax
	movl	232(%ecx), %edx
	orl	%edx, %eax
	movl	236(%ecx), %edx
	orl	%edx, %eax
	movl	240(%ecx), %edx
	orl	%edx, %eax
	movl	244(%ecx), %edx
	orl	%edx, %eax
	movl	248(%ecx), %edx
	orl	%edx, %eax
	movl	252(%ecx), %edx
	orl	%edx, %eax
	movl	256(%ecx), %edx
	orl	%edx, %eax
	movl	260(%ecx), %edx
	jmp	L247
L114:
	movl	4(%ecx), %edx
	movl	40(%ecx), %eax
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	jmp	L242
L113:
	movl	(%ecx), %edx
	movl	36(%ecx), %eax
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	jmp	L242
L112:
	movl	32(%ecx), %edx
	movl	68(%ecx), %eax
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
L240:
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
L241:
	orl	%edx, %eax
	movl	212(%ecx), %edx
	orl	%edx, %eax
	movl	248(%ecx), %edx
	orl	%edx, %eax
	movl	284(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L111:
	movl	28(%ecx), %edx
	movl	64(%ecx), %eax
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
L238:
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L239:
	orl	%edx, %eax
	movl	244(%ecx), %edx
	orl	%edx, %eax
	movl	280(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L110:
	movl	24(%ecx), %edx
	movl	60(%ecx), %eax
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
L236:
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L237:
	orl	%edx, %eax
	movl	240(%ecx), %edx
	orl	%edx, %eax
	movl	276(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L109:
	movl	20(%ecx), %edx
	movl	56(%ecx), %eax
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L235:
	orl	%edx, %eax
	movl	236(%ecx), %edx
	orl	%edx, %eax
	movl	272(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L108:
	movl	16(%ecx), %edx
	movl	52(%ecx), %eax
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L234:
	orl	%edx, %eax
	movl	232(%ecx), %edx
	orl	%edx, %eax
	movl	268(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L107:
	movl	12(%ecx), %edx
	movl	48(%ecx), %eax
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L233:
	orl	%edx, %eax
	movl	228(%ecx), %edx
	orl	%edx, %eax
	movl	264(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L106:
	movl	8(%ecx), %edx
	movl	44(%ecx), %eax
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L232:
	orl	%edx, %eax
	movl	224(%ecx), %edx
	orl	%edx, %eax
	movl	260(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L105:
	movl	4(%ecx), %edx
	movl	40(%ecx), %eax
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L231:
	orl	%edx, %eax
	movl	220(%ecx), %edx
	orl	%edx, %eax
	movl	256(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L104:
	movl	(%ecx), %edx
	movl	36(%ecx), %eax
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	orl	%edx, %eax
	movl	212(%ecx), %edx
L230:
	orl	%edx, %eax
	movl	216(%ecx), %edx
	orl	%edx, %eax
	movl	252(%ecx), %edx
	orl	%edx, %eax
	jmp	L56
L103:
	movl	32(%ecx), %edx
	movl	68(%ecx), %eax
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
L229:
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	jmp	L240
L102:
	movl	28(%ecx), %edx
	movl	64(%ecx), %eax
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
L228:
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	jmp	L238
L101:
	movl	24(%ecx), %edx
	movl	60(%ecx), %eax
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
L227:
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	jmp	L236
L100:
	movl	20(%ecx), %edx
	movl	56(%ecx), %eax
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
L226:
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
L214:
	orl	%edx, %eax
	movl	200(%ecx), %edx
	jmp	L235
L99:
	movl	16(%ecx), %edx
	movl	52(%ecx), %eax
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
L225:
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
	jmp	L234
L98:
	movl	12(%ecx), %edx
	movl	48(%ecx), %eax
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
L224:
	orl	%edx, %eax
	movl	192(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	orl	%edx, %eax
	movl	200(%ecx), %edx
	jmp	L233
L97:
	movl	8(%ecx), %edx
	movl	44(%ecx), %eax
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
L223:
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
L207:
	orl	%edx, %eax
	movl	188(%ecx), %edx
	jmp	L232
L96:
	movl	4(%ecx), %edx
	movl	40(%ecx), %eax
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
L222:
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	jmp	L231
L95:
	movl	(%ecx), %edx
	movl	36(%ecx), %eax
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
L221:
	orl	%edx, %eax
	movl	180(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	orl	%edx, %eax
	movl	188(%ecx), %edx
	jmp	L230
L94:
	movl	32(%ecx), %edx
	movl	68(%ecx), %eax
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	jmp	L229
L93:
	movl	28(%ecx), %edx
	movl	64(%ecx), %eax
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	jmp	L228
L92:
	movl	24(%ecx), %edx
	movl	60(%ecx), %eax
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	jmp	L227
L91:
	movl	20(%ecx), %edx
	movl	56(%ecx), %eax
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	jmp	L226
L90:
	movl	16(%ecx), %edx
	movl	52(%ecx), %eax
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	jmp	L225
L89:
	movl	12(%ecx), %edx
	movl	48(%ecx), %eax
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	jmp	L224
L88:
	movl	8(%ecx), %edx
	movl	44(%ecx), %eax
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	jmp	L223
L87:
	movl	4(%ecx), %edx
	movl	40(%ecx), %eax
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	jmp	L222
L86:
	movl	(%ecx), %edx
	movl	36(%ecx), %eax
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	jmp	L221
L85:
	movl	24(%ecx), %edx
	movl	28(%ecx), %eax
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
L220:
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	140(%ecx), %edx
	orl	%edx, %eax
	movl	176(%ecx), %edx
	jmp	L241
L84:
	movl	24(%ecx), %edx
	movl	28(%ecx), %eax
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
L218:
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	136(%ecx), %edx
	orl	%edx, %eax
	movl	172(%ecx), %edx
	orl	%edx, %eax
	movl	208(%ecx), %edx
	jmp	L239
L83:
	movl	24(%ecx), %edx
	movl	28(%ecx), %eax
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
L216:
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
	orl	%edx, %eax
	movl	132(%ecx), %edx
	orl	%edx, %eax
	movl	168(%ecx), %edx
	orl	%edx, %eax
	movl	204(%ecx), %edx
	jmp	L237
L82:
	movl	12(%ecx), %edx
	movl	16(%ecx), %eax
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
L213:
	orl	%edx, %eax
	movl	128(%ecx), %edx
	orl	%edx, %eax
	movl	164(%ecx), %edx
	jmp	L214
L81:
	movl	12(%ecx), %edx
	movl	16(%ecx), %eax
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
L211:
	orl	%edx, %eax
	movl	124(%ecx), %edx
	orl	%edx, %eax
	movl	160(%ecx), %edx
	orl	%edx, %eax
	movl	196(%ecx), %edx
	jmp	L234
L80:
	movl	12(%ecx), %edx
	movl	16(%ecx), %eax
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
L209:
	orl	%edx, %eax
	movl	120(%ecx), %edx
	orl	%edx, %eax
	movl	156(%ecx), %edx
	orl	%edx, %eax
	movl	192(%ecx), %edx
	jmp	L233
L79:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
L206:
	orl	%edx, %eax
	movl	116(%ecx), %edx
	orl	%edx, %eax
	movl	152(%ecx), %edx
	jmp	L207
L78:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
L204:
	orl	%edx, %eax
	movl	112(%ecx), %edx
	orl	%edx, %eax
	movl	148(%ecx), %edx
	orl	%edx, %eax
	movl	184(%ecx), %edx
	jmp	L231
L77:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	orl	%edx, %eax
	movl	96(%ecx), %edx
	orl	%edx, %eax
	movl	100(%ecx), %edx
	orl	%edx, %eax
	movl	104(%ecx), %edx
L202:
	orl	%edx, %eax
	movl	108(%ecx), %edx
	orl	%edx, %eax
	movl	144(%ecx), %edx
	orl	%edx, %eax
	movl	180(%ecx), %edx
	jmp	L230
L76:
	movl	24(%ecx), %edx
	movl	28(%ecx), %eax
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
L219:
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
	jmp	L220
L75:
	movl	24(%ecx), %edx
	movl	28(%ecx), %eax
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
L217:
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
	jmp	L218
L74:
	movl	24(%ecx), %edx
	movl	28(%ecx), %eax
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
L215:
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
	jmp	L216
L73:
	movl	12(%ecx), %edx
	movl	16(%ecx), %eax
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
L212:
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	jmp	L213
L72:
	movl	12(%ecx), %edx
	movl	16(%ecx), %eax
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
L210:
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	jmp	L211
L71:
	movl	12(%ecx), %edx
	movl	16(%ecx), %eax
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
L208:
	orl	%edx, %eax
	movl	84(%ecx), %edx
	orl	%edx, %eax
	movl	88(%ecx), %edx
	orl	%edx, %eax
	movl	92(%ecx), %edx
	jmp	L209
L70:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
L205:
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	jmp	L206
L69:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
L203:
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	jmp	L204
L68:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	orl	%edx, %eax
	movl	60(%ecx), %edx
	orl	%edx, %eax
	movl	64(%ecx), %edx
	orl	%edx, %eax
	movl	68(%ecx), %edx
L201:
	orl	%edx, %eax
	movl	72(%ecx), %edx
	orl	%edx, %eax
	movl	76(%ecx), %edx
	orl	%edx, %eax
	movl	80(%ecx), %edx
	jmp	L202
L67:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	jmp	L219
L66:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	jmp	L217
L65:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	jmp	L215
L64:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	jmp	L212
L63:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	jmp	L210
L62:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	48(%ecx), %edx
	orl	%edx, %eax
	movl	52(%ecx), %edx
	orl	%edx, %eax
	movl	56(%ecx), %edx
	jmp	L208
L61:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	jmp	L205
L60:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	jmp	L203
L59:
	movl	(%ecx), %edx
	movl	4(%ecx), %eax
	orl	%edx, %eax
	movl	8(%ecx), %edx
	orl	%edx, %eax
	movl	12(%ecx), %edx
	orl	%edx, %eax
	movl	16(%ecx), %edx
	orl	%edx, %eax
	movl	20(%ecx), %edx
	orl	%edx, %eax
	movl	24(%ecx), %edx
	orl	%edx, %eax
	movl	28(%ecx), %edx
	orl	%edx, %eax
	movl	32(%ecx), %edx
	orl	%edx, %eax
	movl	36(%ecx), %edx
	orl	%edx, %eax
	movl	40(%ecx), %edx
	orl	%edx, %eax
	movl	44(%ecx), %edx
	jmp	L201
	.align 2
	.p2align 4,,15
.globl __ZN11SolveSudoku4initERK5Board
	.def	__ZN11SolveSudoku4initERK5Board;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku4initERK5Board:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	xorl	%ebx, %ebx
	movl	12(%ebp), %eax
	movl	8(%ebp), %edi
	movl	%eax, -16(%ebp)
	movl	%edi, (%esp)
	call	__ZN11SolveSudoku9initTableEv
	.p2align 4,,15
L261:
	movl	$0, (%edi,%ebx,4)
	incl	%ebx
	cmpl	$80, %ebx
	jle	L261
	xorl	%ebx, %ebx
	jmp	L268
	.p2align 4,,7
L266:
	movl	%ebx, 4(%esp)
	leal	-1(%eax), %ecx
	movl	$1, %esi
	movl	%edi, (%esp)
	sall	%cl, %esi
	call	__ZNK11SolveSudoku9checkCellEi
	testl	%esi, %eax
	jne	L273
L265:
	movl	%esi, (%edi,%ebx,4)
	incl	%ebx
	cmpl	$80, %ebx
	jg	L274
L268:
	movl	-16(%ebp), %edx
	xorl	%esi, %esi
	movzbl	(%ebx,%edx), %eax
	testl	%eax, %eax
	jle	L265
	cmpl	$9, %eax
	jle	L266
	addl	$12, %esp
	movl	$2, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L273:
	addl	$12, %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L274:
	addl	$12, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "FlagsType SolveSudoku::checkCell(int i) const\0"
LC2:
	.ascii "{\0"
LC3:
	.ascii "    if (BoardSize == 9) {\0"
LC4:
	.ascii "        switch (i) {\0"
LC5:
	.ascii "        case %2d:\12\0"
LC6:
	.ascii "            return  \0"
LC7:
	.ascii "                    \0"
LC8:
	.ascii "board[%2d]\0"
LC11:
	.ascii ";\12\0"
LC12:
	.ascii "        }\0"
LC13:
	.ascii "        return 0; /* dummy */\0"
LC14:
	.ascii "    } else {\0"
	.align 4
LC15:
	.ascii "        FlagsType flags = (FlagsType) 0;\0"
	.align 4
LC16:
	.ascii "        for (int j = 0; j < (BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2; j++)\0"
	.align 4
LC17:
	.ascii "            flags |= board[table[i][j]];\0"
LC18:
	.ascii "        return flags;\0"
LC19:
	.ascii "    }\0"
LC20:
	.ascii "}\0"
LC9:
	.ascii " | \0"
LC10:
	.ascii " |\0"
	.text
	.align 2
	.p2align 4,,15
.globl __ZN11SolveSudoku13makeCheckCellEv
	.def	__ZN11SolveSudoku13makeCheckCellEv;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku13makeCheckCellEv:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	%eax, (%esp)
	call	__ZN11SolveSudoku9initTableEv
	movl	$LC1, (%esp)
	call	_puts
	movl	$LC2, (%esp)
	call	_puts
	movl	$LC3, (%esp)
	call	_puts
	movl	$LC4, (%esp)
	call	_puts
	movl	$0, -20(%ebp)
	movl	$0, -28(%ebp)
L290:
	movl	-20(%ebp), %edx
	xorl	%edi, %edi
	movl	$LC5, (%esp)
	movl	%edx, 4(%esp)
	call	_printf
	movl	$LC6, (%esp)
	call	_printf
	movl	$0, -24(%ebp)
	.p2align 4,,15
L289:
	testl	%edi, %edi
	jle	L282
	movl	$LC7, (%esp)
	call	_printf
L282:
	movl	-24(%ebp), %esi
	xorl	%ebx, %ebx
	movl	-28(%ebp), %ecx
	addl	%ecx, %esi
	.p2align 4,,15
L287:
	movl	-16(%ebp), %edx
	leal	(%esi,%ebx), %eax
	movl	324(%edx,%eax,4), %eax
	movl	$LC8, (%esp)
	movl	%eax, 4(%esp)
	call	_printf
	cmpl	$3, %ebx
	jle	L297
L285:
	incl	%ebx
	cmpl	$4, %ebx
	jle	L287
	cmpl	$2, %edi
	jle	L298
L281:
	addl	$5, -24(%ebp)
	incl	%edi
	cmpl	$3, %edi
	jle	L289
	movl	$LC11, (%esp)
	call	_puts
	incl	-20(%ebp)
	addl	$20, -28(%ebp)
	cmpl	$80, -20(%ebp)
	jle	L290
	movl	$LC12, (%esp)
	call	_puts
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_puts
	movl	$LC15, (%esp)
	call	_puts
	movl	$LC16, (%esp)
	call	_puts
	movl	$LC17, (%esp)
	call	_puts
	movl	$LC18, (%esp)
	call	_puts
	movl	$LC19, (%esp)
	call	_puts
	movl	$LC20, 8(%ebp)
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	jmp	_puts
	.p2align 4,,7
L297:
	movl	$LC9, (%esp)
	call	_printf
	jmp	L285
L298:
	movl	$LC10, (%esp)
	call	_puts
	jmp	L281
	.align 2
	.p2align 4,,15
.globl __ZNK11SolveSudoku7intLog2Ei
	.def	__ZNK11SolveSudoku7intLog2Ei;	.scl	2;	.type	32;	.endef
__ZNK11SolveSudoku7intLog2Ei:
	pushl	%ebp
	xorl	%ecx, %ecx
	movl	%esp, %ebp
	pushl	%ebx
	movl	12(%ebp), %ebx
	cmpl	$1, %ebx
	jle	L305
	movl	$1, %edx
	.p2align 4,,15
L303:
	incl	%ecx
	movl	%edx, %eax
	sall	%cl, %eax
	cmpl	%ebx, %eax
	jl	L303
L305:
	popl	%ebx
	movl	%ecx, %eax
	popl	%ebp
	ret
	.align 2
	.p2align 4,,15
.globl __ZN11SolveSudoku11storeResultEv
	.def	__ZN11SolveSudoku11storeResultEv;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku11storeResultEv:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	xorl	%edi, %edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	.p2align 4,,15
L310:
	movl	-16(%ebp), %edx
	movl	6804(%edx), %ebx
	movl	6812(%edx), %esi
	movl	(%edx,%edi,4), %eax
	leal	(%ebx,%ebx,8), %ebx
	addl	%edi, %esi
	movl	%eax, 4(%esp)
	incl	%edi
	leal	(%ebx,%ebx,8), %ebx
	movl	%edx, (%esp)
	call	__ZNK11SolveSudoku7intLog2Ei
	incb	%al
	cmpl	$80, %edi
	movb	%al, (%esi,%ebx)
	jle	L310
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.align 2
	.p2align 4,,15
.globl __ZN11SolveSudoku5countEi
	.def	__ZN11SolveSudoku5countEi;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku5countEi:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	%ebx, -12(%ebp)
	movl	12(%ebp), %ebx
	movl	%esi, -8(%ebp)
	movl	8(%ebp), %esi
	cmpl	$80, %ebx
	movl	%edi, -4(%ebp)
	jg	L343
	.p2align 4,,15
L347:
	movl	(%esi,%ebx,4), %edi
	testl	%edi, %edi
	je	L315
	incl	%ebx
	cmpl	$80, %ebx
	jle	L347
L343:
	movl	6804(%esi), %eax
	testl	%eax, %eax
	js	L318
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku11storeResultEv
	movl	6804(%esi), %eax
L318:
	incl	%eax
	cmpl	6808(%esi), %eax
	movl	%eax, 6804(%esi)
	jge	L348
L313:
	movl	-12(%ebp), %ebx
	movl	-8(%ebp), %esi
	movl	-4(%ebp), %edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
L315:
	cmpl	$80, %ebx
	jg	L343
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	__ZNK11SolveSudoku9checkCellEi
	movl	%eax, %edi
	xorl	$511, %edi
	je	L313
	leal	-1(%edi), %eax
	testl	%edi, %eax
	je	L349
	testl	$1, %edi
	jne	L350
L327:
	testl	$2, %edi
	jne	L351
L328:
	testl	$4, %edi
	jne	L352
L329:
	testl	$8, %edi
	jne	L353
L330:
	testl	$16, %edi
	jne	L354
L331:
	testl	$32, %edi
	jne	L355
L332:
	testl	$64, %edi
	jne	L356
L333:
	testl	$128, %edi
	jne	L357
L334:
	andl	$256, %edi
	jne	L358
L325:
	movl	$0, (%esi,%ebx,4)
	movl	-12(%ebp), %ebx
	movl	-8(%ebp), %esi
	movl	-4(%ebp), %edi
	movl	%ebp, %esp
	popl	%ebp
	ret
L349:
	movl	%edi, (%esi,%ebx,4)
L345:
	movl	%esi, (%esp)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L325
L358:
	movl	$256, (%esi,%ebx,4)
	jmp	L345
L357:
	movl	$128, (%esi,%ebx,4)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L334
L356:
	movl	$64, (%esi,%ebx,4)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L333
L355:
	movl	$32, (%esi,%ebx,4)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L332
L354:
	movl	$16, (%esi,%ebx,4)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L331
L353:
	movl	$8, (%esi,%ebx,4)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L330
L352:
	movl	$4, (%esi,%ebx,4)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L329
L351:
	movl	$2, (%esi,%ebx,4)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L328
L350:
	movl	$1, (%esi,%ebx,4)
	leal	1(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	__ZN11SolveSudoku5countEi
	jmp	L327
L348:
L320:
	movl	$4, (%esp)
	xorl	%esi, %esi
	movl	$__ZTIi, %ebx
	call	___cxa_allocate_exception
	movl	$1, (%eax)
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	___cxa_throw
	.def	__Unwind_SjLj_Resume;	.scl	2;	.type	32;	.endef
	.def	___gxx_personality_sj0;	.scl	2;	.type	32;	.endef
	.def	__Unwind_SjLj_Register;	.scl	2;	.type	32;	.endef
	.def	__Unwind_SjLj_Unregister;	.scl	2;	.type	32;	.endef
	.align 2
	.p2align 4,,15
.globl __ZN11SolveSudoku5solveEP5Boardii
	.def	__ZN11SolveSudoku5solveEP5Boardii;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku5solveEP5Boardii:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$104, %esp
	movl	%esp, -24(%ebp)
	movl	8(%ebp), %eax
	leal	-12(%ebp), %edx
	movl	%ebx, -12(%ebp)
	movl	%esi, -8(%ebp)
	movl	%eax, -68(%ebp)
	leal	-64(%ebp), %eax
	movl	%edi, -4(%ebp)
	movl	$___gxx_personality_sj0, -40(%ebp)
	movl	$LLSDA28, -36(%ebp)
	movl	%edx, -32(%ebp)
	movl	$L372, -28(%ebp)
	movl	%eax, (%esp)
	call	__Unwind_SjLj_Register
	cmpl	$-1, 16(%ebp)
	je	L374
L360:
	cmpl	$-1, 20(%ebp)
	je	L375
L361:
	movl	20(%ebp), %eax
	xorl	%ebx, %ebx
	movl	-68(%ebp), %edx
	negl	%eax
	movl	%eax, 6804(%edx)
	movl	16(%ebp), %eax
	movl	%eax, 6808(%edx)
	movl	12(%ebp), %eax
	movl	%eax, 6812(%edx)
	movl	%ebx, 4(%esp)
	movl	%edx, (%esp)
	movl	$2, -60(%ebp)
	call	__ZN11SolveSudoku5countEi
L362:
L359:
	movl	-68(%ebp), %eax
	movl	6804(%eax), %eax
	addl	%eax, 20(%ebp)
	leal	-64(%ebp), %eax
	movl	%eax, (%esp)
	call	__Unwind_SjLj_Unregister
	movl	20(%ebp), %eax
	movl	-12(%ebp), %ebx
	movl	-8(%ebp), %esi
	movl	-4(%ebp), %edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
L372:
	addl	$12, %ebp
	cmpl	$1, -60(%ebp)
	movl	-56(%ebp), %eax
	movl	%eax, -72(%ebp)
	movl	-52(%ebp), %eax
	je	L371
L367:
	call	___cxa_end_catch
L373:
L369:
	movl	$-1, -60(%ebp)
	movl	-72(%ebp), %edx
	movl	%edx, (%esp)
	call	__Unwind_SjLj_Resume
	.p2align 4,,7
L375:
	movl	$2147483647, 20(%ebp)
	jmp	L361
	.p2align 4,,7
L374:
	movl	$2147483647, 16(%ebp)
	jmp	L360
	.p2align 4,,7
L371:
	decl	%eax
	jne	L373
L363:
	movl	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	___cxa_begin_catch
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	decl	%eax
	jne	L376
	call	___cxa_end_catch
	jmp	L362
L376:
L365:
	movl	$4, (%esp)
	call	___cxa_allocate_exception
	movl	-76(%ebp), %edx
	xorl	%ecx, %ecx
	movl	%edx, (%eax)
	movl	$__ZTIi, %edx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	movl	$1, -60(%ebp)
	call	___cxa_throw
	.section	.gcc_except_table,"dr"
	.align 4
LLSDA28:
	.byte	0xff
	.byte	0x0
	.uleb128 LLSDATT28-LLSDATTD28
LLSDATTD28:
	.byte	0x1
	.uleb128 LLSDACSE28-LLSDACSB28
LLSDACSB28:
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x1
	.uleb128 0x1
LLSDACSE28:
	.byte	0x1
	.byte	0x0
	.align 4
	.long	__ZTIi
LLSDATT28:
	.text
	.section .rdata,"dr"
LC21:
	.ascii "r\0"
LC28:
	.ascii "\0"
LC30:
	.ascii "n=%d%s (%.3f[sec])\12\0"
LC31:
	.ascii "\12ans[%d]:\12\0"
LC24:
	.ascii "LF error: %s\12\0"
LC29:
	.ascii "(or over)\0"
LC22:
	.ascii "fopen error: %s\12\0"
LC26:
	.ascii "quiz error: %s\12\0"
LC23:
	.ascii "load error: %s\12\0"
	.align 4
LC25:
	.ascii "charactor error: %s (buf[%d]=0x%02X)\12\0"
	.align 4
LC27:
	.long	1148846080
	.text
	.align 2
	.p2align 4,,15
.globl __Z6solverPKci
	.def	__Z6solverPKci;	.scl	2;	.type	32;	.endef
__Z6solverPKci:
	pushl	%ebp
	movl	$8396, %eax
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	call	__alloca
	movl	8(%ebp), %edi
	movl	$LC21, %ebx
	movl	%ebx, 4(%esp)
	movl	%edi, (%esp)
	call	_fopen
	testl	%eax, %eax
	movl	%eax, %esi
	je	L408
	movl	%eax, 12(%esp)
	movl	$1, %eax
	movl	$1022, %edx
	movl	%eax, 4(%esp)
	leal	-1048(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, (%esp)
	call	_fread
	movl	%esi, (%esp)
	movl	%eax, %ebx
	xorl	%esi, %esi
	call	_fclose
	xorl	%eax, %eax
	movb	%al, -1048(%ebx,%ebp)
	xorl	%ebx, %ebx
	.p2align 4,,15
L389:
	movzbl	-1048(%ebx,%ebp), %edx
	testb	%dl, %dl
	je	L402
	cmpb	$10, %dl
	je	L409
	cmpb	$32, %dl
	je	L381
	movb	%dl, %al
	xorl	%ecx, %ecx
	subb	$45, %al
	cmpb	$1, %al
	movb	%dl, %al
	seta	%cl
	subb	$49, %al
	negl	%ecx
	cmpb	$8, %al
	ja	L387
	movsbl	%dl,%eax
	leal	-48(%eax), %ecx
L387:
	testl	%ecx, %ecx
	js	L403
	movb	%cl, -7960(%esi,%ebp)
	incl	%esi
L381:
	incl	%ebx
	cmpl	$80, %esi
	jle	L389
	leal	-7960(%ebp), %eax
	leal	-7864(%ebp), %ebx
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	__ZN11SolveSudoku4initERK5Board
	testl	%eax, %eax
	jne	L410
	movl	12(%ebp), %eax
	testl	%eax, %eax
	js	L411
L391:
	movl	12(%ebp), %eax
	leal	-8376(%ebp), %esi
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	movl	%eax, 12(%esp)
	movl	$5, %eax
	movl	%eax, 8(%esp)
	call	__ZN11SolveSudoku5solveEP5Boardii
	movl	%eax, %edi
	call	_clock
	pushl	%eax
	movl	$LC28, %edx
	fildl	(%esp)
	addl	$4, %esp
	fdivs	LC27
	fstpl	12(%esp)
	movl	12(%ebp), %eax
	addl	$5, %eax
	cmpl	%edi, %eax
	jle	L412
L393:
	movl	%edx, 8(%esp)
	movl	%edi, 4(%esp)
	movl	$LC30, (%esp)
	call	_printf
	movl	12(%ebp), %ebx
	jmp	L404
	.p2align 4,,7
L413:
	movl	%ebx, 4(%esp)
	incl	%ebx
	movl	$LC31, (%esp)
	call	_printf
	movl	%esi, (%esp)
	addl	$81, %esi
	call	__ZNK5Board5printEv
L404:
	cmpl	%edi, %ebx
	jl	L413
	addl	$8396, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L409:
	movl	$954437177, %eax
	imull	%esi
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	%edx
	subl	%eax, %edx
	leal	(%edx,%edx,8), %edx
	cmpl	%edx, %esi
	je	L381
	movl	%edi, 8(%esp)
	movl	$LC24, %eax
L407:
	movl	%eax, 4(%esp)
L406:
	movl	__imp___iob, %eax
	addl	$64, %eax
	movl	%eax, (%esp)
	call	_fprintf
L405:
	addl	$8396, %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L412:
	movl	$LC29, %edx
	jmp	L393
L408:
	movl	%edi, 8(%esp)
	movl	$LC22, %ecx
	movl	%ecx, 4(%esp)
	jmp	L406
L410:
	movl	%edi, 8(%esp)
	movl	$LC26, %eax
	jmp	L407
L402:
	movl	%edi, 8(%esp)
	movl	$LC23, %edi
	movl	%edi, 4(%esp)
	jmp	L406
L411:
	movl	$2147483642, 12(%ebp)
	jmp	L391
L403:
	movl	%ebx, 12(%esp)
	movsbl	%dl,%eax
	movl	$LC25, %esi
	movl	%eax, 16(%esp)
	movl	__imp___iob, %eax
	movl	%edi, 8(%esp)
	movl	%esi, 4(%esp)
	addl	$64, %eax
	movl	%eax, (%esp)
	call	_fprintf
	jmp	L405
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC34:
	.ascii "usage>sudoku quiz-file [offset]\12\0"
LC33:
	.ascii "makeCheckCell\0"
	.text
	.align 2
	.p2align 4,,15
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	$6856, %eax
	movl	%esp, %ebp
	call	__alloca
	movl	%ebx, -12(%ebp)
	movl	12(%ebp), %ebx
	andl	$-16, %esp
	movl	%esi, -8(%ebp)
	movl	8(%ebp), %esi
	movl	$16, %eax
	movl	%edi, -4(%ebp)
	call	__alloca
	call	___main
	cmpl	$2, %esi
	je	L420
	cmpl	$3, %esi
	je	L421
	movl	$LC34, %esi
	movl	%esi, 4(%esp)
	movl	__imp___iob, %eax
	addl	$64, %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	-12(%ebp), %ebx
	movl	$1, %eax
	movl	-8(%ebp), %esi
	movl	-4(%ebp), %edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
L420:
	cld
	movl	4(%ebx), %ebx
	movl	$LC33, %edi
	movl	$14, %ecx
	movl	%ebx, %esi
	repe
	cmpsb
	jne	L416
	leal	-6840(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZN11SolveSudoku13makeCheckCellEv
	movl	-12(%ebp), %ebx
	xorl	%eax, %eax
	movl	-8(%ebp), %esi
	movl	-4(%ebp), %edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
L421:
	xorl	%eax, %eax
	xorl	%edi, %edi
	movl	%eax, 8(%esp)
	movl	%edi, 4(%esp)
	movl	8(%ebx), %eax
	movl	%eax, (%esp)
	call	_strtol
	movl	%eax, 4(%esp)
	movl	4(%ebx), %eax
	movl	%eax, (%esp)
	call	__Z6solverPKci
L422:
	movl	-12(%ebp), %ebx
	movl	-8(%ebp), %esi
	movl	-4(%ebp), %edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
L416:
	movl	%ebx, (%esp)
	xorl	%eax, %eax
	movl	%eax, 4(%esp)
	call	__Z6solverPKci
	jmp	L422
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_strtol;	.scl	2;	.type	32;	.endef
	.def	_clock;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_fread;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	___cxa_throw;	.scl	2;	.type	32;	.endef
	.def	___cxa_allocate_exception;	.scl	2;	.type	32;	.endef
	.def	___cxa_end_catch;	.scl	2;	.type	32;	.endef
	.def	___cxa_begin_catch;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
