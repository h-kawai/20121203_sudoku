	.file	"sudoku3.cpp"
	.section .rdata,"dr"
LC0:
	.ascii "%3d \0"
	.text
	.align 2
.globl __ZNK5Board5printEv
	.def	__ZNK5Board5printEv;	.scl	2;	.type	32;	.endef
__ZNK5Board5printEv:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	xorl	%edi, %edi
	pushl	%esi
	pushl	%ebx
	pushl	%ebx
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	$0, -20(%ebp)
	movl	%eax, -16(%ebp)
L9:
	movl	-16(%ebp), %eax
	xorl	%esi, %esi
	leal	(%edi,%eax), %ebx
L8:
	movzbl	(%ebx), %eax
	incl	%esi
	incl	%ebx
	pushl	%eax
	pushl	$LC0
	call	_printf
	popl	%edx
	cmpl	$8, %esi
	popl	%ecx
	jle	L8
	pushl	$10
	addl	$9, %edi
	call	_putchar
	incl	-20(%ebp)
	popl	%eax
	cmpl	$8, -20(%ebp)
	jle	L9
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.align 2
.globl __ZN11SolveSudoku9initTableEv
	.def	__ZN11SolveSudoku9initTableEv;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku9initTableEv:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$116, %esp
	movl	8(%ebp), %eax
	movl	$0, -116(%ebp)
	movl	$0, -124(%ebp)
	movl	%eax, -112(%ebp)
L42:
	xorl	%edx, %edx
L21:
	movb	$0, -108(%edx,%ebp)
	incl	%edx
	cmpl	$80, %edx
	jle	L21
	movl	-116(%ebp), %eax
	movl	$9, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %esi
	movl	%eax, %ebx
	xorl	%edx, %edx
	leal	-108(%esi,%ebp), %ecx
L27:
	movb	$1, (%ecx)
	imull	$9, %ebx, %eax
	addl	$9, %ecx
	addl	%edx, %eax
	incl	%edx
	cmpl	$8, %edx
	movb	$1, -108(%eax,%ebp)
	jle	L27
	movl	%esi, %eax
	movl	$3, %ecx
	cltd
	idivl	%ecx
	movl	%esi, %edi
	movl	%ebx, %eax
	xorl	%esi, %esi
	subl	%edx, %edi
	cltd
	idivl	%ecx
	subl	%edx, %ebx
	imull	$9, %ebx, %edx
L36:
	leal	(%edi,%edx), %eax
	xorl	%ecx, %ecx
	leal	-108(%eax,%ebp), %eax
L35:
	movb	$1, (%eax)
	incl	%ecx
	incl	%eax
	cmpl	$2, %ecx
	jle	L35
	incl	%esi
	addl	$9, %edx
	cmpl	$2, %esi
	jle	L36
	xorl	%ecx, %ecx
	xorl	%edx, %edx
L41:
	cmpb	$0, -108(%edx,%ebp)
	je	L39
	movl	-124(%ebp), %eax
	movl	-112(%ebp), %ebx
	addl	%ecx, %eax
	movl	%edx, 324(%ebx,%eax,4)
	incl	%ecx
L39:
	incl	%edx
	cmpl	$80, %edx
	jle	L41
	incl	-116(%ebp)
	addl	$20, -124(%ebp)
	cmpl	$80, -116(%ebp)
	jle	L42
	addl	$116, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.align 2
.globl __ZNK11SolveSudoku9checkCellEi
	.def	__ZNK11SolveSudoku9checkCellEi;	.scl	2;	.type	32;	.endef
__ZNK11SolveSudoku9checkCellEi:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	cmpl	$80, %ecx
	ja	L55
	jmp	*L139(,%ecx,4)
	.section .rdata,"dr"
	.align 4
L139:
	.long	L58
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
	.text
L58:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	jmp	L164
L59:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	jmp	L167
L60:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	jmp	L170
L61:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	jmp	L173
L62:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	jmp	L176
L63:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	jmp	L179
L64:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	jmp	L183
L65:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	jmp	L186
L66:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	12(%edx), %eax
	orl	16(%edx), %eax
	orl	20(%edx), %eax
	orl	24(%edx), %eax
	orl	28(%edx), %eax
	orl	32(%edx), %eax
	jmp	L189
L67:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L164:
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
L165:
	orl	108(%edx), %eax
	orl	144(%edx), %eax
	orl	180(%edx), %eax
	jmp	L160
L68:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L167:
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
L168:
	orl	112(%edx), %eax
	orl	148(%edx), %eax
	orl	184(%edx), %eax
	jmp	L159
L69:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L170:
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
L171:
	orl	116(%edx), %eax
	orl	152(%edx), %eax
L172:
	orl	188(%edx), %eax
	jmp	L158
