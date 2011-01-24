	.file	"BenchMarkishTopics.ev"
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
	!MOV	1, 53
	mov	 %o0, %l6	 
	!STOREAI	0, 53, 0
	st	%g0, [%l6 + 0]
	!STOREAI	0, 53, 4
	st	%g0, [%l6 + 4]
	!READ	55
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	55, 16
	mov	 %l1, %l4	 
	!LOADI	0, 57
	set	 0, %l1	 	!int: reg 57 gets val 0
	!MOV	57, 54
	mov	 %l1, %l3	 
	!MOV	0, 59
	mov	 %g0, %l1	 	!null: reg 59 gets false
	!MOV	59, 53
	mov	 %l1, %l6	 
 !#while-guard:
.S9:
	!LOADI	0, 63
	set	 0, %l1	 	!int: reg 63 gets val 0
	!MOV	16, 62
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 61
	mov	 %g0, %l5	 
	!COMP	62, 63, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 61
	movg	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	61, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 61) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!MOV	53, 65
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	65, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 65to register outReg 1
	!MOV	16, 65
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	65, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 65to register outReg 2
	!CALL	addToFront
	call	 addToFront	
	nop
	!MOV	1, 64
	mov	 %o0, %l1	 
	!MOV	64, 53
	mov	 %l1, %l6	 
	!MOV	53, 67
	mov	 %l6, %l1	 
	!LOADAI	67, 0, 67
	ld	[%l1 + 0], %l1
	!PRINT	67
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 70
	set	 1, %l1	 	!int: reg 70 gets val 1
	!MOV	16, 69
	mov	 %l4, %l2	 
	!SUB	69, 70, 68
	sub	 %l2, %l1, %l1	 
	!MOV	68, 16
	mov	 %l1, %l4	 
	!JUMPI	.S9
	ba	 .S9	 	!while: jump back to guard
	nop
 .S11:
	!MOV	53, 73
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	73, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 73to register outReg 1
	!CALL	length
	call	 length	
	nop
	!MOV	1, 72
	mov	 %o0, %l1	 
	!PRINT	72
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
 !#while-guard:
.S12:
	!LOADI	0, 76
	set	 0, %l1	 	!int: reg 76 gets val 0
	!MOV	53, 77
	mov	 %l6, %l2	 
	!STOREOUTARGUMENT	77, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 77to register outReg 1
	!CALL	length
	call	 length	
	nop
	!MOV	1, 75
	mov	 %o0, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 74
	mov	 %g0, %l4	 
	!COMP	75, 76, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 74
	movg	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	74, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 74) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
	!MOV	53, 80
	mov	 %l6, %l2	 
	!LOADAI	80, 0, 80
	ld	[%l2 + 0], %l2
	!MOV	54, 79
	mov	 %l3, %l1	 
	!ADD	79, 80, 78
	add	 %l1, %l2, %l1	 
	!MOV	78, 54
	mov	 %l1, %l3	 
	!MOV	53, 83
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	83, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 83to register outReg 1
	!CALL	length
	call	 length	
	nop
	!MOV	1, 82
	mov	 %o0, %l1	 
	!PRINT	82
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 85
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	85, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 85to register outReg 1
	!CALL	deleteFirst
	call	 deleteFirst	
	nop
	!MOV	1, 84
	mov	 %o0, %l1	 
	!MOV	84, 53
	mov	 %l1, %l6	 
	!JUMPI	.S12
	ba	 .S12	 	!while: jump back to guard
	nop
 .S14:
	!MOV	54, 87
	mov	 %l3, %l1	 
	!PRINTLN	87
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
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
	.global	deleteFirst
	.type	deleteFirst, #function
	.proc	04
!#function-entry:
deleteFirst:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 43
	mov	 %i0, %l2	 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 44
	mov	 %o0, %l1	 
	!STOREAI	0, 44, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 44, 4
	st	%g0, [%l1 + 4]
 !#if-guard:
	!MOV	0, 47
	mov	 %g0, %l1	 	!null: reg 47 gets false
	!MOV	43, 46
	mov	 %l2, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 45
	mov	 %g0, %l4	 
	!COMP	46, 47, 2
	cmp	 %l3, %l1	 
	!MOVEQ	2, 3, 45
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	45, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 45) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	0, 4
	mov	 %g0, %i0	 	!null: reg 4 gets false
	!RET	
	ret
	restore
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!MOV	43, 48
	mov	 %l2, %l0	 
	!MOV	48, 44
	mov	 %l0, %l1	 
	!MOV	43, 50
	mov	 %l2, %l0	 
	!LOADAI	50, 4, 50
	ld	[%l0 + 4], %l0
	!MOV	50, 43
	mov	 %l0, %l2	 
	!MOV	43, 4
	mov	 %l2, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	addToFront
	.type	addToFront, #function
	.proc	04
!#function-entry:
addToFront:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 24
	mov	 %i0, %l4	 
	!STOREINARGUMENT	11, 25
	mov	 %i1, %l2	 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 26
	mov	 %o0, %l3	 
	!STOREAI	0, 26, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 26, 4
	st	%g0, [%l3 + 4]
 !#if-guard:
	!MOV	0, 29
	mov	 %g0, %l1	 	!null: reg 29 gets false
	!MOV	24, 28
	mov	 %l4, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 27
	mov	 %g0, %l5	 
	!COMP	28, 29, 2
	cmp	 %l3, %l1	 
	!MOVEQ	2, 3, 27
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	27, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 27) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 30
	mov	 %o0, %l1	 
	!STOREAI	0, 30, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 30, 4
	st	%g0, [%l1 + 4]
	!MOV	30, 24
	mov	 %l1, %l4	 
	!MOV	25, 32
	mov	 %l2, %l1	 
	!MOV	24, 33
	mov	 %l4, %l3	 
	!STOREAI	32, 33, 0
	st	%l1, [%l3 + 0]
	!MOV	24, 4
	mov	 %l4, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
.S4:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 35
	mov	 %o0, %l1	 
	!STOREAI	0, 35, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 35, 4
	st	%g0, [%l1 + 4]
	!MOV	35, 26
	mov	 %l1, %l3	 
	!MOV	25, 37
	mov	 %l2, %l0	 
	!MOV	26, 38
	mov	 %l3, %l1	 
	!STOREAI	37, 38, 0
	st	%l0, [%l1 + 0]
	!MOV	24, 40
	mov	 %l4, %l0	 
	!MOV	26, 41
	mov	 %l3, %l1	 
	!STOREAI	40, 41, 4
	st	%l0, [%l1 + 4]
	!MOV	26, 4
	mov	 %l3, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	length
	.type	length, #function
	.proc	04
!#function-entry:
length:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 17
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 20
	mov	 %g0, %l2	 	!null: reg 20 gets false
	!MOV	17, 19
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 18
	mov	 %g0, %l4	 
	!COMP	19, 20, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 18
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	18, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 18) to true
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
	!MOV	17, 23
	mov	 %l1, %l1	 
	!LOADAI	23, 4, 23
	ld	[%l1 + 4], %l1
	!STOREOUTARGUMENT	23, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 23to register outReg 1
	!CALL	length
	call	 length	
	nop
	!MOV	1, 22
	mov	 %o0, %l0	 
	!LOADI	1, 21
	set	 1, %l1	 	!int: reg 21 gets val 1
	!ADD	21, 22, 4
	add	 %l1, %l0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 