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
	!LOADI	22, 64
	set	 22, %l1	 	!int: reg 64 gets val 22
	!MOV	16, 65
	mov	 %l4, %l2	 	!lvalue id: move reg 16 (var intXList) to reg 65
	!MOV	64, 65
	mov	 %l1, %l2	 
	!MOV	65, 16
	mov	 %l2, %l4	 
	!LOADI	0, 67
	set	 0, %l1	 	!int: reg 67 gets val 0
	!MOV	63, 68
	mov	 %l3, %l2	 	!lvalue id: move reg 63 (var sum) to reg 68
	!MOV	67, 68
	mov	 %l1, %l2	 
	!MOV	68, 63
	mov	 %l2, %l3	 
	!MOV	0, 70
	mov	 %g0, %l1	 	!null: reg 70 gets false
	!MOV	62, 71
	mov	 %l6, %l2	 	!lvalue id: move reg 62 (var list) to reg 71
	!MOV	70, 71
	mov	 %l1, %l2	 
	!MOV	71, 62
	mov	 %l2, %l6	 
 !#while-guard:
.S9:
	!LOADI	0, 75
	set	 0, %l1	 	!int: reg 75 gets val 0
	!MOV	16, 74
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 73
	mov	 %g0, %l5	 
	!COMP	74, 75, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 73
	movg	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	73, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 73) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!MOV	62, 78
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	78, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 78to register outReg 1
	!MOV	16, 78
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	78, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 78to register outReg 2
	!CALL	addToFront
	call	 addToFront	
	nop
	!MOV	1, 76
	mov	 %o0, %l1	 
	!MOV	62, 77
	mov	 %l6, %l2	 	!lvalue id: move reg 62 (var list) to reg 77
	!MOV	76, 77
	mov	 %l1, %l2	 
	!MOV	77, 62
	mov	 %l2, %l6	 
	!MOV	62, 81
	mov	 %l6, %l1	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	81, 3, 80
	ld	[%l1 + %g1], %l1
	!PRINT	80
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 85
	set	 1, %l1	 	!int: reg 85 gets val 1
	!MOV	16, 84
	mov	 %l4, %l2	 
	!SUB	84, 85, 82
	sub	 %l2, %l1, %l1	 
	!MOV	16, 83
	mov	 %l4, %l2	 	!lvalue id: move reg 16 (var intXList) to reg 83
	!MOV	82, 83
	mov	 %l1, %l2	 
	!MOV	83, 16
	mov	 %l2, %l4	 
	!JUMPI	.S9
	ba	 .S9	 	!while: jump back to guard
	nop
 .S11:
	!MOV	62, 88
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	88, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 88to register outReg 1
	!CALL	length
	call	 length	
	nop
	!MOV	1, 87
	mov	 %o0, %l1	 
	!PRINT	87
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
 !#while-guard:
.S12:
	!LOADI	0, 91
	set	 0, %l1	 	!int: reg 91 gets val 0
	!MOV	62, 92
	mov	 %l6, %l2	 
	!STOREOUTARGUMENT	92, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 92to register outReg 1
	!CALL	length
	call	 length	
	nop
	!MOV	1, 90
	mov	 %o0, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 89
	mov	 %g0, %l4	 
	!COMP	90, 91, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 89
	movg	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	89, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 89) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
	!MOV	62, 97
	mov	 %l6, %l1	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	97, 3, 96
	ld	[%l1 + %g1], %l1
	!MOV	63, 95
	mov	 %l3, %l2	 
	!ADD	95, 96, 93
	add	 %l2, %l1, %l1	 
	!MOV	63, 94
	mov	 %l3, %l2	 	!lvalue id: move reg 63 (var sum) to reg 94
	!MOV	93, 94
	mov	 %l1, %l2	 
	!MOV	94, 63
	mov	 %l2, %l3	 
	!MOV	62, 100
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	100, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 100to register outReg 1
	!CALL	length
	call	 length	
	nop
	!MOV	1, 99
	mov	 %o0, %l1	 
	!PRINT	99
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	62, 103
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	103, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 103to register outReg 1
	!CALL	deleteFirst
	call	 deleteFirst	
	nop
	!MOV	1, 101
	mov	 %o0, %l1	 
	!MOV	62, 102
	mov	 %l6, %l2	 	!lvalue id: move reg 62 (var list) to reg 102
	!MOV	101, 102
	mov	 %l1, %l2	 
	!MOV	102, 62
	mov	 %l2, %l6	 
	!JUMPI	.S12
	ba	 .S12	 	!while: jump back to guard
	nop
 .S14:
	!MOV	63, 105
	mov	 %l3, %l0	 
	!PRINTLN	105
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
	.global	deleteFirst
	.type	deleteFirst, #function
	.proc	04
