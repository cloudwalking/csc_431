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
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 40
	mov	 %o0, %l2	 
	!MOV	35, 41
	mov	 %l3, %l3	 	!lvalue id: move reg 35 (var power) to reg 41
	!MOV	40, 41
	mov	 %l2, %l3	 
	!MOV	41, 35
	mov	 %l3, %l3	 
	!MOV	36, 43
	mov	 %l6, %l2	 	!lvalue id: move reg 36 (var input) to reg 43
	!READ	43
	add	%sp, %g0, %l2
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l2

	!MOV	43, 36
	mov	 %l2, %l6	 
	!MOV	36, 45
	mov	 %l6, %l2	 	!id: move reg 36 (var maininput) to reg 45
	!MOV	35, 47
	mov	 %l3, %l4	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	47, 3, 46
	ld	[%l4 + %g1], %l7
	!MOV	45, 46
	mov	 %l2, %l7	 
	!STOREAI	46, 47, 3
	st	%l7, [%l4 + %g1]
	!MOV	36, 49
	mov	 %l6, %l2	 	!lvalue id: move reg 36 (var input) to reg 49
	!READ	49
	add	%sp, %g0, %l2
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l2

	!MOV	49, 36
	mov	 %l2, %l6	 
 !#if-guard:
	!LOADI	0, 53
	set	 0, %l2	 	!int: reg 53 gets val 0
	!MOV	36, 52
	mov	 %l6, %l4	 	!id: move reg 36 (var maininput) to reg 52
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 51
	mov	 %g0, %l7	 
	!COMP	52, 53, 2
	cmp	 %l4, %l2	 	!expression: compare: reg 52 (var null) to 53 (var null), store in cc-reg
	!MOVLT	2, 3, 51
	movl	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	51, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 51) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!LOADI	1, 54
	set	 1, %l2	 	!int: reg 54 gets val 1
	!LOADI	-1, 55
	mov	 -1, %l4	 
	!MULT	54, 55, 4
	smul	 %l2, %l4, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
.S4:
	!MOV	36, 56
	mov	 %l6, %l2	 	!id: move reg 36 (var maininput) to reg 56
	!MOV	35, 58
	mov	 %l3, %l4	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	58, 3, 57
	ld	[%l4 + %g1], %l6
	!MOV	56, 57
	mov	 %l2, %l6	 
	!STOREAI	57, 58, 3
	st	%l6, [%l4 + %g1]
	!LOADI	0, 60
	set	 0, %l2	 	!int: reg 60 gets val 0
	!MOV	39, 61
	mov	 %l5, %l4	 	!lvalue id: move reg 39 (var i) to reg 61
	!MOV	60, 61
	mov	 %l2, %l4	 
	!MOV	61, 39
	mov	 %l4, %l5	 
 !#while-guard:
.S6:
	!LOADI	1000000, 65
	set	 1000000, %l2	 	!int: reg 65 gets val 1000000
	!MOV	39, 64
	mov	 %l5, %l4	 	!id: move reg 39 (var maini) to reg 64
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 63
	mov	 %g0, %l6	 
	!COMP	64, 65, 2
	cmp	 %l4, %l2	 	!expression: compare: reg 64 (var null) to 65 (var null), store in cc-reg
	!MOVLT	2, 3, 63
	movl	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	63, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 63) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!LOADI	1, 69
	set	 1, %l2	 	!int: reg 69 gets val 1
	!MOV	39, 68
	mov	 %l5, %l4	 	!id: move reg 39 (var maini) to reg 68
	!ADD	68, 69, 66
	add	 %l4, %l2, %l2	 	!expression: reg 68 (var null) + 69 in reg 66 (var null)
	!MOV	39, 67
	mov	 %l5, %l4	 	!lvalue id: move reg 39 (var i) to reg 67
	!MOV	66, 67
	mov	 %l2, %l4	 
	!MOV	67, 39
	mov	 %l4, %l5	 
	!MOV	35, 74
	mov	 %l3, %l2	 	!id: move reg 35 (var mainpower) to reg 74
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	74, 3, 73
	ld	[%l2 + %g1], %l2
	!STOREOUTARGUMENT	73, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 73to register outReg 1
	!MOV	35, 75
	mov	 %l3, %l2	 	!id: move reg 35 (var mainpower) to reg 75
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	75, 3, 73
	ld	[%l2 + %g1], %l2
	!STOREOUTARGUMENT	73, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 73to register outReg 2
	!CALL	calcPower
	call	 calcPower	
	nop
	!MOV	1, 71
	mov	 %o0, %l2	 
	!MOV	37, 72
	mov	 %l1, %l1	 	!lvalue id: move reg 37 (var result) to reg 72
	!MOV	71, 72
	mov	 %l2, %l1	 
	!MOV	72, 37
	mov	 %l1, %l1	 
	!JUMPI	.S6
	ba	 .S6	 	!while: jump back to guard
	nop
 .S8:
	!MOV	37, 77
	mov	 %l1, %l0	 	!id: move reg 37 (var mainresult) to reg 77
	!PRINTLN	77
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
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
	mov	 %i1, %l5	 
 !#function-body:
	!LOADI	1, 19
	set	 1, %l2	 	!int: reg 19 gets val 1
	!MOV	18, 20
	mov	 %l4, %l3	 	!lvalue id: move reg 18 (var result) to reg 20
	!MOV	19, 20
	mov	 %l2, %l3	 
	!MOV	20, 18
	mov	 %l3, %l4	 
 !#while-guard:
.S0:
	!LOADI	0, 24
	set	 0, %l2	 	!int: reg 24 gets val 0
	!MOV	17, 23
	mov	 %l5, %l3	 	!id: move reg 17 (var calcPowerexp) to reg 23
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 22
	mov	 %g0, %l6	 
	!COMP	23, 24, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 23 (var null) to 24 (var null), store in cc-reg
	!MOVGT	2, 3, 22
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	22, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 22) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!MOV	16, 28
	mov	 %l1, %l2	 	!id: move reg 16 (var calcPowerbase) to reg 28
	!MOV	18, 27
	mov	 %l4, %l3	 	!id: move reg 18 (var calcPowerresult) to reg 27
	!MULT	27, 28, 25
	smul	 %l3, %l2, %l2	 	!expression: reg 27 (var null) * 28 in reg 25 (var null)
	!MOV	18, 26
	mov	 %l4, %l3	 	!lvalue id: move reg 18 (var result) to reg 26
	!MOV	25, 26
	mov	 %l2, %l3	 
	!MOV	26, 18
	mov	 %l3, %l4	 
	!LOADI	1, 33
	set	 1, %l2	 	!int: reg 33 gets val 1
	!MOV	17, 32
	mov	 %l5, %l3	 	!id: move reg 17 (var calcPowerexp) to reg 32
	!SUB	32, 33, 30
	sub	 %l3, %l2, %l2	 	!expression: reg 32 (var null) - 33 in reg 30 (var null)
	!MOV	17, 31
	mov	 %l5, %l3	 	!lvalue id: move reg 17 (var exp) to reg 31
	!MOV	30, 31
	mov	 %l2, %l3	 
	!MOV	31, 17
	mov	 %l3, %l5	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!MOV	18, 4
	mov	 %l4, %i0	 	!id: move reg 18 (var calcPowerresult) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 