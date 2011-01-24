	.file	"killerBubbles.ev"
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
	!LOADI	666, 98
	set	 666, %l4	 	!int: reg 98 gets val 666
	!MOV	16, 99
	mov	 %l3, %l3	 	!lvalue id: move reg 16 (var swapped) to reg 99
	!MOV	98, 99
	mov	 %l4, %l3	 
	!MOV	99, 16
	mov	 %l3, %l3	 
	!MOV	93, 101
	mov	 %l6, %l3	 	!lvalue id: move reg 93 (var numNodes) to reg 101
	!READ	101
	add	%sp, %g0, %l3
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l3

	!MOV	101, 93
	mov	 %l3, %l6	 
 !#if-guard:
	!LOADI	0, 105
	set	 0, %l3	 	!int: reg 105 gets val 0
	!MOV	93, 104
	mov	 %l6, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	0, 103
	mov	 %g0, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!COMP	104, 105, 2
	cmp	 %l4, %l3	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOVLE	2, 3, 103
	movle	 %icc, %g1, %l0	 
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
	!COMP	103, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 103) to true
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!LOADI	1, 107
	set	 1, %l3	 	!int: reg 107 gets val 1
	!LOADI	-1, 108
	mov	 -1, %l4	 
	!MULT	107, 108, 106
	smul	 %l3, %l4, %l3	 
	!PRINTLN	106
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
	!LOADI	1, 109
	set	 1, %l3	 	!int: reg 109 gets val 1
	!LOADI	-1, 110
	mov	 -1, %l4	 
	!MULT	109, 110, 4
	smul	 %l3, %l4, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S14
	ba	 .S14	 	!then: jump to #end-if '.S14'
	nop
 .S14:
.S13:
	!LOADI	1000, 114
	set	 1000, %l3	 	!int: reg 114 gets val 1000
	!MOV	93, 113
	mov	 %l6, %l4	 
	!MULT	113, 114, 111
	smul	 %l4, %l3, %l3	 
	!MOV	93, 112
	mov	 %l6, %l4	 	!lvalue id: move reg 93 (var numNodes) to reg 112
	!MOV	111, 112
	mov	 %l3, %l4	 
	!MOV	112, 93
	mov	 %l4, %l6	 
	!MOV	93, 116
	mov	 %l6, %l3	 
	!MOV	94, 117
	mov	 %l7, %l4	 	!lvalue id: move reg 94 (var counter) to reg 117
	!MOV	116, 117
	mov	 %l3, %l4	 
	!MOV	117, 94
	mov	 %l4, %l7	 
	!LOADI	12, 1
	set	 12, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 119
	mov	 %o0, %l3	 
	!MOV	96, 120
	mov	 %l1, %l1	 	!lvalue id: move reg 96 (var head) to reg 120
	!MOV	119, 120
	mov	 %l3, %l1	 
	!MOV	120, 96
	mov	 %l1, %l1	 
	!MOV	94, 122
	mov	 %l7, %l3	 
	!MOV	96, 124
	mov	 %l1, %l4	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	124, 3, 123
	ld	[%l4 + %g1], %l6
	!MOV	122, 123
	mov	 %l3, %l6	 
	!STOREAI	123, 124, 3
	st	%l6, [%l4 + %g1]
	!MOV	96, 126
	mov	 %l1, %l3	 
	!MOV	96, 128
	mov	 %l1, %l4	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	128, 3, 127
	ld	[%l4 + %g1], %l6
	!MOV	126, 127
	mov	 %l3, %l6	 
	!STOREAI	127, 128, 3
	st	%l6, [%l4 + %g1]
	!MOV	96, 130
	mov	 %l1, %l3	 
	!MOV	96, 132
	mov	 %l1, %l4	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	132, 3, 131
	ld	[%l4 + %g1], %l6
	!MOV	130, 131
	mov	 %l3, %l6	 
	!STOREAI	131, 132, 3
	st	%l6, [%l4 + %g1]
	!LOADI	1, 137
	set	 1, %l3	 	!int: reg 137 gets val 1
	!MOV	94, 136
	mov	 %l7, %l4	 
	!SUB	136, 137, 134
	sub	 %l4, %l3, %l3	 
	!MOV	94, 135
	mov	 %l7, %l4	 	!lvalue id: move reg 94 (var counter) to reg 135
	!MOV	134, 135
	mov	 %l3, %l4	 
	!MOV	135, 94
	mov	 %l4, %l7	 
	!MOV	96, 139
	mov	 %l1, %l3	 
	!MOV	97, 140
	mov	 %l5, %l4	 	!lvalue id: move reg 97 (var previous) to reg 140
	!MOV	139, 140
	mov	 %l3, %l4	 
	!MOV	140, 97
	mov	 %l4, %l5	 
 !#while-guard:
