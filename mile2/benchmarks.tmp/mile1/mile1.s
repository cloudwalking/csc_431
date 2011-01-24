	.file	"mile1.ev"
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
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 32
	mov	 %o0, %l4	 
	!STOREAI	0, 32, 0
	st	%g0, [%l4 + 0]
	!STOREAI	0, 32, 4
	st	%g0, [%l4 + 4]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 37
	mov	 %o0, %l1	 
	!STOREAI	0, 37, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 37, 4
	st	%g0, [%l1 + 4]
	!MOV	37, 32
	mov	 %l1, %l4	 
	!READ	39
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	39, 33
	mov	 %l1, %l5	 
	!MOV	33, 41
	mov	 %l5, %l1	 
	!MOV	32, 42
	mov	 %l4, %l3	 
	!STOREAI	41, 42, 0
	st	%l1, [%l3 + 0]
	!READ	44
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	44, 33
	mov	 %l1, %l5	 
 !#if-guard:
	!LOADI	0, 48
	set	 0, %l1	 	!int: reg 48 gets val 0
	!MOV	33, 47
	mov	 %l5, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 46
	mov	 %g0, %l6	 
	!COMP	47, 48, 2
	cmp	 %l3, %l1	 
	!MOVLT	2, 3, 46
	movl	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	46, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 46) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!LOADI	1, 49
	set	 1, %l1	 	!int: reg 49 gets val 1
	!LOADI	-1, 50
	mov	 -1, %l3	 
	!MULT	49, 50, 4
	smul	 %l1, %l3, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
.S4:
	!MOV	33, 51
	mov	 %l5, %l1	 
	!MOV	32, 52
	mov	 %l4, %l3	 
	!STOREAI	51, 52, 4
	st	%l1, [%l3 + 4]
	!LOADI	0, 54
	set	 0, %l1	 	!int: reg 54 gets val 0
	!MOV	54, 36
	mov	 %l1, %l5	 
 !#while-guard:
.S6:
	!LOADI	1000000, 58
	set	 1000000, %l1	 	!int: reg 58 gets val 1000000
	!MOV	36, 57
	mov	 %l5, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 56
	mov	 %g0, %l6	 
	!COMP	57, 58, 2
	cmp	 %l3, %l1	 
	!MOVLT	2, 3, 56
	movl	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	56, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 56) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!LOADI	1, 61
	set	 1, %l1	 	!int: reg 61 gets val 1
	!MOV	36, 60
	mov	 %l5, %l2	 
	!ADD	60, 61, 59
	add	 %l2, %l1, %l1	 
	!MOV	59, 36
	mov	 %l1, %l5	 
	!MOV	32, 64
	mov	 %l4, %l1	 
	!LOADAI	64, 0, 64
	ld	[%l1 + 0], %l1
	!STOREOUTARGUMENT	64, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 64to register outReg 1
	!MOV	32, 64
	mov	 %l4, %l1	 
	!LOADAI	64, 4, 64
	ld	[%l1 + 4], %l1
	!STOREOUTARGUMENT	64, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 64to register outReg 2
	!CALL	calcPower
	call	 calcPower	
	nop
	!MOV	1, 63
	mov	 %o0, %l1	 
	!MOV	63, 34
	mov	 %l1, %l2	 
	!JUMPI	.S6
	ba	 .S6	 	!while: jump back to guard
	nop
 .S8:
	!MOV	34, 66
	mov	 %l2, %l1	 
	!PRINTLN	66
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	calcPower
	.type	calcPower, #function
	.proc	04
!#function-entry:
calcPower:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 17
	mov	 %i1, %l4	 
 !#function-body:
	!LOADI	1, 19
	set	 1, %l2	 	!int: reg 19 gets val 1
	!MOV	19, 18
	mov	 %l2, %l5	 
 !#while-guard:
.S0:
	!LOADI	0, 23
	set	 0, %l2	 	!int: reg 23 gets val 0
	!MOV	17, 22
	mov	 %l4, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 21
	mov	 %g0, %l6	 
	!COMP	22, 23, 2
	cmp	 %l3, %l2	 
	!MOVGT	2, 3, 21
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	21, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 21) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!MOV	16, 26
	mov	 %l1, %l2	 
	!MOV	18, 25
	mov	 %l5, %l3	 
	!MULT	25, 26, 24
	smul	 %l3, %l2, %l2	 
	!MOV	24, 18
	mov	 %l2, %l5	 
	!LOADI	1, 30
	set	 1, %l2	 	!int: reg 30 gets val 1
	!MOV	17, 29
	mov	 %l4, %l3	 
	!SUB	29, 30, 28
	sub	 %l3, %l2, %l2	 
	!MOV	28, 17
	mov	 %l2, %l4	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!MOV	18, 4
	mov	 %l5, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 