!#function-entry:
deleteFirst:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 49
	mov	 %i0, %l4	 
 !#function-body:
 !#if-guard:
	!MOV	0, 53
	mov	 %g0, %l2	 	!null: reg 53 gets false
	!MOV	49, 52
	mov	 %l4, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 51
	mov	 %g0, %l5	 
	!COMP	52, 53, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 51
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	51, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 51) to true
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
	!MOV	49, 54
	mov	 %l4, %l2	 
	!MOV	50, 55
	mov	 %l1, %l1	 	!lvalue id: move reg 50 (var first) to reg 55
	!MOV	54, 55
	mov	 %l2, %l1	 
	!MOV	55, 50
	mov	 %l1, %l1	 
	!MOV	49, 59
	mov	 %l4, %l2	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	59, 3, 57
	ld	[%l2 + %g1], %l2
	!MOV	49, 58
	mov	 %l4, %l3	 	!lvalue id: move reg 49 (var list) to reg 58
	!MOV	57, 58
	mov	 %l2, %l3	 
	!MOV	58, 49
	mov	 %l3, %l4	 
	!MOV	50, 61
	mov	 %l1, %l1	 
	!MOV	0, 61
	mov	 %g0, %l1	 
	!MOV	49, 4
	mov	 %l4, %i0	 
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
	!STOREINARGUMENT	10, 25
	mov	 %i0, %l5	 
	!STOREINARGUMENT	11, 26
	mov	 %i1, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 30
	mov	 %g0, %l3	 	!null: reg 30 gets false
	!MOV	25, 29
	mov	 %l5, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 28
	mov	 %g0, %l0	 
	!COMP	29, 30, 2
	cmp	 %l4, %l3	 
	!MOVEQ	2, 3, 28
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	28, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 28) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 31
	mov	 %o0, %l0	 
	!MOV	25, 32
	mov	 %l5, %l3	 	!lvalue id: move reg 25 (var list) to reg 32
	!MOV	31, 32
	mov	 %l0, %l3	 
	!MOV	32, 25
	mov	 %l3, %l5	 
	!MOV	26, 34
	mov	 %l1, %l0	 
	!MOV	25, 36
	mov	 %l5, %l3	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	36, 3, 35
	ld	[%l3 + %g1], %l4
	!MOV	34, 35
	mov	 %l0, %l4	 
	!STOREAI	35, 36, 3
	st	%l4, [%l3 + %g1]
	!MOV	25, 4
	mov	 %l5, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
.S4:
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 38
	mov	 %o0, %l0	 
	!MOV	27, 39
	mov	 %l2, %l2	 	!lvalue id: move reg 27 (var front) to reg 39
	!MOV	38, 39
	mov	 %l0, %l2	 
	!MOV	39, 27
	mov	 %l2, %l2	 
	!MOV	26, 41
	mov	 %l1, %l0	 
	!MOV	27, 43
	mov	 %l2, %l1	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	43, 3, 42
	ld	[%l1 + %g1], %l3
	!MOV	41, 42
	mov	 %l0, %l3	 
	!STOREAI	42, 43, 3
	st	%l3, [%l1 + %g1]
	!MOV	25, 45
	mov	 %l5, %l0	 
	!MOV	27, 47
	mov	 %l2, %l1	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	47, 3, 46
	ld	[%l1 + %g1], %l3
	!MOV	45, 46
	mov	 %l0, %l3	 
	!STOREAI	46, 47, 3
	st	%l3, [%l1 + %g1]
	!MOV	27, 4
	mov	 %l2, %i0	 
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
	!MOV	17, 24
	mov	 %l1, %l1	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	24, 3, 23
	ld	[%l1 + %g1], %l1
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
 