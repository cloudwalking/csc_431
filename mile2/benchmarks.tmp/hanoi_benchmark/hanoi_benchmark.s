	.file	"hanoi_benchmark.ev"
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
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	1, 93
	mov	 %o0, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!STOREAI	0, 93, 0
	st	%g0, [%l0 + 0]
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!STOREAI	0, 93, 4
	st	%g0, [%l0 + 4]
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!MOV	0, 94
	mov	 %g0, %l1	 	!null: reg 94 gets false
	!MOV	94, 16
	mov	 %l1, %l7	 
	!MOV	0, 96
	mov	 %g0, %l1	 	!null: reg 96 gets false
	!MOV	96, 17
	mov	 %l1, %l1	 
	!MOV	0, 98
	mov	 %g0, %l2	 	!null: reg 98 gets false
	!MOV	98, 18
	mov	 %l2, %l4	 
	!LOADI	0, 100
	set	 0, %l2	 	!int: reg 100 gets val 0
	!MOV	100, 19
	mov	 %l2, %l2	 
	!READ	102
	add	%sp, %g0, %l3
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l3

	!MOV	102, 92
	mov	 %l3, %l3	 
 !#if-guard:
	!LOADI	1, 106
	set	 1, %l5	 	!int: reg 106 gets val 1
	!MOV	92, 105
	mov	 %l3, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	0, 104
	mov	 %g0, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!COMP	105, 106, 2
	cmp	 %l6, %l5	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOVGE	2, 3, 104
	movge	 %icc, %g1, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!LOADI	1, 3
	set	 1, %g1	 
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!COMP	104, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 104) to true
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!CBREQ	2, .S18, .S19
	be	 .S18	 	!if: branch true: '.S18' false: '.S19'
	nop
	ba	.S19 	!if: branch true: '.S18' false: '.S19'
	nop
 .S18:
	!MOV	92, 107
	mov	 %l3, %l5	 
	!MOV	107, 91
	mov	 %l5, %g3	 
 !#while-guard:
