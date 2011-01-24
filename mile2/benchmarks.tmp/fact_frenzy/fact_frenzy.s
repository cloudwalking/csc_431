	.file	"fact_frenzy.ev"
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
	!READ	51
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	51, 50
	mov	 %l1, %l1	 
	!READ	53
	add	%sp, %g0, %l2
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l2

	!MOV	53, 49
	mov	 %l2, %l2	 
	!LOADI	0, 55
	set	 0, %l3	 	!int: reg 55 gets val 0
	!MOV	55, 48
	mov	 %l3, %l6	 
 !#while-guard:
.S3:
	!MOV	49, 59
	mov	 %l2, %l3	 
	!MOV	48, 58
	mov	 %l6, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 57
	mov	 %g0, %l7	 
	!COMP	58, 59, 2
	cmp	 %l5, %l3	 
	!MOVLT	2, 3, 57
	movl	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	57, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 57) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
	!MOV	50, 61
	mov	 %l1, %l3	 
	!STOREOUTARGUMENT	61, 5
	mov	 %l3, %o0	 	!argument: store out param from reg 61to register outReg 1
	!CALL	fact
	call	 fact	
	nop
	!MOV	1, 60
	mov	 %o0, %l3	 
	!MOV	60, 47
	mov	 %l3, %l4	 
	!LOADI	1, 65
	set	 1, %l3	 	!int: reg 65 gets val 1
	!MOV	48, 64
	mov	 %l6, %l5	 
	!ADD	64, 65, 63
	add	 %l5, %l3, %l3	 
	!MOV	63, 48
	mov	 %l3, %l6	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
	!MOV	50, 67
	mov	 %l1, %l3	 
	!PRINT	67
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
	!MOV	47, 68
	mov	 %l4, %l3	 
	!PRINTLN	68
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
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
	.global	fact
	.type	fact, #function
	.proc	04
!#function-entry:
fact:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 27
	mov	 %i0, %l1	 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 28
	mov	 %o0, %l4	 
	!STOREAI	0, 28, 0
	st	%g0, [%l4 + 0]
	!STOREAI	0, 28, 4
	st	%g0, [%l4 + 4]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 30
	mov	 %o0, %l2	 
	!STOREAI	0, 30, 0
	st	%g0, [%l2 + 0]
	!STOREAI	0, 30, 4
	st	%g0, [%l2 + 4]
	!MOV	30, 28
	mov	 %l2, %l4	 
	!MOV	27, 32
	mov	 %l1, %l1	 
	!MOV	28, 33
	mov	 %l4, %l2	 
	!STOREAI	32, 33, 0
	st	%l1, [%l2 + 0]
	!LOADI	1, 35
	set	 1, %l1	 	!int: reg 35 gets val 1
	!MOV	28, 36
	mov	 %l4, %l2	 
	!STOREAI	35, 36, 4
	st	%l1, [%l2 + 4]
 !#while-guard:
.S0:
	!LOADI	1, 40
	set	 1, %l1	 	!int: reg 40 gets val 1
	!MOV	28, 39
	mov	 %l4, %l2	 
	!LOADAI	39, 0, 39
	ld	[%l2 + 0], %l2
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 38
	mov	 %g0, %l3	 
	!COMP	39, 40, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 38
	movg	 %icc, %g1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	38, 3, 2
	cmp	 %l3, %g1	 	!while: compare guard result (reg 38) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!MOV	28, 42
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	42, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 42to register outReg 1
	!CALL	factarth
	call	 factarth	
	nop
	!MOV	1, 41
	mov	 %o0, %l1	 
	!MOV	41, 28
	mov	 %l1, %l4	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!MOV	28, 44
	mov	 %l4, %l1	 
	!LOADAI	44, 4, 44
	ld	[%l1 + 4], %l1
	!MOV	44, 29
	mov	 %l1, %l1	 
	!MOV	29, 4
	mov	 %l1, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	factarth
	.type	factarth, #function
	.proc	04
!#function-entry:
factarth:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l0	 
 !#function-body:
	!MOV	16, 19
	mov	 %l0, %l1	 
	!LOADAI	19, 0, 19
	ld	[%l1 + 0], %l1
	!MOV	16, 18
	mov	 %l0, %l2	 
	!LOADAI	18, 4, 18
	ld	[%l2 + 4], %l2
	!MULT	18, 19, 17
	smul	 %l2, %l1, %l1	 
	!MOV	16, 20
	mov	 %l0, %l2	 
	!STOREAI	17, 20, 4
	st	%l1, [%l2 + 4]
	!LOADI	1, 24
	set	 1, %l1	 	!int: reg 24 gets val 1
	!MOV	16, 23
	mov	 %l0, %l2	 
	!LOADAI	23, 0, 23
	ld	[%l2 + 0], %l2
	!SUB	23, 24, 22
	sub	 %l2, %l1, %l1	 
	!MOV	16, 25
	mov	 %l0, %l2	 
	!STOREAI	22, 25, 0
	st	%l1, [%l2 + 0]
	!MOV	16, 4
	mov	 %l0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 