L70:
	movl	16(%edx), %eax
	orl	12(%edx), %eax
	orl	20(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L173:
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
L174:
	orl	120(%edx), %eax
	orl	156(%edx), %eax
	orl	192(%edx), %eax
	jmp	L157
L71:
	movl	16(%edx), %eax
	orl	12(%edx), %eax
	orl	20(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L176:
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
L177:
	orl	124(%edx), %eax
	orl	160(%edx), %eax
	orl	196(%edx), %eax
	jmp	L156
L72:
	movl	16(%edx), %eax
	orl	12(%edx), %eax
	orl	20(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L179:
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
L180:
	orl	128(%edx), %eax
	orl	164(%edx), %eax
L181:
	orl	200(%edx), %eax
	jmp	L155
L73:
	movl	28(%edx), %eax
	orl	24(%edx), %eax
	orl	32(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
L183:
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L184:
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	orl	132(%edx), %eax
	orl	168(%edx), %eax
	orl	204(%edx), %eax
	jmp	L163
L74:
	movl	28(%edx), %eax
	orl	24(%edx), %eax
	orl	32(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
L186:
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L187:
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	orl	136(%edx), %eax
	orl	172(%edx), %eax
	orl	208(%edx), %eax
	jmp	L162
L75:
	movl	28(%edx), %eax
	orl	24(%edx), %eax
	orl	32(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
L189:
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
L190:
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	orl	140(%edx), %eax
	orl	176(%edx), %eax
	jmp	L161
L76:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	jmp	L165
L77:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	jmp	L168
L78:
	movl	4(%edx), %eax
	orl	(%edx), %eax
	orl	8(%edx), %eax
	orl	36(%edx), %eax
	orl	40(%edx), %eax
	orl	44(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	jmp	L171
L79:
	movl	16(%edx), %eax
	orl	12(%edx), %eax
	orl	20(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	jmp	L174
L80:
	movl	16(%edx), %eax
	orl	12(%edx), %eax
	orl	20(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	jmp	L177
L81:
	movl	16(%edx), %eax
	orl	12(%edx), %eax
	orl	20(%edx), %eax
	orl	48(%edx), %eax
	orl	52(%edx), %eax
	orl	56(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	orl	96(%edx), %eax
	orl	100(%edx), %eax
	orl	104(%edx), %eax
	jmp	L180
L82:
	movl	28(%edx), %eax
	orl	24(%edx), %eax
	orl	32(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	jmp	L184
L83:
	movl	28(%edx), %eax
	orl	24(%edx), %eax
	orl	32(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	jmp	L187
L84:
	movl	28(%edx), %eax
	orl	24(%edx), %eax
	orl	32(%edx), %eax
	orl	60(%edx), %eax
	orl	64(%edx), %eax
	orl	68(%edx), %eax
	orl	72(%edx), %eax
	orl	76(%edx), %eax
	orl	80(%edx), %eax
	orl	84(%edx), %eax
	orl	88(%edx), %eax
	orl	92(%edx), %eax
	jmp	L190
L85:
	movl	36(%edx), %eax
	orl	(%edx), %eax
	orl	72(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	jmp	L166
L86:
	movl	40(%edx), %eax
	orl	4(%edx), %eax
	orl	76(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	jmp	L169
L87:
	movl	44(%edx), %eax
	orl	8(%edx), %eax
	orl	80(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	jmp	L197
L88:
	movl	48(%edx), %eax
	orl	12(%edx), %eax
	orl	84(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	jmp	L175
L89:
	movl	52(%edx), %eax
	orl	16(%edx), %eax
	orl	88(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	jmp	L178
L90:
	movl	56(%edx), %eax
	orl	20(%edx), %eax
	orl	92(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	jmp	L198
L91:
	movl	60(%edx), %eax
	orl	24(%edx), %eax
	orl	96(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	jmp	L182
L92:
	movl	64(%edx), %eax
	orl	28(%edx), %eax
	orl	100(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	jmp	L185
L93:
	movl	68(%edx), %eax
	orl	32(%edx), %eax
	orl	104(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	jmp	L188
L94:
	movl	36(%edx), %eax
	orl	(%edx), %eax
	orl	72(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
L166:
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	jmp	L160
L95:
	movl	40(%edx), %eax
	orl	4(%edx), %eax
	orl	76(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
L169:
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	jmp	L159
L96:
	movl	44(%edx), %eax
	orl	8(%edx), %eax
	orl	80(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
L197:
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	jmp	L172
L97:
	movl	48(%edx), %eax
	orl	12(%edx), %eax
	orl	84(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
L175:
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
	jmp	L157
L98:
	movl	52(%edx), %eax
	orl	16(%edx), %eax
	orl	88(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
L178:
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
	jmp	L156
L99:
	movl	56(%edx), %eax
	orl	20(%edx), %eax
	orl	92(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
L198:
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	jmp	L181
L100:
	movl	60(%edx), %eax
	orl	24(%edx), %eax
	orl	96(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
L182:
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
	jmp	L154
L101:
	movl	64(%edx), %eax
	orl	28(%edx), %eax
	orl	100(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
L185:
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
	jmp	L153
L102:
	movl	68(%edx), %eax
	orl	32(%edx), %eax
	orl	104(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
L188:
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
	jmp	L152
L103:
	movl	36(%edx), %eax
	orl	(%edx), %eax
	orl	72(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
	orl	204(%edx), %eax
	orl	208(%edx), %eax
	orl	212(%edx), %eax
L160:
	orl	216(%edx), %eax
	orl	252(%edx), %eax
	jmp	L55
L104:
	movl	40(%edx), %eax
	orl	4(%edx), %eax
	orl	76(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
	orl	204(%edx), %eax
	orl	208(%edx), %eax
	orl	212(%edx), %eax
L159:
	orl	220(%edx), %eax
	orl	256(%edx), %eax
	jmp	L55
L105:
	movl	44(%edx), %eax
	orl	8(%edx), %eax
	orl	80(%edx), %eax
	orl	108(%edx), %eax
	orl	112(%edx), %eax
	orl	116(%edx), %eax
	orl	144(%edx), %eax
	orl	148(%edx), %eax
	orl	152(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
	orl	204(%edx), %eax
	orl	208(%edx), %eax
	orl	212(%edx), %eax
L158:
	orl	224(%edx), %eax
	orl	260(%edx), %eax
	jmp	L55
L106:
	movl	48(%edx), %eax
	orl	12(%edx), %eax
	orl	84(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
	orl	204(%edx), %eax
	orl	208(%edx), %eax
	orl	212(%edx), %eax
L157:
	orl	228(%edx), %eax
	orl	264(%edx), %eax
	jmp	L55
L107:
	movl	52(%edx), %eax
	orl	16(%edx), %eax
	orl	88(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
	orl	204(%edx), %eax
	orl	208(%edx), %eax
	orl	212(%edx), %eax
L156:
	orl	232(%edx), %eax
	orl	268(%edx), %eax
	jmp	L55
L108:
	movl	56(%edx), %eax
	orl	20(%edx), %eax
	orl	92(%edx), %eax
	orl	120(%edx), %eax
	orl	124(%edx), %eax
	orl	128(%edx), %eax
	orl	156(%edx), %eax
	orl	160(%edx), %eax
	orl	164(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
	orl	204(%edx), %eax
	orl	208(%edx), %eax
	orl	212(%edx), %eax
L155:
	orl	236(%edx), %eax
	orl	272(%edx), %eax
	jmp	L55
L109:
	movl	60(%edx), %eax
	orl	24(%edx), %eax
	orl	96(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
L154:
	orl	204(%edx), %eax
	orl	208(%edx), %eax
	orl	212(%edx), %eax
L163:
	orl	240(%edx), %eax
	orl	276(%edx), %eax
	jmp	L55
L110:
	movl	64(%edx), %eax
	orl	28(%edx), %eax
	orl	100(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
L153:
	orl	204(%edx), %eax
	orl	208(%edx), %eax
	orl	212(%edx), %eax
L162:
	orl	244(%edx), %eax
	orl	280(%edx), %eax
	jmp	L55
L111:
	movl	68(%edx), %eax
	orl	32(%edx), %eax
	orl	104(%edx), %eax
	orl	132(%edx), %eax
	orl	136(%edx), %eax
	orl	140(%edx), %eax
	orl	168(%edx), %eax
	orl	172(%edx), %eax
	orl	176(%edx), %eax
	orl	180(%edx), %eax
	orl	184(%edx), %eax
	orl	188(%edx), %eax
	orl	192(%edx), %eax
	orl	196(%edx), %eax
	orl	200(%edx), %eax
L152:
	orl	204(%edx), %eax
	orl	208(%edx), %eax
L161:
	orl	212(%edx), %eax
	orl	248(%edx), %eax
	orl	284(%edx), %eax
	jmp	L55
L112:
	movl	36(%edx), %eax
	orl	(%edx), %eax
	orl	72(%edx), %eax
	orl	108(%edx), %eax
	orl	144(%edx), %eax
	orl	180(%edx), %eax
	jmp	L191
L113:
	movl	40(%edx), %eax
	orl	4(%edx), %eax
	orl	76(%edx), %eax
	orl	112(%edx), %eax
	orl	148(%edx), %eax
	orl	184(%edx), %eax
L191:
	orl	216(%edx), %eax
	orl	220(%edx), %eax
	orl	224(%edx), %eax
	orl	228(%edx), %eax
	orl	232(%edx), %eax
	orl	236(%edx), %eax
	orl	240(%edx), %eax
	orl	244(%edx), %eax
	orl	248(%edx), %eax
	orl	252(%edx), %eax
	orl	256(%edx), %eax
	orl	260(%edx), %eax
	jmp	L151
L114:
	movl	44(%edx), %eax
	orl	8(%edx), %eax
	orl	80(%edx), %eax
	orl	116(%edx), %eax
	orl	152(%edx), %eax
	orl	188(%edx), %eax
	jmp	L191
L115:
	movl	48(%edx), %eax
	orl	12(%edx), %eax
	orl	84(%edx), %eax
	orl	120(%edx), %eax
	orl	156(%edx), %eax
	orl	192(%edx), %eax
	jmp	L192
L116:
	movl	52(%edx), %eax
	orl	16(%edx), %eax
	orl	88(%edx), %eax
	orl	124(%edx), %eax
	orl	160(%edx), %eax
	orl	196(%edx), %eax
L192:
	orl	216(%edx), %eax
	orl	220(%edx), %eax
	orl	224(%edx), %eax
	orl	228(%edx), %eax
	orl	232(%edx), %eax
	orl	236(%edx), %eax
	orl	240(%edx), %eax
	orl	244(%edx), %eax
	orl	248(%edx), %eax
	orl	264(%edx), %eax
	orl	268(%edx), %eax
	orl	272(%edx), %eax
	jmp	L150
L117:
	movl	56(%edx), %eax
	orl	20(%edx), %eax
	orl	92(%edx), %eax
	orl	128(%edx), %eax
	orl	164(%edx), %eax
	orl	200(%edx), %eax
	jmp	L192
L118:
	movl	60(%edx), %eax
	orl	24(%edx), %eax
	orl	96(%edx), %eax
	orl	132(%edx), %eax
	orl	168(%edx), %eax
	orl	204(%edx), %eax
	jmp	L195
L119:
	movl	64(%edx), %eax
	orl	28(%edx), %eax
	orl	100(%edx), %eax
	orl	136(%edx), %eax
	orl	172(%edx), %eax
	orl	208(%edx), %eax
L195:
	orl	216(%edx), %eax
	orl	220(%edx), %eax
	orl	224(%edx), %eax
	orl	228(%edx), %eax
	orl	232(%edx), %eax
	orl	236(%edx), %eax
	orl	240(%edx), %eax
	orl	244(%edx), %eax
	orl	248(%edx), %eax
L196:
	orl	276(%edx), %eax
	orl	280(%edx), %eax
	orl	284(%edx), %eax
	jmp	L147
L120:
	movl	68(%edx), %eax
	orl	32(%edx), %eax
	orl	104(%edx), %eax
	orl	140(%edx), %eax
	orl	176(%edx), %eax
	orl	212(%edx), %eax
	jmp	L195
L121:
	movl	36(%edx), %eax
	orl	(%edx), %eax
	orl	72(%edx), %eax
	orl	108(%edx), %eax
	orl	144(%edx), %eax
	orl	180(%edx), %eax
	jmp	L149
L122:
	movl	40(%edx), %eax
	orl	4(%edx), %eax
	orl	76(%edx), %eax
	orl	112(%edx), %eax
	orl	148(%edx), %eax
	orl	184(%edx), %eax
	jmp	L149
L123:
	movl	44(%edx), %eax
	orl	8(%edx), %eax
	orl	80(%edx), %eax
	orl	116(%edx), %eax
	orl	152(%edx), %eax
	orl	188(%edx), %eax
L149:
	orl	216(%edx), %eax
	orl	220(%edx), %eax
	orl	224(%edx), %eax
	orl	252(%edx), %eax
	orl	256(%edx), %eax
	orl	260(%edx), %eax
	orl	264(%edx), %eax
	orl	268(%edx), %eax
	orl	272(%edx), %eax
	orl	276(%edx), %eax
	orl	280(%edx), %eax
	orl	284(%edx), %eax
L151:
	orl	288(%edx), %eax
	orl	292(%edx), %eax
	jmp	L55
L124:
	movl	48(%edx), %eax
	orl	12(%edx), %eax
	orl	84(%edx), %eax
	orl	120(%edx), %eax
	orl	156(%edx), %eax
	orl	192(%edx), %eax
	jmp	L148
L125:
	movl	52(%edx), %eax
	orl	16(%edx), %eax
	orl	88(%edx), %eax
	orl	124(%edx), %eax
	orl	160(%edx), %eax
	orl	196(%edx), %eax
	jmp	L148
L126:
	movl	56(%edx), %eax
	orl	20(%edx), %eax
	orl	92(%edx), %eax
	orl	128(%edx), %eax
	orl	164(%edx), %eax
	orl	200(%edx), %eax
L148:
	orl	228(%edx), %eax
	orl	232(%edx), %eax
	orl	236(%edx), %eax
	orl	252(%edx), %eax
	orl	256(%edx), %eax
	orl	260(%edx), %eax
	orl	264(%edx), %eax
	orl	268(%edx), %eax
	orl	272(%edx), %eax
	orl	276(%edx), %eax
	orl	280(%edx), %eax
	orl	284(%edx), %eax
L150:
	orl	300(%edx), %eax
	orl	304(%edx), %eax
	jmp	L55
L127:
	movl	60(%edx), %eax
	orl	24(%edx), %eax
	orl	96(%edx), %eax
	orl	132(%edx), %eax
	orl	168(%edx), %eax
	orl	204(%edx), %eax
	jmp	L199
L128:
	movl	64(%edx), %eax
	orl	28(%edx), %eax
	orl	100(%edx), %eax
	orl	136(%edx), %eax
	orl	172(%edx), %eax
	orl	208(%edx), %eax
	jmp	L199
L129:
	movl	68(%edx), %eax
	orl	32(%edx), %eax
	orl	104(%edx), %eax
	orl	140(%edx), %eax
	orl	176(%edx), %eax
	orl	212(%edx), %eax
L199:
	orl	240(%edx), %eax
	orl	244(%edx), %eax
	orl	248(%edx), %eax
	orl	252(%edx), %eax
	orl	256(%edx), %eax
	orl	260(%edx), %eax
	orl	264(%edx), %eax
	orl	268(%edx), %eax
	orl	272(%edx), %eax
	jmp	L196
L130:
	movl	36(%edx), %eax
	orl	(%edx), %eax
	orl	72(%edx), %eax
	orl	108(%edx), %eax
	orl	144(%edx), %eax
	orl	180(%edx), %eax
	jmp	L193
L131:
	movl	40(%edx), %eax
	orl	4(%edx), %eax
	orl	76(%edx), %eax
	orl	112(%edx), %eax
	orl	148(%edx), %eax
	orl	184(%edx), %eax
L193:
	orl	216(%edx), %eax
	orl	220(%edx), %eax
	orl	224(%edx), %eax
	orl	252(%edx), %eax
	orl	256(%edx), %eax
	orl	260(%edx), %eax
	jmp	L146
L132:
	movl	44(%edx), %eax
	orl	8(%edx), %eax
	orl	80(%edx), %eax
	orl	116(%edx), %eax
	orl	152(%edx), %eax
	orl	188(%edx), %eax
	jmp	L193
L133:
	movl	48(%edx), %eax
	orl	12(%edx), %eax
	orl	84(%edx), %eax
	orl	120(%edx), %eax
	orl	156(%edx), %eax
	orl	192(%edx), %eax
	jmp	L194
L134:
	movl	52(%edx), %eax
	orl	16(%edx), %eax
	orl	88(%edx), %eax
	orl	124(%edx), %eax
	orl	160(%edx), %eax
	orl	196(%edx), %eax
L194:
	orl	228(%edx), %eax
	orl	232(%edx), %eax
	orl	236(%edx), %eax
	orl	264(%edx), %eax
	orl	268(%edx), %eax
	orl	272(%edx), %eax
	jmp	L146
L135:
	movl	56(%edx), %eax
	orl	20(%edx), %eax
	orl	92(%edx), %eax
	orl	128(%edx), %eax
	orl	164(%edx), %eax
	orl	200(%edx), %eax
	jmp	L194
L136:
	movl	60(%edx), %eax
	orl	24(%edx), %eax
	orl	96(%edx), %eax
	orl	132(%edx), %eax
	orl	168(%edx), %eax
	orl	204(%edx), %eax
	jmp	L145
L137:
	movl	64(%edx), %eax
	orl	28(%edx), %eax
	orl	100(%edx), %eax
	orl	136(%edx), %eax
	orl	172(%edx), %eax
	orl	208(%edx), %eax
	jmp	L145
L138:
	movl	68(%edx), %eax
	orl	32(%edx), %eax
	orl	104(%edx), %eax
	orl	140(%edx), %eax
	orl	176(%edx), %eax
	orl	212(%edx), %eax
L145:
	orl	240(%edx), %eax
	orl	244(%edx), %eax
	orl	248(%edx), %eax
	orl	276(%edx), %eax
	orl	280(%edx), %eax
	orl	284(%edx), %eax
L146:
	orl	288(%edx), %eax
	orl	292(%edx), %eax
	orl	296(%edx), %eax
	orl	300(%edx), %eax
	orl	304(%edx), %eax
	orl	308(%edx), %eax
L147:
	orl	312(%edx), %eax
	orl	316(%edx), %eax
L55:
	popl	%ebp
	ret
	.align 2
.globl __ZN11SolveSudoku4initERK5Board
	.def	__ZN11SolveSudoku4initERK5Board;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku4initERK5Board:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	xorl	%ebx, %ebx
	pushl	%edi
	pushl	%edi
	movl	8(%ebp), %edi
	movl	12(%ebp), %eax
	pushl	%edi
	movl	%eax, -16(%ebp)
	call	__ZN11SolveSudoku9initTableEv
	popl	%esi
L204:
	movl	$0, (%edi,%ebx,4)
	incl	%ebx
	cmpl	$80, %ebx
	jle	L204
	xorl	%ebx, %ebx
L211:
	movl	$9, %edx
	movl	%ebx, %eax
	movl	%edx, %ecx
	cltd
	xorl	%esi, %esi
	idivl	%ecx
	movl	%eax, -20(%ebp)
	imull	$9, %eax, %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	movzbl	(%eax,%edx), %eax
	testl	%eax, %eax
	jle	L208
	cmpl	$9, %eax
	jle	L209
	movl	$2, %eax
	jmp	L200
L209:
	pushl	%ebx
	leal	-1(%eax), %ecx
	movl	$1, %esi
	pushl	%edi
	sall	%cl, %esi
	call	__ZNK11SolveSudoku9checkCellEi
	popl	%edx
	testl	%esi, %eax
	popl	%ecx
	je	L208
	movl	$1, %eax
	jmp	L200
L208:
	movl	%esi, (%edi,%ebx,4)
	incl	%ebx
	cmpl	$80, %ebx
	jle	L211
	xorl	%eax, %eax
L200:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.section .rdata,"dr"
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
LC9:
	.ascii " | \0"
LC10:
	.ascii " |\0"
LC11:
	.ascii ";\12\0"
LC12:
	.ascii "        }\0"
LC13:
	.ascii "        return 0; /* dummy */\0"
LC14:
	.ascii "    } else {\0"
LC15:
	.ascii "        FlagsType flags = (FlagsType) 0;\0"
LC16:
	.ascii "        for (int j = 0; j < (BoardSize - 1) * 3 - (BoardSizeSub - 1) * 2; j++)\0"
LC17:
	.ascii "            flags |= board[table[i][j]];\0"
LC18:
	.ascii "        return flags;\0"
LC19:
	.ascii "    }\0"
LC20:
	.ascii "}\0"
	.text
	.align 2
.globl __ZN11SolveSudoku13makeCheckCellEv
	.def	__ZN11SolveSudoku13makeCheckCellEv;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku13makeCheckCellEv:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	pushl	%eax
	call	__ZN11SolveSudoku9initTableEv
	pushl	$LC1
	call	_puts
	pushl	$LC2
	call	_puts
	pushl	$LC3
	call	_puts
	pushl	$LC4
	call	_puts
	movl	$0, -20(%ebp)
	addl	$20, %esp
	movl	$0, -24(%ebp)
L231:
	pushl	-20(%ebp)
	pushl	$LC5
	call	_printf
	popl	%esi
	xorl	%esi, %esi
	popl	%edi
	xorl	%edi, %edi
	pushl	$LC6
	call	_printf
	popl	%ebx
L230:
	testl	%esi, %esi
	jle	L223
	pushl	$LC7
	call	_printf
	popl	%ecx
L223:
	xorl	%ebx, %ebx
L228:
	movl	-24(%ebp), %edx
	leal	(%edi,%edx), %eax
	movl	-16(%ebp), %edx
	addl	%ebx, %eax
	pushl	324(%edx,%eax,4)
	pushl	$LC8
	call	_printf
	popl	%eax
	cmpl	$3, %ebx
	popl	%edx
	jg	L226
	pushl	$LC9
	call	_printf
	popl	%eax
L226:
	incl	%ebx
	cmpl	$4, %ebx
	jle	L228
	cmpl	$2, %esi
	jg	L222
	pushl	$LC10
	call	_puts
	popl	%eax
L222:
	incl	%esi
	addl	$5, %edi
	cmpl	$3, %esi
	jle	L230
	pushl	$LC11
	call	_puts
	popl	%eax
	incl	-20(%ebp)
	addl	$20, -24(%ebp)
	cmpl	$80, -20(%ebp)
	jle	L231
	pushl	$LC12
	call	_puts
	pushl	$LC13
	call	_puts
	pushl	$LC14
	call	_puts
	pushl	$LC15
	call	_puts
	pushl	$LC16
	call	_puts
	pushl	$LC17
	call	_puts
	pushl	$LC18
	call	_puts
	pushl	$LC19
	call	_puts
	movl	$LC20, 8(%ebp)
	addl	$32, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	jmp	_puts
	.align 2
.globl __ZNK11SolveSudoku7intLog2Ei
	.def	__ZNK11SolveSudoku7intLog2Ei;	.scl	2;	.type	32;	.endef
__ZNK11SolveSudoku7intLog2Ei:
	pushl	%ebp
	xorl	%ecx, %ecx
	movl	%esp, %ebp
	movl	12(%ebp), %edx
	cmpl	$1, %edx
L245:
	jle	L244
	incl	%ecx
	movl	$1, %eax
	sall	%cl, %eax
	cmpl	%eax, %edx
	jmp	L245
L244:
	popl	%ebp
	movl	%ecx, %eax
	ret
	.align 2
.globl __ZN11SolveSudoku11storeResultEv
	.def	__ZN11SolveSudoku11storeResultEv;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku11storeResultEv:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	pushl	%ecx
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
L250:
	movl	%esi, %eax
	movl	$9, %edx
	movl	-16(%ebp), %ecx
	movl	%edx, %edi
	cltd
	idivl	%edi
	imull	$9, %eax, %eax
	imull	$81, 6804(%ecx), %ebx
	movl	-16(%ebp), %ecx
	addl	6812(%ecx), %eax
	pushl	(%ecx,%esi,4)
	incl	%esi
	leal	(%eax,%edx), %edi
	pushl	%ecx
	call	__ZNK11SolveSudoku7intLog2Ei
	incb	%al
	cmpl	$80, %esi
	movb	%al, (%edi,%ebx)
	popl	%eax
	popl	%edx
	jle	L250
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.align 2
.globl __ZN11SolveSudoku5countEi
	.def	__ZN11SolveSudoku5countEi;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku5countEi:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	8(%ebp), %edi
	pushl	%esi
	pushl	%ebx
	movl	12(%ebp), %ebx
L286:
	cmpl	$80, %ebx
	jg	L283
	cmpl	$0, (%edi,%ebx,4)
	je	L255
	incl	%ebx
	jmp	L286
L255:
	cmpl	$80, %ebx
	jle	L257
L283:
	cmpl	$0, 6804(%edi)
	js	L258
	pushl	%edi
	call	__ZN11SolveSudoku11storeResultEv
	popl	%ebx
L258:
	movl	6804(%edi), %eax
	incl	%eax
	cmpl	6808(%edi), %eax
	movl	%eax, 6804(%edi)
	jl	L253
L260:
	pushl	$4
	call	___cxa_allocate_exception
	movl	$1, (%eax)
	movl	$0, (%esp)
	pushl	$__ZTIi
	pushl	%eax
	call	___cxa_throw
L257:
	pushl	%ebx
	pushl	%edi
	call	__ZNK11SolveSudoku9checkCellEi
	popl	%edx
	movl	%eax, %esi
	xorl	$511, %esi
	popl	%ecx
	je	L253
	leal	-1(%esi), %eax
	testl	%eax, %esi
	jne	L263
	movl	%esi, (%edi,%ebx,4)
	jmp	L285
L263:
	testl	$1, %esi
	je	L267
	movl	$1, (%edi,%ebx,4)
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%ecx
	popl	%eax
L267:
	testl	$2, %esi
	je	L268
	movl	$2, (%edi,%ebx,4)
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%eax
	popl	%edx
L268:
	testl	$4, %esi
	je	L269
	movl	$4, (%edi,%ebx,4)
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%ecx
	popl	%eax
L269:
	testl	$8, %esi
	je	L270
	movl	$8, (%edi,%ebx,4)
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%eax
	popl	%edx
L270:
	testl	$16, %esi
	je	L271
	movl	$16, (%edi,%ebx,4)
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%ecx
	popl	%eax
L271:
	testl	$32, %esi
	je	L272
	movl	$32, (%edi,%ebx,4)
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%eax
	popl	%edx
L272:
	testl	$64, %esi
	je	L273
	movl	$64, (%edi,%ebx,4)
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%ecx
	popl	%eax
L273:
	testl	$128, %esi
	je	L274
	movl	$128, (%edi,%ebx,4)
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%eax
	popl	%edx
L274:
	andl	$256, %esi
	je	L265
	movl	$256, (%edi,%ebx,4)
L285:
	leal	1(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	__ZN11SolveSudoku5countEi
	popl	%esi
	popl	%eax
L265:
	movl	$0, (%edi,%ebx,4)
L253:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.def	__Unwind_SjLj_Resume;	.scl	2;	.type	32;	.endef
	.def	___gxx_personality_sj0;	.scl	2;	.type	32;	.endef
	.def	__Unwind_SjLj_Register;	.scl	2;	.type	32;	.endef
	.def	__Unwind_SjLj_Unregister;	.scl	2;	.type	32;	.endef
	.align 2
.globl __ZN11SolveSudoku5solveEP5Boardii
	.def	__ZN11SolveSudoku5solveEP5Boardii;	.scl	2;	.type	32;	.endef
__ZN11SolveSudoku5solveEP5Boardii:
	pushl	%ebp
	movl	%esp, %ebp
	leal	-12(%ebp), %edx
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$64, %esp
	movl	8(%ebp), %eax
	movl	%esp, -24(%ebp)
	movl	$___gxx_personality_sj0, -40(%ebp)
	movl	%eax, -68(%ebp)
	leal	-64(%ebp), %eax
	pushl	%eax
	movl	$LLSDA28, -36(%ebp)
	movl	%edx, -32(%ebp)
	movl	$L300, -28(%ebp)
	call	__Unwind_SjLj_Register
	cmpl	$-1, 16(%ebp)
	popl	%ecx
	jne	L288
	movl	$2147483647, 16(%ebp)
L288:
	cmpl	$-1, 20(%ebp)
	jne	L289
	movl	$2147483647, 20(%ebp)
L289:
	movl	20(%ebp), %eax
	movl	-68(%ebp), %edx
	negl	%eax
	movl	%eax, 6804(%edx)
	movl	16(%ebp), %eax
	movl	%eax, 6808(%edx)
	movl	12(%ebp), %eax
	movl	%eax, 6812(%edx)
	pushl	$0
	pushl	%edx
	movl	$2, -60(%ebp)
	call	__ZN11SolveSudoku5countEi
	popl	%eax
	popl	%edx
	jmp	L290
L299:
	decl	%eax
	jne	L301
L291:
	pushl	-72(%ebp)
	call	___cxa_begin_catch
	popl	%edi
	movl	(%eax), %eax
	movl	%eax, -76(%ebp)
	decl	%eax
	je	L296
L293:
	pushl	$4
	call	___cxa_allocate_exception
	movl	-76(%ebp), %edx
	movl	%edx, (%eax)
	movl	$0, (%esp)
	pushl	$__ZTIi
	pushl	%eax
	movl	$1, -60(%ebp)
	call	___cxa_throw
L300:
	addl	$12, %ebp
	cmpl	$1, -60(%ebp)
	movl	-56(%ebp), %eax
	movl	%eax, -72(%ebp)
	movl	-52(%ebp), %eax
	je	L299
L295:
	call	___cxa_end_catch
L301:
L297:
	pushl	-72(%ebp)
	movl	$-1, -60(%ebp)
	call	__Unwind_SjLj_Resume
L296:
	call	___cxa_end_catch
L290:
L287:
	movl	-68(%ebp), %edx
	leal	-64(%ebp), %eax
	movl	6804(%edx), %edx
	pushl	%eax
	addl	%edx, 20(%ebp)
	call	__Unwind_SjLj_Unregister
	popl	%esi
	movl	20(%ebp), %eax
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
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
LC22:
	.ascii "fopen error: %s\12\0"
LC24:
	.ascii "LF error: %s\12\0"
LC26:
	.ascii "quiz error: %s\12\0"
LC28:
	.ascii "\0"
LC23:
	.ascii "load error: %s\12\0"
LC25:
	.ascii "charactor error: %s (buf[%d]=0x%02X)\12\0"
LC29:
	.ascii "(or over)\0"
LC30:
	.ascii "n=%d%s (%.3f[sec])\12\0"
LC31:
	.ascii "\12ans[%d]:\12\0"
	.align 4
LC27:
	.long	1148846080
	.text
	.align 2
.globl __Z6solverPKci
	.def	__Z6solverPKci;	.scl	2;	.type	32;	.endef
__Z6solverPKci:
	pushl	%ebp
	movl	$8364, %eax
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	call	__alloca
	pushl	$LC21
	movl	8(%ebp), %edi
	pushl	%edi
	call	_fopen
	movl	%eax, %esi
	testl	%esi, %esi
	popl	%eax
	popl	%edx
	jne	L303
	pushl	%edi
	pushl	$LC22
	jmp	L330
L303:
	pushl	%esi
	leal	-1036(%ebp), %eax
	pushl	$1022
	pushl	$1
	pushl	%eax
	call	_fread
	pushl	%esi
	movl	%eax, %ebx
	xorl	%esi, %esi
	call	_fclose
	movb	$0, -1036(%ebx,%ebp)
	addl	$20, %esp
	xorl	%ebx, %ebx
L314:
	movzbl	-1036(%ebx,%ebp), %edx
	testb	%dl, %dl
	je	L327
	cmpb	$10, %dl
	jne	L308
	movl	$9, %edx
	movl	%esi, %eax
	movl	%edx, %ecx
	cltd
	idivl	%ecx
	testl	%edx, %edx
	je	L306
	pushl	%edi
	pushl	$LC24
L330:
	movl	__imp___iob, %eax
	addl	$64, %eax
	pushl	%eax
	call	_fprintf
	jmp	L329
L308:
	cmpb	$32, %dl
	je	L306
	movb	%dl, %al
	subb	$45, %al
	cmpb	$1, %al
	seta	%al
	movzbl	%al, %eax
	negl	%eax
	movl	%eax, -8376(%ebp)
	movb	%dl, %al
	subb	$49, %al
	cmpb	$8, %al
	ja	L312
	movsbl	%dl,%eax
	subl	$48, %eax
	movl	%eax, -8376(%ebp)
L312:
	cmpl	$0, -8376(%ebp)
	js	L328
	movl	%esi, %eax
	movl	$9, %ecx
	cltd
	idivl	%ecx
	incl	%esi
	movl	%eax, -8368(%ebp)
	imull	$9, %eax, %eax
	addl	%edx, %eax
	movzbl	-8376(%ebp), %edx
	movb	%dl, -7948(%ebp,%eax)
L306:
	incl	%ebx
	cmpl	$80, %esi
	jle	L314
	leal	-7948(%ebp), %eax
	leal	-7852(%ebp), %ebx
	pushl	%eax
	pushl	%ebx
	call	__ZN11SolveSudoku4initERK5Board
	popl	%ecx
	testl	%eax, %eax
	popl	%esi
	je	L315
	pushl	%edi
	pushl	$LC26
	jmp	L330
L315:
	cmpl	$0, 12(%ebp)
	jns	L316
	movl	$2147483642, 12(%ebp)
L316:
	pushl	12(%ebp)
	leal	-8364(%ebp), %eax
	pushl	$5
	pushl	%eax
	pushl	%ebx
	call	__ZN11SolveSudoku5solveEP5Boardii
	addl	$16, %esp
	movl	%eax, %edi
	call	_clock
	pushl	%eax
	movl	12(%ebp), %eax
	movl	$LC28, %edx
	fildl	(%esp)
	addl	$5, %eax
	fdivs	LC27
	subl	$4, %esp
	cmpl	%eax, %edi
	fstpl	(%esp)
	jl	L318
	jmp	L317
L327:
	pushl	%edi
	pushl	$LC23
	jmp	L330
L328:
	movsbl	%dl,%eax
	pushl	%eax
	movl	__imp___iob, %eax
	pushl	%ebx
	pushl	%edi
	addl	$64, %eax
	pushl	$LC25
	pushl	%eax
	call	_fprintf
L329:
	movl	$1, %eax
	jmp	L302
L317:
	movl	$LC29, %edx
L318:
	pushl	%edx
	pushl	%edi
	pushl	$LC30
	call	_printf
	movl	12(%ebp), %ebx
	addl	$20, %esp
	cmpl	%edi, %ebx
	jge	L326
	imull	$-81, %ebx, %eax
	imull	$81, %ebx, %edx
	leal	-12(%ebp), %ecx
	addl	%ecx, %eax
	leal	-8352(%edx,%eax), %esi
L322:
	pushl	%ebx
	incl	%ebx
	pushl	$LC31
	call	_printf
	popl	%eax
	popl	%edx
	pushl	%esi
	addl	$81, %esi
	call	__ZNK5Board5printEv
	popl	%eax
	cmpl	%edi, %ebx
	jl	L322
L326:
	xorl	%eax, %eax
L302:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC33:
	.ascii "makeCheckCell\0"
LC34:
	.ascii "usage>sudoku quiz-file [offset]\12\0"
	.text
	.align 2
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	$6816, %eax
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	call	__alloca
	movl	8(%ebp), %ebx
	movl	12(%ebp), %esi
	call	___main
	cmpl	$2, %ebx
	jne	L333
	pushl	$LC33
	pushl	4(%esi)
	call	_strcmp
	popl	%ecx
	testl	%eax, %eax
	popl	%ebx
	jne	L332
	leal	-6824(%ebp), %eax
	pushl	%eax
	call	__ZN11SolveSudoku13makeCheckCellEv
	xorl	%eax, %eax
	jmp	L331
L332:
	pushl	$0
	jmp	L335
L333:
	cmpl	$3, %ebx
	jne	L334
	pushl	$0
	pushl	$0
	pushl	8(%esi)
	call	_strtol
	addl	$12, %esp
	pushl	%eax
L335:
	pushl	4(%esi)
	call	__Z6solverPKci
	jmp	L331
L334:
	pushl	$LC34
	movl	__imp___iob, %eax
	addl	$64, %eax
	pushl	%eax
	call	_fprintf
	movl	$1, %eax
L331:
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_strtol;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
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