.S21:
	!LOADI	0, 111
	set	 0, %l5	 	!int: reg 111 gets val 0
	!MOV	91, 110
	mov	 %g3, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	0, 109
	mov	 %g0, %l0	 
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!COMP	110, 111, 2
	cmp	 %l6, %l5	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOVNE	2, 3, 109
	movne	 %icc, %g1, %l0	 
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 160, 999
	ld	[%sp + 160], %l0
	!COMP	109, 3, 2
	cmp	 %l0, %g1	 	!while: compare guard result (reg 109) to true
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!CBREQ	2, .S22, .S23
	be	 .S22	 	!while: branch true: '.S22' false: '.S23'
	nop
	ba	.S23 	!while: branch true: '.S22' false: '.S23'
	nop
 .S22:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 112
	mov	 %o0, %l5	 
	!STOREAI	0, 112, 0
	st	%g0, [%l5 + 0]
	!STOREAI	0, 112, 4
	st	%g0, [%l5 + 4]
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	112, 93
	mov	 %l5, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	91, 114
	mov	 %g3, %l5	 
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	93, 115
	mov	 %l0, %l6	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREAI	114, 115, 0
	st	%l5, [%l6 + 0]
	!MOV	16, 117
	mov	 %l7, %l5	 
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	93, 118
	mov	 %l0, %l6	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!STOREAI	117, 118, 4
	st	%l5, [%l6 + 4]
	!STOREAI	999, 999, 56
	st	%l0, [%sp + 56]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	93, 120
	mov	 %l0, %l5	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 56, 999
	ld	[%sp + 56], %l0
	!MOV	120, 16
	mov	 %l5, %l7	 
	!LOADI	1, 124
	set	 1, %l5	 	!int: reg 124 gets val 1
	!MOV	91, 123
	mov	 %g3, %l6	 
	!SUB	123, 124, 122
	sub	 %l6, %l5, %l5	 
	!MOV	122, 91
	mov	 %l5, %g3	 
	!JUMPI	.S21
	ba	 .S21	 	!while: jump back to guard
	nop
 .S23:
	!LOADI	1, 126
	set	 1, %l5	 	!int: reg 126 gets val 1
	!PRINTLN	126
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l5, %o1
	call	printf, 0
	nop
	!MOV	16, 127
	mov	 %l7, %l5	 
	!STOREOUTARGUMENT	127, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 127to register outReg 1
	!CALL	printPeg
	call	 printPeg	
	nop
	!LOADI	2, 128
	set	 2, %l5	 	!int: reg 128 gets val 2
	!PRINTLN	128
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l5, %o1
	call	printf, 0
	nop
	!MOV	17, 129
	mov	 %l1, %l5	 
	!STOREOUTARGUMENT	129, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 129to register outReg 1
	!CALL	printPeg
	call	 printPeg	
	nop
	!LOADI	3, 130
	set	 3, %l5	 	!int: reg 130 gets val 3
	!PRINTLN	130
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l5, %o1
	call	printf, 0
	nop
	!MOV	18, 131
	mov	 %l4, %l5	 
	!STOREOUTARGUMENT	131, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 131to register outReg 1
	!CALL	printPeg
	call	 printPeg	
	nop
	!MOV	92, 132
	mov	 %l3, %l5	 
	!STOREOUTARGUMENT	132, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 132to register outReg 1
	!LOADI	1, 132
	set	 1, %l5	 	!int: reg 132 gets val 1
	!STOREOUTARGUMENT	132, 6
	mov	 %l5, %o1	 	!argument: store out param from reg 132to register outReg 2
	!LOADI	3, 132
	set	 3, %l5	 	!int: reg 132 gets val 3
	!STOREOUTARGUMENT	132, 7
	mov	 %l5, %o2	 	!argument: store out param from reg 132to register outReg 3
	!LOADI	2, 132
	set	 2, %l5	 	!int: reg 132 gets val 2
	!STOREOUTARGUMENT	132, 8
	mov	 %l5, %o3	 	!argument: store out param from reg 132to register outReg 4
	!CALL	hanoi
	call	 hanoi	
	nop
	!LOADI	1, 133
	set	 1, %l5	 	!int: reg 133 gets val 1
	!PRINTLN	133
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l5, %o1
	call	printf, 0
	nop
	!MOV	16, 134
	mov	 %l7, %l5	 
	!STOREOUTARGUMENT	134, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 134to register outReg 1
	!CALL	printPeg
	call	 printPeg	
	nop
	!LOADI	2, 135
	set	 2, %l5	 	!int: reg 135 gets val 2
	!PRINTLN	135
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l5, %o1
	call	printf, 0
	nop
	!MOV	17, 136
	mov	 %l1, %l5	 
	!STOREOUTARGUMENT	136, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 136to register outReg 1
	!CALL	printPeg
	call	 printPeg	
	nop
	!LOADI	3, 137
	set	 3, %l5	 	!int: reg 137 gets val 3
	!PRINTLN	137
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l5, %o1
	call	printf, 0
	nop
	!MOV	18, 138
	mov	 %l4, %l5	 
	!STOREOUTARGUMENT	138, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 138to register outReg 1
	!CALL	printPeg
	call	 printPeg	
	nop
	!MOV	19, 139
	mov	 %l2, %l5	 
	!PRINTLN	139
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l5, %o1
	call	printf, 0
	nop
 !#while-guard:
.S24:
	!MOV	0, 142
	mov	 %g0, %l1	 	!null: reg 142 gets false
	!MOV	18, 141
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 140
	mov	 %g0, %l3	 
	!COMP	141, 142, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 140
	movne	 %icc, %g1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	140, 3, 2
	cmp	 %l3, %g1	 	!while: compare guard result (reg 140) to true
	!CBREQ	2, .S25, .S26
	be	 .S25	 	!while: branch true: '.S25' false: '.S26'
	nop
	ba	.S26 	!while: branch true: '.S25' false: '.S26'
	nop
 .S25:
	!MOV	18, 143
	mov	 %l4, %l1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	143, 93
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	18, 145
	mov	 %l4, %l1	 
	!LOADAI	145, 4, 145
	ld	[%l1 + 4], %l1
	!MOV	145, 18
	mov	 %l1, %l4	 
	!JUMPI	.S24
	ba	 .S24	 	!while: jump back to guard
	nop
 .S26:
	!JUMPI	.S20
	ba	 .S20	 	!then: jump to #end-if '.S20'
	nop
 .S20:
.S19:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	printPeg
	.type	printPeg, #function
	.proc	04
!#function-entry:
printPeg:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 81
	mov	 %i0, %l1	 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 82
	mov	 %o0, %l3	 
	!STOREAI	0, 82, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 82, 4
	st	%g0, [%l3 + 4]
	!MOV	81, 83
	mov	 %l1, %l1	 
	!MOV	83, 82
	mov	 %l1, %l3	 
 !#while-guard:
