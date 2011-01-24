	.file	"shapeAreas.ev"
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
	!MOV	1, 31
	mov	 %o0, %l2	 
	!STOREAI	0, 31, 0
	st	%g0, [%l2 + 0]
	!STOREAI	0, 31, 4
	st	%g0, [%l2 + 4]
	!NEW	4, 1
	mov	4, %o0
	call	malloc
	nop
	!MOV	1, 32
	mov	 %o0, %l3	 
	!STOREAI	0, 32, 0
	st	%g0, [%l3 + 0]
	!NEW	4, 1
	mov	4, %o0
	call	malloc
	nop
	!MOV	1, 33
	mov	 %o0, %l4	 
	!STOREAI	0, 33, 0
	st	%g0, [%l4 + 0]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 34
	mov	 %o0, %l1	 
	!STOREAI	0, 34, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 34, 4
	st	%g0, [%l1 + 4]
	!MOV	34, 31
	mov	 %l1, %l2	 
	!NEW	4, 1
	mov	4, %o0
	call	malloc
	nop
	!MOV	1, 36
	mov	 %o0, %l1	 
	!STOREAI	0, 36, 0
	st	%g0, [%l1 + 0]
	!MOV	36, 32
	mov	 %l1, %l3	 
	!NEW	4, 1
	mov	4, %o0
	call	malloc
	nop
	!MOV	1, 38
	mov	 %o0, %l1	 
	!STOREAI	0, 38, 0
	st	%g0, [%l1 + 0]
	!MOV	38, 33
	mov	 %l1, %l4	 
	!LOADI	1, 40
	set	 1, %l1	 	!int: reg 40 gets val 1
	!MOV	40, 30
	mov	 %l1, %l6	 
 !#while-guard:
.S0:
	!LOADI	0, 44
	set	 0, %l1	 	!int: reg 44 gets val 0
	!MOV	30, 43
	mov	 %l6, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 42
	mov	 %g0, %l7	 
	!COMP	43, 44, 2
	cmp	 %l5, %l1	 
	!MOVNE	2, 3, 42
	movne	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	42, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 42) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!READ	45
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	45, 30
	mov	 %l1, %l6	 
 !#if-guard:
	!LOADI	0, 49
	set	 0, %l1	 	!int: reg 49 gets val 0
	!MOV	30, 48
	mov	 %l6, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 47
	mov	 %g0, %l7	 
	!COMP	48, 49, 2
	cmp	 %l5, %l1	 
	!MOVNE	2, 3, 47
	movne	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	47, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 47) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
 !#if-guard:
	!LOADI	1, 52
	set	 1, %l1	 	!int: reg 52 gets val 1
	!MOV	30, 51
	mov	 %l6, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 50
	mov	 %g0, %l7	 
	!COMP	51, 52, 2
	cmp	 %l5, %l1	 
	!MOVEQ	2, 3, 50
	move	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	50, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 50) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!READ	53
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	32, 54
	mov	 %l3, %l5	 
	!STOREAI	53, 54, 0
	st	%l1, [%l5 + 0]
	!MOV	32, 57
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	57, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 57to register outReg 1
	!CALL	areaCircle
	call	 areaCircle	
	nop
	!MOV	1, 56
	mov	 %o0, %l1	 
	!PRINTLN	56
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
.S4:
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 .S7:
 !#if-guard:
	!LOADI	2, 60
	set	 2, %l1	 	!int: reg 60 gets val 2
	!MOV	30, 59
	mov	 %l6, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 58
	mov	 %g0, %l7	 
	!COMP	59, 60, 2
	cmp	 %l5, %l1	 
	!MOVEQ	2, 3, 58
	move	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	58, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 58) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!READ	61
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	33, 62
	mov	 %l4, %l5	 
	!STOREAI	61, 62, 0
	st	%l1, [%l5 + 0]
	!MOV	33, 65
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	65, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 65to register outReg 1
	!CALL	areaSquare
	call	 areaSquare	
	nop
	!MOV	1, 64
	mov	 %o0, %l1	 
	!PRINTLN	64
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
	!JUMPI	.S8
	ba	 .S8	 	!if: jump to #end-if '.S8'
	nop
 .S10:
	!READ	66
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	31, 67
	mov	 %l2, %l5	 
	!STOREAI	66, 67, 0
	st	%l1, [%l5 + 0]
	!READ	69
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	31, 70
	mov	 %l2, %l5	 
	!STOREAI	69, 70, 4
	st	%l1, [%l5 + 4]
	!MOV	31, 73
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	73, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 73to register outReg 1
	!CALL	areaRectangle
	call	 areaRectangle	
	nop
	!MOV	1, 72
	mov	 %o0, %l1	 
	!PRINTLN	72
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!JUMPI	.S11
	ba	 .S11	 	!if: jump to #end-if '.S11'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	areaSquare
	.type	areaSquare, #function
	.proc	04
!#function-entry:
areaSquare:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 27
	mov	 %i0, %l0	 
 !#function-body:
	!MOV	27, 29
	mov	 %l0, %l1	 
	!LOADAI	29, 0, 29
	ld	[%l1 + 0], %l1
	!MOV	27, 28
	mov	 %l0, %l0	 
	!LOADAI	28, 0, 28
	ld	[%l0 + 0], %l0
	!MULT	28, 29, 4
	smul	 %l0, %l1, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	areaRectangle
	.type	areaRectangle, #function
	.proc	04
!#function-entry:
areaRectangle:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 24
	mov	 %i0, %l0	 
 !#function-body:
	!MOV	24, 26
	mov	 %l0, %l1	 
	!LOADAI	26, 4, 26
	ld	[%l1 + 4], %l1
	!MOV	24, 25
	mov	 %l0, %l0	 
	!LOADAI	25, 0, 25
	ld	[%l0 + 0], %l0
	!MULT	25, 26, 4
	smul	 %l0, %l1, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	areaCircle
	.type	areaCircle, #function
	.proc	04
!#function-entry:
areaCircle:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l0	 
 !#function-body:
	!LOADI	3, 20
	set	 3, %l1	 	!int: reg 20 gets val 3
	!MOV	16, 22
	mov	 %l0, %l2	 
	!LOADAI	22, 0, 22
	ld	[%l2 + 0], %l2
	!MOV	16, 21
	mov	 %l0, %l0	 
	!LOADAI	21, 0, 21
	ld	[%l0 + 0], %l0
	!MULT	21, 22, 19
	smul	 %l0, %l2, %l0	 
	!MULT	19, 20, 18
	smul	 %l0, %l1, %l0	 
	!MOV	18, 17
	mov	 %l0, %l0	 
	!MOV	17, 4
	mov	 %l0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 