.S15:
	!LOADI	0, 144
	set	 0, %l3	 	!int: reg 144 gets val 0
	!MOV	94, 143
	mov	 %l7, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 142
	mov	 %g0, %l6	 
	!COMP	143, 144, 2
	cmp	 %l4, %l3	 
	!MOVGT	2, 3, 142
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	142, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 142) to true
	!CBREQ	2, .S16, .S17
	be	 .S16	 	!while: branch true: '.S16' false: '.S17'
	nop
	ba	.S17 	!while: branch true: '.S16' false: '.S17'
	nop
 .S16:
	!LOADI	12, 1
	set	 12, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 145
	mov	 %o0, %l3	 
	!MOV	95, 146
	mov	 %l2, %l2	 	!lvalue id: move reg 95 (var currNode) to reg 146
	!MOV	145, 146
	mov	 %l3, %l2	 
	!MOV	146, 95
	mov	 %l2, %l2	 
	!MOV	94, 148
	mov	 %l7, %l3	 
	!MOV	95, 150
	mov	 %l2, %l4	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	150, 3, 149
	ld	[%l4 + %g1], %l6
	!MOV	148, 149
	mov	 %l3, %l6	 
	!STOREAI	149, 150, 3
	st	%l6, [%l4 + %g1]
	!MOV	97, 152
	mov	 %l5, %l3	 
	!MOV	95, 154
	mov	 %l2, %l4	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	154, 3, 153
	ld	[%l4 + %g1], %l6
	!MOV	152, 153
	mov	 %l3, %l6	 
	!STOREAI	153, 154, 3
	st	%l6, [%l4 + %g1]
	!MOV	96, 156
	mov	 %l1, %l3	 
	!MOV	95, 158
	mov	 %l2, %l4	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	158, 3, 157
	ld	[%l4 + %g1], %l6
	!MOV	156, 157
	mov	 %l3, %l6	 
	!STOREAI	157, 158, 3
	st	%l6, [%l4 + %g1]
	!MOV	95, 160
	mov	 %l2, %l3	 
	!MOV	97, 162
	mov	 %l5, %l4	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	162, 3, 161
	ld	[%l4 + %g1], %l6
	!MOV	160, 161
	mov	 %l3, %l6	 
	!STOREAI	161, 162, 3
	st	%l6, [%l4 + %g1]
	!MOV	95, 164
	mov	 %l2, %l3	 
	!MOV	97, 165
	mov	 %l5, %l4	 	!lvalue id: move reg 97 (var previous) to reg 165
	!MOV	164, 165
	mov	 %l3, %l4	 
	!MOV	165, 97
	mov	 %l4, %l5	 
	!LOADI	1, 170
	set	 1, %l3	 	!int: reg 170 gets val 1
	!MOV	94, 169
	mov	 %l7, %l4	 
	!SUB	169, 170, 167
	sub	 %l4, %l3, %l3	 
	!MOV	94, 168
	mov	 %l7, %l4	 	!lvalue id: move reg 94 (var counter) to reg 168
	!MOV	167, 168
	mov	 %l3, %l4	 
	!MOV	168, 94
	mov	 %l4, %l7	 
	!JUMPI	.S15
	ba	 .S15	 	!while: jump back to guard
	nop
 .S17:
	!MOV	96, 172
	mov	 %l1, %l0	 
	!STOREOUTARGUMENT	172, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 172to register outReg 1
	!CALL	deathSort
	call	 deathSort	
	nop
	!MOV	96, 173
	mov	 %l1, %l0	 
	!STOREOUTARGUMENT	173, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 173to register outReg 1
	!CALL	printEVILList
	call	 printEVILList	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	printEVILList
	.type	printEVILList, #function
	.proc	04