.S15:
	!MOV	0, 87
	mov	 %g0, %l1	 	!null: reg 87 gets false
	!MOV	82, 86
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 85
	mov	 %g0, %l4	 
	!COMP	86, 87, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 85
	movne	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	85, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 85) to true
	!CBREQ	2, .S16, .S17
	be	 .S16	 	!while: branch true: '.S16' false: '.S17'
	nop
	ba	.S17 	!while: branch true: '.S16' false: '.S17'
	nop
 .S16:
	!MOV	82, 88
	mov	 %l3, %l1	 
	!LOADAI	88, 0, 88
	ld	[%l1 + 0], %l1
	!PRINTLN	88
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	82, 89
	mov	 %l3, %l1	 
	!LOADAI	89, 4, 89
	ld	[%l1 + 4], %l1
	!MOV	89, 82
	mov	 %l1, %l3	 
	!JUMPI	.S15
	ba	 .S15	 	!while: jump back to guard
	nop
 .S17:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	hanoi
	.type	hanoi, #function
	.proc	04
!#function-entry:
hanoi:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 66
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 67
	mov	 %i1, %l4	 
	!STOREINARGUMENT	12, 68
	mov	 %i2, %l3	 
	!STOREINARGUMENT	13, 69
	mov	 %i3, %l2	 
 !#function-body:
 !#if-guard:
	!LOADI	1, 72
	set	 1, %l5	 	!int: reg 72 gets val 1
	!MOV	66, 71
	mov	 %l1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 70
	mov	 %g0, %l0	 
	!COMP	71, 72, 2
	cmp	 %l6, %l5	 
	!MOVEQ	2, 3, 70
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	70, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 70) to true
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!MOV	67, 73
	mov	 %l4, %l0	 
	!STOREOUTARGUMENT	73, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 73to register outReg 1
	!MOV	68, 73
	mov	 %l3, %l0	 
	!STOREOUTARGUMENT	73, 6
	mov	 %l0, %o1	 	!argument: store out param from reg 73to register outReg 2
	!CALL	move
	call	 move	
	nop
	!JUMPI	.S14
	ba	 .S14	 	!then: jump to #end-if '.S14'
	nop
 .S14:
 .S13:
	!LOADI	1, 76
	set	 1, %l0	 	!int: reg 76 gets val 1
	!MOV	66, 75
	mov	 %l1, %l5	 
	!SUB	75, 76, 74
	sub	 %l5, %l0, %l0	 
	!STOREOUTARGUMENT	74, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 74to register outReg 1
	!MOV	67, 74
	mov	 %l4, %l0	 
	!STOREOUTARGUMENT	74, 6
	mov	 %l0, %o1	 	!argument: store out param from reg 74to register outReg 2
	!MOV	69, 74
	mov	 %l2, %l0	 
	!STOREOUTARGUMENT	74, 7
	mov	 %l0, %o2	 	!argument: store out param from reg 74to register outReg 3
	!MOV	68, 74
	mov	 %l3, %l0	 
	!STOREOUTARGUMENT	74, 8
	mov	 %l0, %o3	 	!argument: store out param from reg 74to register outReg 4
	!CALL	hanoi
	call	 hanoi	
	nop
	!MOV	67, 77
	mov	 %l4, %l0	 
	!STOREOUTARGUMENT	77, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 77to register outReg 1
	!MOV	68, 77
	mov	 %l3, %l0	 
	!STOREOUTARGUMENT	77, 6
	mov	 %l0, %o1	 	!argument: store out param from reg 77to register outReg 2
	!CALL	move
	call	 move	
	nop
	!LOADI	1, 80
	set	 1, %l0	 	!int: reg 80 gets val 1
	!MOV	66, 79
	mov	 %l1, %l1	 
	!SUB	79, 80, 78
	sub	 %l1, %l0, %l0	 
	!STOREOUTARGUMENT	78, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 78to register outReg 1
	!MOV	69, 78
	mov	 %l2, %l0	 
	!STOREOUTARGUMENT	78, 6
	mov	 %l0, %o1	 	!argument: store out param from reg 78to register outReg 2
	!MOV	68, 78
	mov	 %l3, %l0	 
	!STOREOUTARGUMENT	78, 7
	mov	 %l0, %o2	 	!argument: store out param from reg 78to register outReg 3
	!MOV	67, 78
	mov	 %l4, %l0	 
	!STOREOUTARGUMENT	78, 8
	mov	 %l0, %o3	 	!argument: store out param from reg 78to register outReg 4
	!CALL	hanoi
	call	 hanoi	
	nop
	!JUMPI	.S14
	ba	 .S14	 	!if: jump to #end-if '.S14'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	move
	.type	move, #function
	.proc	04
