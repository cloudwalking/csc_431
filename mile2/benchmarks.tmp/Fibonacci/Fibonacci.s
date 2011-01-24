	.file	"Fibonacci.ev"
	.section	".rodata"
	.align	8
.EV1LPR:
	.asciz	"%d "
	.align	8
.EV1LPRL:
	.asciz	"%d\n"
	.align	8
.EV1LRD:
	.asciz	"%d"
	.align	8
READLOL:
	.common readplz,4,4
	.section	".text"
	.align	4
	.global	main
	.type	main, #function
	.proc	04
!#function-entry:
main:
	!SAVE	
	save	%sp, -800, %sp 
 !#function-body:
	!READ	32
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	32, 31
	mov	 %l1, %l1	 
	!MOV	31, 35
	mov	 %l1, %l1	 
	!STOREOUTARGUMENT	35, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 35to register outReg 1
	!CALL	computeFib
	call	 computeFib	
	nop
	!MOV	1, 34
	mov	 %o0, %l0	 
	!PRINTLN	34
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	computeFib
	.type	computeFib, #function
	.proc	04
!#function-entry:
computeFib:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l3	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 19
	set	 0, %l1	 	!int: reg 19 gets val 0
	!MOV	16, 18
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 17
	mov	 %g0, %l4	 
	!COMP	18, 19, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 17
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	17, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 17) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
 !#if-guard:
	!LOADI	2, 22
	set	 2, %l1	 	!int: reg 22 gets val 2
	!MOV	16, 21
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 20
	mov	 %g0, %l4	 
	!COMP	21, 22, 2
	cmp	 %l2, %l1	 
	!MOVLE	2, 3, 20
	movle	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	20, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 20) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
	!JUMPI	.S2
	ba	 .S2	 	!if: jump to #end-if '.S2'
	nop
 .S4:
	!LOADI	2, 30
	set	 2, %l1	 	!int: reg 30 gets val 2
	!MOV	16, 29
	mov	 %l3, %l2	 
	!SUB	29, 30, 28
	sub	 %l2, %l1, %l1	 
	!STOREOUTARGUMENT	28, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 28to register outReg 1
	!CALL	computeFib
	call	 computeFib	
	nop
	!MOV	1, 24
	mov	 %o0, %l2	 
	!LOADI	1, 27
	set	 1, %l1	 	!int: reg 27 gets val 1
	!MOV	16, 26
	mov	 %l3, %l3	 
	!SUB	26, 27, 25
	sub	 %l3, %l1, %l1	 
	!STOREOUTARGUMENT	25, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 25to register outReg 1
	!CALL	computeFib
	call	 computeFib	
	nop
	!MOV	1, 23
	mov	 %o0, %l0	 
	!ADD	23, 24, 4
	add	 %l0, %l2, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 !#function-exit:
 