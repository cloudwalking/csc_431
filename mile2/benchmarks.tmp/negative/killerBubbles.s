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
	!LOADI	666, 102
	mov	 666, %l4	 	!int: reg 102 gets val 666
	!MOV	20, 103
	mov	 %l3, %l3	 	!lvalue id: move reg 20 (var swapped) to reg 103
	!MOV	102, 103
	mov	 %l4, %l3	 
	!MOV	103, 20
	mov	 %l3, %l3	 
	!MOV	97, 105
	mov	 %l6, %l3	 	!lvalue id: move reg 97 (var numNodes) to reg 105
	!READ	105
	add	%sp, %g0, %l3
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l3

	!MOV	105, 97
	mov	 %l3, %l6	 
 !#if-guard:
	!LOADI	0, 109
	mov	 0, %l3	 	!int: reg 109 gets val 0
	!MOV	97, 108
	mov	 %l6, %l4	 	!id: move reg 97 (var mainnumNodes) to reg 108
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 107
	mov	 %g0, %g2	 
	!COMP	108, 109, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 108 (var null) to 109 (var null), store in cc-reg
	!MOVLE	2, 3, 107
	movle	 %icc, %g1, %g2	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	107, 3, 2
	cmp	 %g2, %g1	 	!if: compare guard result (reg 107) to true
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!LOADI	1, 111
	mov	 1, %l3	 	!int: reg 111 gets val 1
	!LOADI	-1, 112
	mov	 -1, %l4	 
	!MULT	111, 112, 110
	smul	 %l3, %l4, %l3	 
	!PRINTLN	110
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
	!LOADI	1, 113
	mov	 1, %l3	 	!int: reg 113 gets val 1
	!LOADI	-1, 114
	mov	 -1, %l4	 
	!MULT	113, 114, 4
	smul	 %l3, %l4, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S14
	ba	 .S14	 	!then: jump to #end-if '.S14'
	nop
 .S14:
.S13:
	!LOADI	1000, 118
	mov	 1000, %l3	 	!int: reg 118 gets val 1000
	!MOV	97, 117
	mov	 %l6, %l4	 	!id: move reg 97 (var mainnumNodes) to reg 117
	!MULT	117, 118, 115
	smul	 %l4, %l3, %l3	 	!expression: reg 117 (var null) * 118 in reg 115 (var null)
	!MOV	97, 116
	mov	 %l6, %l4	 	!lvalue id: move reg 97 (var numNodes) to reg 116
	!MOV	115, 116
	mov	 %l3, %l4	 
	!MOV	116, 97
	mov	 %l4, %l6	 
	!MOV	97, 120
	mov	 %l6, %l3	 	!id: move reg 97 (var mainnumNodes) to reg 120
	!MOV	98, 121
	mov	 %l7, %l4	 	!lvalue id: move reg 98 (var counter) to reg 121
	!MOV	120, 121
	mov	 %l3, %l4	 
	!MOV	121, 98
	mov	 %l4, %l7	 
	!LOADI	12, 1
	mov	 12, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 123
	mov	 %o0, %l3	 
	!MOV	100, 124
	mov	 %l1, %l1	 	!lvalue id: move reg 100 (var head) to reg 124
	!MOV	123, 124
	mov	 %l3, %l1	 
	!MOV	124, 100
	mov	 %l1, %l1	 
	!MOV	98, 126
	mov	 %l7, %l3	 	!id: move reg 98 (var maincounter) to reg 126
	!MOV	100, 128
	mov	 %l1, %l4	 
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	128, 3, 127
	ld	[%l4 + %g1], %l6
	!MOV	126, 127
	mov	 %l3, %l6	 
	!STOREAI	127, 128, 3
	st	%l6, [%l4 + %g1]
	!MOV	100, 130
	mov	 %l1, %l3	 	!id: move reg 100 (var mainhead) to reg 130
	!MOV	100, 132
	mov	 %l1, %l4	 
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	132, 3, 131
	ld	[%l4 + %g1], %l6
	!MOV	130, 131
	mov	 %l3, %l6	 
	!STOREAI	131, 132, 3
	st	%l6, [%l4 + %g1]
	!MOV	100, 134
	mov	 %l1, %l3	 	!id: move reg 100 (var mainhead) to reg 134
	!MOV	100, 136
	mov	 %l1, %l4	 
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	136, 3, 135
	ld	[%l4 + %g1], %l6
	!MOV	134, 135
	mov	 %l3, %l6	 
	!STOREAI	135, 136, 3
	st	%l6, [%l4 + %g1]
	!LOADI	1, 141
	mov	 1, %l3	 	!int: reg 141 gets val 1
	!MOV	98, 140
	mov	 %l7, %l4	 	!id: move reg 98 (var maincounter) to reg 140
	!SUB	140, 141, 138
	sub	 %l4, %l3, %l3	 	!expression: reg 140 (var null) - 141 in reg 138 (var null)
	!MOV	98, 139
	mov	 %l7, %l4	 	!lvalue id: move reg 98 (var counter) to reg 139
	!MOV	138, 139
	mov	 %l3, %l4	 
	!MOV	139, 98
	mov	 %l4, %l7	 
	!MOV	100, 143
	mov	 %l1, %l3	 	!id: move reg 100 (var mainhead) to reg 143
	!MOV	101, 144
	mov	 %l5, %l4	 	!lvalue id: move reg 101 (var previous) to reg 144
	!MOV	143, 144
	mov	 %l3, %l4	 
	!MOV	144, 101
	mov	 %l4, %l5	 
 !#while-guard:
.S15:
	!LOADI	0, 148
	mov	 0, %l3	 	!int: reg 148 gets val 0
	!MOV	98, 147
	mov	 %l7, %l4	 	!id: move reg 98 (var maincounter) to reg 147
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 146
	mov	 %g0, %l6	 
	!COMP	147, 148, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 147 (var null) to 148 (var null), store in cc-reg
	!MOVGT	2, 3, 146
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	146, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 146) to true
	!CBREQ	2, .S16, .S17
	be	 .S16	 	!while: branch true: '.S16' false: '.S17'
	nop
	ba	.S17 	!while: branch true: '.S16' false: '.S17'
	nop
 .S16:
	!LOADI	12, 1
	mov	 12, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 149
	mov	 %o0, %l3	 
	!MOV	99, 150
	mov	 %l2, %l2	 	!lvalue id: move reg 99 (var currNode) to reg 150
	!MOV	149, 150
	mov	 %l3, %l2	 
	!MOV	150, 99
	mov	 %l2, %l2	 
	!MOV	98, 152
	mov	 %l7, %l3	 	!id: move reg 98 (var maincounter) to reg 152
	!MOV	99, 154
	mov	 %l2, %l4	 
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	154, 3, 153
	ld	[%l4 + %g1], %l6
	!MOV	152, 153
	mov	 %l3, %l6	 
	!STOREAI	153, 154, 3
	st	%l6, [%l4 + %g1]
	!MOV	101, 156
	mov	 %l5, %l3	 	!id: move reg 101 (var mainprevious) to reg 156
	!MOV	99, 158
	mov	 %l2, %l4	 
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	158, 3, 157
	ld	[%l4 + %g1], %l6
	!MOV	156, 157
	mov	 %l3, %l6	 
	!STOREAI	157, 158, 3
	st	%l6, [%l4 + %g1]
	!MOV	100, 160
	mov	 %l1, %l3	 	!id: move reg 100 (var mainhead) to reg 160
	!MOV	99, 162
	mov	 %l2, %l4	 
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	162, 3, 161
	ld	[%l4 + %g1], %l6
	!MOV	160, 161
	mov	 %l3, %l6	 
	!STOREAI	161, 162, 3
	st	%l6, [%l4 + %g1]
	!MOV	99, 164
	mov	 %l2, %l3	 	!id: move reg 99 (var maincurrNode) to reg 164
	!MOV	101, 166
	mov	 %l5, %l4	 
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	166, 3, 165
	ld	[%l4 + %g1], %l6
	!MOV	164, 165
	mov	 %l3, %l6	 
	!STOREAI	165, 166, 3
	st	%l6, [%l4 + %g1]
	!MOV	99, 168
	mov	 %l2, %l3	 	!id: move reg 99 (var maincurrNode) to reg 168
	!MOV	101, 169
	mov	 %l5, %l4	 	!lvalue id: move reg 101 (var previous) to reg 169
	!MOV	168, 169
	mov	 %l3, %l4	 
	!MOV	169, 101
	mov	 %l4, %l5	 
	!LOADI	1, 174
	mov	 1, %l3	 	!int: reg 174 gets val 1
	!MOV	98, 173
	mov	 %l7, %l4	 	!id: move reg 98 (var maincounter) to reg 173
	!SUB	173, 174, 171
	sub	 %l4, %l3, %l3	 	!expression: reg 173 (var null) - 174 in reg 171 (var null)
	!MOV	98, 172
	mov	 %l7, %l4	 	!lvalue id: move reg 98 (var counter) to reg 172
	!MOV	171, 172
	mov	 %l3, %l4	 
	!MOV	172, 98
	mov	 %l4, %l7	 
	!JUMPI	.S15
	ba	 .S15	 	!while: jump back to guard
	nop
 .S17:
	!MOV	100, 176
	mov	 %l1, %l0	 	!id: move reg 100 (var mainhead) to reg 176
	!STOREOUTARGUMENT	176, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 176to register outReg 1
	!CALL	deathSort
	call	 deathSort	
	nop
	!MOV	100, 177
	mov	 %l1, %l0	 	!id: move reg 100 (var mainhead) to reg 177
	!STOREOUTARGUMENT	177, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 177to register outReg 1
	!CALL	printEVILList
	call	 printEVILList	
	nop
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
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
	!STOREINARGUMENT	10, 74
	mov	 %i0, %l2	 
 !#function-body:
	!MOV	74, 79
	mov	 %l2, %l3	 	!id: move reg 74 (var printEVILListhead) to reg 79
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	79, 3, 77
	ld	[%l3 + %g1], %l3
	!MOV	75, 78
	mov	 %l5, %l4	 	!lvalue id: move reg 75 (var currNode) to reg 78
	!MOV	77, 78
	mov	 %l3, %l4	 
	!MOV	78, 75
	mov	 %l4, %l5	 
	!MOV	74, 82
	mov	 %l2, %l3	 	!id: move reg 74 (var printEVILListhead) to reg 82
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	82, 3, 81
	ld	[%l3 + %g1], %l3
	!PRINTLN	81
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
	!MOV	74, 83
	mov	 %l2, %l3	 	!id: move reg 74 (var printEVILListhead) to reg 83
	!DEL	83
	call	free, 0
	nop 
 !#while-guard:
.S9:
	!MOV	74, 86
	mov	 %l2, %l3	 	!id: move reg 74 (var printEVILListhead) to reg 86
	!MOV	75, 85
	mov	 %l5, %l4	 	!id: move reg 75 (var printEVILListcurrNode) to reg 85
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 84
	mov	 %g0, %l6	 
	!COMP	85, 86, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 85 (var null) to 86 (var null), store in cc-reg
	!MOVNE	2, 3, 84
	movne	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	84, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 84) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!MOV	75, 87
	mov	 %l5, %l3	 	!id: move reg 75 (var printEVILListcurrNode) to reg 87
	!MOV	76, 88
	mov	 %l1, %l1	 	!lvalue id: move reg 76 (var toFree) to reg 88
	!MOV	87, 88
	mov	 %l3, %l1	 
	!MOV	88, 76
	mov	 %l1, %l1	 
	!MOV	75, 91
	mov	 %l5, %l3	 	!id: move reg 75 (var printEVILListcurrNode) to reg 91
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	91, 3, 90
	ld	[%l3 + %g1], %l3
	!PRINTLN	90
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
	!MOV	75, 94
	mov	 %l5, %l3	 	!id: move reg 75 (var printEVILListcurrNode) to reg 94
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	94, 3, 92
	ld	[%l3 + %g1], %l3
	!MOV	75, 93
	mov	 %l5, %l4	 	!lvalue id: move reg 75 (var currNode) to reg 93
	!MOV	92, 93
	mov	 %l3, %l4	 
	!MOV	93, 75
	mov	 %l4, %l5	 
	!MOV	76, 96
	mov	 %l1, %l3	 	!id: move reg 76 (var printEVILListtoFree) to reg 96
	!DEL	96
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
	!STOREINARGUMENT	10, 27
	mov	 %i0, %l1	 
 !#function-body:
	!LOADI	1, 31
	mov	 1, %l2	 	!int: reg 31 gets val 1
	!MOV	28, 32
	mov	 %l5, %l4	 	!lvalue id: move reg 28 (var swapped) to reg 32
	!MOV	31, 32
	mov	 %l2, %l4	 
	!MOV	32, 28
	mov	 %l4, %l5	 
 !#while-guard:
.S0:
	!LOADI	1, 36
	mov	 1, %l2	 	!int: reg 36 gets val 1
	!MOV	28, 35
	mov	 %l5, %l4	 	!id: move reg 28 (var deathSortswapped) to reg 35
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 34
	mov	 %g0, %l6	 
	!COMP	35, 36, 2
	cmp	 %l4, %l2	 	!expression: compare: reg 35 (var null) to 36 (var null), store in cc-reg
	!MOVEQ	2, 3, 34
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	34, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 34) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!LOADI	0, 37
	mov	 0, %l2	 	!int: reg 37 gets val 0
	!MOV	28, 38
	mov	 %l5, %l4	 	!lvalue id: move reg 28 (var swapped) to reg 38
	!MOV	37, 38
	mov	 %l2, %l4	 
	!MOV	38, 28
	mov	 %l4, %l5	 
	!MOV	27, 40
	mov	 %l1, %l2	 	!id: move reg 27 (var deathSorthead) to reg 40
	!MOV	30, 41
	mov	 %l3, %l3	 	!lvalue id: move reg 30 (var currNode) to reg 41
	!MOV	40, 41
	mov	 %l2, %l3	 
	!MOV	41, 30
	mov	 %l3, %l3	 
 !#while-guard:
.S3:
	!MOV	27, 45
	mov	 %l1, %l2	 	!id: move reg 27 (var deathSorthead) to reg 45
	!MOV	30, 46
	mov	 %l3, %l4	 	!id: move reg 30 (var deathSortcurrNode) to reg 46
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	46, 3, 44
	ld	[%l4 + %g1], %l4
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 43
	mov	 %g0, %l6	 
	!COMP	44, 45, 2
	cmp	 %l4, %l2	 	!expression: compare: reg 44 (var null) to 45 (var null), store in cc-reg
	!MOVNE	2, 3, 43
	movne	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	43, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 43) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
 !#if-guard:
	!LOADI	0, 49
	mov	 0, %l1	 	!int: reg 49 gets val 0
	!MOV	30, 50
	mov	 %l3, %l2	 	!id: move reg 30 (var deathSortcurrNode) to reg 50
	!STOREOUTARGUMENT	50, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 50to register outReg 1
	!MOV	30, 51
	mov	 %l3, %l2	 	!id: move reg 30 (var deathSortcurrNode) to reg 51
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	51, 3, 50
	ld	[%l2 + %g1], %l2
	!STOREOUTARGUMENT	50, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 50to register outReg 2
	!CALL	compare
	call	 compare	
	nop
	!MOV	1, 48
	mov	 %o0, %l2	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 47
	mov	 %g0, %l4	 
	!COMP	48, 49, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 48 (var null) to 49 (var null), store in cc-reg
	!MOVGT	2, 3, 47
	movg	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	47, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 47) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	30, 54
	mov	 %l3, %l1	 	!id: move reg 30 (var deathSortcurrNode) to reg 54
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	54, 3, 52
	ld	[%l1 + %g1], %l1
	!MOV	29, 53
	mov	 %l0, %l0	 	!lvalue id: move reg 29 (var swap) to reg 53
	!MOV	52, 53
	mov	 %l1, %l0	 
	!MOV	53, 29
	mov	 %l0, %l0	 
	!MOV	30, 59
	mov	 %l3, %l1	 	!id: move reg 30 (var deathSortcurrNode) to reg 59
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	59, 3, 58
	ld	[%l1 + %g1], %l1
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	58, 3, 56
	ld	[%l1 + %g1], %l1
	!MOV	30, 60
	mov	 %l3, %l2	 
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	60, 3, 57
	ld	[%l2 + %g1], %l4
	!MOV	56, 57
	mov	 %l1, %l4	 
	!STOREAI	57, 60, 3
	st	%l4, [%l2 + %g1]
	!MOV	29, 62
	mov	 %l0, %l0	 	!id: move reg 29 (var deathSortswap) to reg 62
	!MOV	30, 65
	mov	 %l3, %l1	 
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	65, 3, 64
	ld	[%l1 + %g1], %l1
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	64, 3, 63
	ld	[%l1 + %g1], %l2
	!MOV	62, 63
	mov	 %l0, %l2	 
	!STOREAI	63, 64, 3
	st	%l2, [%l1 + %g1]
	!LOADI	1, 67
	mov	 1, %l0	 	!int: reg 67 gets val 1
	!MOV	28, 68
	mov	 %l5, %l1	 	!lvalue id: move reg 28 (var swapped) to reg 68
	!MOV	67, 68
	mov	 %l0, %l1	 
	!MOV	68, 28
	mov	 %l1, %l5	 
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!MOV	30, 72
	mov	 %l3, %l0	 	!id: move reg 30 (var deathSortcurrNode) to reg 72
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	72, 3, 70
	ld	[%l0 + %g1], %l1
	!MOV	30, 71
	mov	 %l3, %l0	 	!lvalue id: move reg 30 (var currNode) to reg 71
	!MOV	70, 71
	mov	 %l1, %l0	 
	!MOV	71, 30
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
	!STOREINARGUMENT	10, 21
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 22
	mov	 %i1, %l0	 
 !#function-body:
	!MOV	22, 26
	mov	 %l0, %l0	 	!id: move reg 22 (var compareb) to reg 26
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	26, 3, 24
	ld	[%l0 + %g1], %l1
	!MOV	21, 25
	mov	 %l2, %l0	 	!id: move reg 21 (var comparea) to reg 25
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	25, 3, 23
	ld	[%l0 + %g1], %l0
	!SUB	23, 24, 4
	sub	 %l0, %l1, %i0	 	!expression: reg 23 (var null) - 24 in reg 4 (var null)
	!RET	
	ret
	restore
 !#function-exit:
 