!#function-entry:
move:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 20
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 21
	mov	 %i1, %l2	 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	1, 22
	mov	 %o0, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!STOREAI	0, 22, 0
	st	%g0, [%l0 + 0]
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!STOREAI	0, 22, 4
	st	%g0, [%l0 + 4]
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
 !#if-guard:
	!LOADI	1, 25
	set	 1, %l3	 	!int: reg 25 gets val 1
	!MOV	20, 24
	mov	 %l1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	0, 23
	mov	 %g0, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!COMP	24, 25, 2
	cmp	 %l7, %l3	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOVEQ	2, 3, 23
	move	 %icc, %g1, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!LOADI	1, 3
	set	 1, %g1	 
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!COMP	23, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 23) to true
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	16, 26
	mov	 %l6, %l1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	26, 22
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	16, 28
	mov	 %l6, %l1	 
	!LOADAI	28, 4, 28
	ld	[%l1 + 4], %l1
	!MOV	28, 16
	mov	 %l1, %l6	 
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 !#if-guard:
	!LOADI	1, 43
	set	 1, %l1	 	!int: reg 43 gets val 1
	!MOV	21, 42
	mov	 %l2, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 41
	mov	 %g0, %l7	 
	!COMP	42, 43, 2
	cmp	 %l3, %l1	 
	!MOVEQ	2, 3, 41
	move	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	41, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 41) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	16, 44
	mov	 %l6, %l0	 
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	22, 45
	mov	 %l0, %l1	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREAI	44, 45, 4
	st	%l0, [%l1 + 4]
	!STOREAI	999, 999, 40
	st	%l1, [%sp + 40]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l1
	!MOV	22, 47
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 144
	st	%l1, [%sp + 144]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l1
	!MOV	47, 16
	mov	 %l0, %l6	 
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
	!LOADI	1, 64
	set	 1, %l1	 	!int: reg 64 gets val 1
	!MOV	19, 63
	mov	 %g3, %l0	 
	!ADD	63, 64, 62
	add	 %l0, %l1, %l0	 
	!MOV	62, 19
	mov	 %l0, %g3	 
 .S7:
 !#if-guard:
	!LOADI	2, 51
	set	 2, %l1	 	!int: reg 51 gets val 2
	!MOV	21, 50
	mov	 %l2, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 49
	mov	 %g0, %l0	 
	!COMP	50, 51, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 49
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	49, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 49) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!MOV	17, 52
	mov	 %l5, %l0	 
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	22, 53
	mov	 %l0, %l1	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREAI	52, 53, 4
	st	%l0, [%l1 + 4]
	!STOREAI	999, 999, 40
	st	%l1, [%sp + 40]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l1
	!MOV	22, 55
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 144
	st	%l1, [%sp + 144]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l1
	!MOV	55, 17
	mov	 %l0, %l5	 
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
	!JUMPI	.S8
	ba	 .S8	 	!if: jump to #end-if '.S8'
	nop
 .S10:
	!MOV	18, 57
	mov	 %l4, %l0	 
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	22, 58
	mov	 %l0, %l1	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREAI	57, 58, 4
	st	%l0, [%l1 + 4]
	!STOREAI	999, 999, 40
	st	%l1, [%sp + 40]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l1
	!MOV	22, 60
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 144
	st	%l1, [%sp + 144]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l1
	!MOV	60, 18
	mov	 %l0, %l4	 
	!JUMPI	.S11
	ba	 .S11	 	!if: jump to #end-if '.S11'
	nop
 .S1:
 !#if-guard:
	!LOADI	2, 32
	set	 2, %l3	 	!int: reg 32 gets val 2
	!MOV	20, 31
	mov	 %l1, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 30
	mov	 %g0, %l7	 
	!COMP	31, 32, 2
	cmp	 %l1, %l3	 
	!MOVEQ	2, 3, 30
	move	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	30, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 30) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	17, 33
	mov	 %l5, %l1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	33, 22
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	17, 35
	mov	 %l5, %l1	 
	!LOADAI	35, 4, 35
	ld	[%l1 + 4], %l1
	!MOV	35, 17
	mov	 %l1, %l5	 
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
	!JUMPI	.S2
	ba	 .S2	 	!if: jump to #end-if '.S2'
	nop
 .S4:
	!MOV	18, 37
	mov	 %l4, %l1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	37, 22
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	18, 39
	mov	 %l4, %l1	 
	!LOADAI	39, 4, 39
	ld	[%l1 + 4], %l1
	!MOV	39, 18
	mov	 %l1, %l4	 
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 !#function-exit:
 