!#function-entry:
printEVILList:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 70
	mov	 %i0, %l2	 
 !#function-body:
	!MOV	70, 75
	mov	 %l2, %l3	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	75, 3, 73
	ld	[%l3 + %g1], %l3
	!MOV	71, 74
	mov	 %l5, %l4	 	!lvalue id: move reg 71 (var currNode) to reg 74
	!MOV	73, 74
	mov	 %l3, %l4	 
	!MOV	74, 71
	mov	 %l4, %l5	 
	!MOV	70, 78
	mov	 %l2, %l3	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	78, 3, 77
	ld	[%l3 + %g1], %l3
	!PRINTLN	77
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
	!MOV	70, 79
	mov	 %l2, %l3	 
	!DEL	79
	call	free, 0
	nop 
 !#while-guard:
.S9:
	!MOV	70, 82
	mov	 %l2, %l3	 
	!MOV	71, 81
	mov	 %l5, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 80
	mov	 %g0, %l6	 
	!COMP	81, 82, 2
	cmp	 %l4, %l3	 
	!MOVNE	2, 3, 80
	movne	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	80, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 80) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!MOV	71, 83
	mov	 %l5, %l3	 
	!MOV	72, 84
	mov	 %l1, %l1	 	!lvalue id: move reg 72 (var toFree) to reg 84
	!MOV	83, 84
	mov	 %l3, %l1	 
	!MOV	84, 72
	mov	 %l1, %l1	 
	!MOV	71, 87
	mov	 %l5, %l3	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	87, 3, 86
	ld	[%l3 + %g1], %l3
	!PRINTLN	86
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
	!MOV	71, 90
	mov	 %l5, %l3	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	90, 3, 88
	ld	[%l3 + %g1], %l3
	!MOV	71, 89
	mov	 %l5, %l4	 	!lvalue id: move reg 71 (var currNode) to reg 89
	!MOV	88, 89
	mov	 %l3, %l4	 
	!MOV	89, 71
	mov	 %l4, %l5	 
	!MOV	72, 92
	mov	 %l1, %l3	 
	!DEL	92
	call	free, 0
	nop 
	!JUMPI	.S9
	ba	 .S9	 	!while: jump back to guard
	nop
 .S11:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	deathSort
	.type	deathSort, #function
	.proc	04
!#function-entry:
deathSort:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 23
	mov	 %i0, %l1	 
 !#function-body:
	!LOADI	1, 27
	set	 1, %l2	 	!int: reg 27 gets val 1
	!MOV	24, 28
	mov	 %l5, %l4	 	!lvalue id: move reg 24 (var swapped) to reg 28
	!MOV	27, 28
	mov	 %l2, %l4	 
	!MOV	28, 24
	mov	 %l4, %l5	 
 !#while-guard:
.S0:
	!LOADI	1, 32
	set	 1, %l2	 	!int: reg 32 gets val 1
	!MOV	24, 31
	mov	 %l5, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 30
	mov	 %g0, %l6	 
	!COMP	31, 32, 2
	cmp	 %l4, %l2	 
	!MOVEQ	2, 3, 30
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	30, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 30) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!LOADI	0, 33
	set	 0, %l2	 	!int: reg 33 gets val 0
	!MOV	24, 34
	mov	 %l5, %l4	 	!lvalue id: move reg 24 (var swapped) to reg 34
	!MOV	33, 34
	mov	 %l2, %l4	 
	!MOV	34, 24
	mov	 %l4, %l5	 
	!MOV	23, 36
	mov	 %l1, %l2	 
	!MOV	26, 37
	mov	 %l3, %l3	 	!lvalue id: move reg 26 (var currNode) to reg 37
	!MOV	36, 37
	mov	 %l2, %l3	 
	!MOV	37, 26
	mov	 %l3, %l3	 
 !#while-guard:
.S3:
	!MOV	23, 41
	mov	 %l1, %l2	 
	!MOV	26, 42
	mov	 %l3, %l4	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	42, 3, 40
	ld	[%l4 + %g1], %l4
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 39
	mov	 %g0, %l6	 
	!COMP	40, 41, 2
	cmp	 %l4, %l2	 
	!MOVNE	2, 3, 39
	movne	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	39, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 39) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
 !#if-guard:
	!LOADI	0, 45
	set	 0, %l1	 	!int: reg 45 gets val 0
	!MOV	26, 46
	mov	 %l3, %l2	 
	!STOREOUTARGUMENT	46, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 46to register outReg 1
	!MOV	26, 47
	mov	 %l3, %l2	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	47, 3, 46
	ld	[%l2 + %g1], %l2
	!STOREOUTARGUMENT	46, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 46to register outReg 2
	!CALL	compare
	call	 compare	
	nop
	!MOV	1, 44
	mov	 %o0, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 43
	mov	 %g0, %l4	 
	!COMP	44, 45, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 43
	movg	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	43, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 43) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	26, 50
	mov	 %l3, %l1	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	50, 3, 48
	ld	[%l1 + %g1], %l1
	!MOV	25, 49
	mov	 %l0, %l0	 	!lvalue id: move reg 25 (var swap) to reg 49
	!MOV	48, 49
	mov	 %l1, %l0	 
	!MOV	49, 25
	mov	 %l0, %l0	 
	!MOV	26, 55
	mov	 %l3, %l1	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	55, 3, 54
	ld	[%l1 + %g1], %l1
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	54, 3, 52
	ld	[%l1 + %g1], %l1
	!MOV	26, 56
	mov	 %l3, %l2	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	56, 3, 53
	ld	[%l2 + %g1], %l4
	!MOV	52, 53
	mov	 %l1, %l4	 
	!STOREAI	53, 56, 3
	st	%l4, [%l2 + %g1]
	!MOV	25, 58
	mov	 %l0, %l0	 
	!MOV	26, 61
	mov	 %l3, %l1	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	61, 3, 60
	ld	[%l1 + %g1], %l1
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	60, 3, 59
	ld	[%l1 + %g1], %l2
	!MOV	58, 59
	mov	 %l0, %l2	 
	!STOREAI	59, 60, 3
	st	%l2, [%l1 + %g1]
	!LOADI	1, 63
	set	 1, %l0	 	!int: reg 63 gets val 1
	!MOV	24, 64
	mov	 %l5, %l1	 	!lvalue id: move reg 24 (var swapped) to reg 64
	!MOV	63, 64
	mov	 %l0, %l1	 
	!MOV	64, 24
	mov	 %l1, %l5	 
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!MOV	26, 68
	mov	 %l3, %l0	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	68, 3, 66
	ld	[%l0 + %g1], %l1
	!MOV	26, 67
	mov	 %l3, %l0	 	!lvalue id: move reg 26 (var currNode) to reg 67
	!MOV	66, 67
	mov	 %l1, %l0	 
	!MOV	67, 26
	mov	 %l0, %l3	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	compare
	.type	compare, #function
	.proc	04
!#function-entry:
compare:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 17
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 18
	mov	 %i1, %l0	 
 !#function-body:
	!MOV	18, 22
	mov	 %l0, %l0	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	22, 3, 20
	ld	[%l0 + %g1], %l1
	!MOV	17, 21
	mov	 %l2, %l0	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	21, 3, 19
	ld	[%l0 + %g1], %l0
	!SUB	19, 20, 4
	sub	 %l0, %l1, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 