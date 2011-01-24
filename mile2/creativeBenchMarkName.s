	.file	"creativeBenchMarkName.ev"
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
	!MOV	1, 131
	mov	 %o0, %l4	 
	!STOREAI	0, 131, 0
	st	%g0, [%l4 + 0]
	!STOREAI	0, 131, 4
	st	%g0, [%l4 + 4]
	!LOADI	0, 137
	set	 0, %l1	 	!int: reg 137 gets val 0
	!MOV	137, 136
	mov	 %l1, %l5	 
	!LOADI	0, 139
	set	 0, %l1	 	!int: reg 139 gets val 0
	!MOV	139, 135
	mov	 %l1, %l6	 
	!CALL	buildList
	call	 buildList	
	nop
	!MOV	1, 141
	mov	 %o0, %l1	 
	!MOV	141, 131
	mov	 %l1, %l4	 
	!MOV	131, 145
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	145, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 145to register outReg 1
	!CALL	multiple
	call	 multiple	
	nop
	!MOV	1, 144
	mov	 %o0, %l1	 
	!MOV	144, 132
	mov	 %l1, %l1	 
	!MOV	131, 148
	mov	 %l4, %l2	 
	!STOREOUTARGUMENT	148, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 148to register outReg 1
	!CALL	add
	call	 add	
	nop
	!MOV	1, 147
	mov	 %o0, %l2	 
	!MOV	147, 133
	mov	 %l2, %l2	 
	!LOADI	2, 154
	set	 2, %l3	 	!int: reg 154 gets val 2
	!MOV	133, 153
	mov	 %l2, %l2	 
	!DIV	153, 154, 152
	sdiv	 %l2, %l3, %l2	 
	!MOV	132, 151
	mov	 %l1, %l1	 
	!SUB	151, 152, 150
	sub	 %l1, %l2, %l1	 
	!MOV	150, 134
	mov	 %l1, %l3	 
 !#while-guard:
.S9:
	!LOADI	10000, 158
	set	 10000, %l1	 	!int: reg 158 gets val 10000
	!MOV	136, 157
	mov	 %l5, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 156
	mov	 %g0, %l7	 
	!COMP	157, 158, 2
	cmp	 %l2, %l1	 
	!MOVLT	2, 3, 156
	movl	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	156, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 156) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!MOV	131, 162
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	162, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 162to register outReg 1
	!CALL	recurseList
	call	 recurseList	
	nop
	!MOV	1, 161
	mov	 %o0, %l1	 
	!MOV	135, 160
	mov	 %l6, %l2	 
	!ADD	160, 161, 159
	add	 %l2, %l1, %l1	 
	!MOV	159, 135
	mov	 %l1, %l6	 
	!LOADI	1, 166
	set	 1, %l1	 	!int: reg 166 gets val 1
	!MOV	136, 165
	mov	 %l5, %l2	 
	!ADD	165, 166, 164
	add	 %l2, %l1, %l1	 
	!MOV	164, 136
	mov	 %l1, %l5	 
	!JUMPI	.S9
	ba	 .S9	 	!while: jump back to guard
	nop
 .S11:
	!MOV	135, 168
	mov	 %l6, %l1	 
	!PRINTLN	168
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
 !#while-guard:
.S12:
	!LOADI	0, 171
	set	 0, %l1	 	!int: reg 171 gets val 0
	!MOV	135, 170
	mov	 %l6, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 169
	mov	 %g0, %l4	 
	!COMP	170, 171, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 169
	movne	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	169, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 169) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
	!LOADI	1, 174
	set	 1, %l1	 	!int: reg 174 gets val 1
	!MOV	135, 173
	mov	 %l6, %l2	 
	!SUB	173, 174, 172
	sub	 %l2, %l1, %l1	 
	!MOV	172, 135
	mov	 %l1, %l6	 
	!JUMPI	.S12
	ba	 .S12	 	!while: jump back to guard
	nop
 .S14:
	!MOV	134, 176
	mov	 %l3, %l0	 
	!PRINTLN	176
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!MOV	135, 177
	mov	 %l6, %l0	 
	!PRINTLN	177
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
	.global	recurseList
	.type	recurseList, #function
	.proc	04
!#function-entry:
recurseList:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 124
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 127
	mov	 %g0, %l2	 	!null: reg 127 gets false
	!MOV	124, 126
	mov	 %l1, %l4	 
	!LOADAI	126, 4, 126
	ld	[%l4 + 4], %l4
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 125
	mov	 %g0, %l3	 
	!COMP	126, 127, 2
	cmp	 %l4, %l2	 
	!MOVEQ	2, 3, 125
	move	 %icc, %g1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	125, 3, 2
	cmp	 %l3, %g1	 	!if: compare guard result (reg 125) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	124, 4
	mov	 %l1, %i0	 
	!LOADAI	4, 0, 4
	ld	[%i0 + 0], %i0
	!RET	
	ret
	restore
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
 .S7:
	!MOV	124, 130
	mov	 %l1, %l2	 
	!LOADAI	130, 4, 130
	ld	[%l2 + 4], %l2
	!STOREOUTARGUMENT	130, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 130to register outReg 1
	!CALL	recurseList
	call	 recurseList	
	nop
	!MOV	1, 129
	mov	 %o0, %l0	 
	!MOV	124, 128
	mov	 %l1, %l1	 
	!LOADAI	128, 0, 128
	ld	[%l1 + 0], %l1
	!MULT	128, 129, 4
	smul	 %l1, %l0, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S8
	ba	 .S8	 	!if: jump to #end-if '.S8'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	add
	.type	add, #function
	.proc	04
!#function-entry:
add:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 98
	mov	 %i0, %l1	 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 101
	mov	 %o0, %l6	 
	!STOREAI	0, 101, 0
	st	%g0, [%l6 + 0]
	!STOREAI	0, 101, 4
	st	%g0, [%l6 + 4]
	!LOADI	0, 102
	set	 0, %l2	 	!int: reg 102 gets val 0
	!MOV	102, 99
	mov	 %l2, %l3	 
	!MOV	98, 104
	mov	 %l1, %l1	 
	!MOV	104, 101
	mov	 %l1, %l6	 
	!MOV	101, 106
	mov	 %l6, %l1	 
	!LOADAI	106, 0, 106
	ld	[%l1 + 0], %l1
	!MOV	106, 100
	mov	 %l1, %l4	 
	!MOV	101, 108
	mov	 %l6, %l1	 
	!LOADAI	108, 4, 108
	ld	[%l1 + 4], %l1
	!MOV	108, 101
	mov	 %l1, %l6	 
 !#while-guard:
.S3:
	!LOADI	5, 112
	set	 5, %l1	 	!int: reg 112 gets val 5
	!MOV	99, 111
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 110
	mov	 %g0, %l5	 
	!COMP	111, 112, 2
	cmp	 %l2, %l1	 
	!MOVLT	2, 3, 110
	movl	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	110, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 110) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
	!MOV	101, 115
	mov	 %l6, %l2	 
	!LOADAI	115, 0, 115
	ld	[%l2 + 0], %l2
	!MOV	100, 114
	mov	 %l4, %l1	 
	!ADD	114, 115, 113
	add	 %l1, %l2, %l1	 
	!MOV	113, 100
	mov	 %l1, %l4	 
	!MOV	101, 117
	mov	 %l6, %l1	 
	!LOADAI	117, 4, 117
	ld	[%l1 + 4], %l1
	!MOV	117, 101
	mov	 %l1, %l6	 
	!MOV	100, 119
	mov	 %l4, %l1	 
	!PRINTLN	119
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 122
	set	 1, %l1	 	!int: reg 122 gets val 1
	!MOV	99, 121
	mov	 %l3, %l2	 
	!ADD	121, 122, 120
	add	 %l2, %l1, %l1	 
	!MOV	120, 99
	mov	 %l1, %l3	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
	!MOV	100, 4
	mov	 %l4, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	multiple
	.type	multiple, #function
	.proc	04
!#function-entry:
multiple:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 72
	mov	 %i0, %l1	 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 75
	mov	 %o0, %l6	 
	!STOREAI	0, 75, 0
	st	%g0, [%l6 + 0]
	!STOREAI	0, 75, 4
	st	%g0, [%l6 + 4]
	!LOADI	0, 76
	set	 0, %l2	 	!int: reg 76 gets val 0
	!MOV	76, 73
	mov	 %l2, %l3	 
	!MOV	72, 78
	mov	 %l1, %l1	 
	!MOV	78, 75
	mov	 %l1, %l6	 
	!MOV	75, 80
	mov	 %l6, %l1	 
	!LOADAI	80, 0, 80
	ld	[%l1 + 0], %l1
	!MOV	80, 74
	mov	 %l1, %l4	 
	!MOV	75, 82
	mov	 %l6, %l1	 
	!LOADAI	82, 4, 82
	ld	[%l1 + 4], %l1
	!MOV	82, 75
	mov	 %l1, %l6	 
 !#while-guard:
.S0:
	!LOADI	5, 86
	set	 5, %l1	 	!int: reg 86 gets val 5
	!MOV	73, 85
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 84
	mov	 %g0, %l5	 
	!COMP	85, 86, 2
	cmp	 %l2, %l1	 
	!MOVLT	2, 3, 84
	movl	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	84, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 84) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!MOV	75, 89
	mov	 %l6, %l2	 
	!LOADAI	89, 0, 89
	ld	[%l2 + 0], %l2
	!MOV	74, 88
	mov	 %l4, %l1	 
	!MULT	88, 89, 87
	smul	 %l1, %l2, %l1	 
	!MOV	87, 74
	mov	 %l1, %l4	 
	!MOV	75, 91
	mov	 %l6, %l1	 
	!LOADAI	91, 4, 91
	ld	[%l1 + 4], %l1
	!MOV	91, 75
	mov	 %l1, %l6	 
	!MOV	74, 93
	mov	 %l4, %l1	 
	!PRINTLN	93
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 96
	set	 1, %l1	 	!int: reg 96 gets val 1
	!MOV	73, 95
	mov	 %l3, %l2	 
	!ADD	95, 96, 94
	add	 %l2, %l1, %l1	 
	!MOV	94, 73
	mov	 %l1, %l3	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!MOV	74, 4
	mov	 %l4, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	buildList
	.type	buildList, #function
	.proc	04
!#function-entry:
buildList:
	!SAVE	
	save	%sp, -800, %sp 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 18
	mov	 %o0, %l2	 
	!STOREAI	0, 18, 0
	st	%g0, [%l2 + 0]
	!STOREAI	0, 18, 4
	st	%g0, [%l2 + 4]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 19
	mov	 %o0, %l3	 
	!STOREAI	0, 19, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 19, 4
	st	%g0, [%l3 + 4]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 20
	mov	 %o0, %l4	 
	!STOREAI	0, 20, 0
	st	%g0, [%l4 + 0]
	!STOREAI	0, 20, 4
	st	%g0, [%l4 + 4]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 21
	mov	 %o0, %l5	 
	!STOREAI	0, 21, 0
	st	%g0, [%l5 + 0]
	!STOREAI	0, 21, 4
	st	%g0, [%l5 + 4]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 22
	mov	 %o0, %l7	 
	!STOREAI	0, 22, 0
	st	%g0, [%l7 + 0]
	!STOREAI	0, 22, 4
	st	%g0, [%l7 + 4]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	1, 23
	mov	 %o0, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!STOREAI	0, 23, 0
	st	%g0, [%l0 + 0]
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!STOREAI	0, 23, 4
	st	%g0, [%l0 + 4]
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 24
	mov	 %o0, %l1	 
	!STOREAI	0, 24, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 24, 4
	st	%g0, [%l1 + 4]
	!MOV	24, 18
	mov	 %l1, %l2	 
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 26
	mov	 %o0, %l1	 
	!STOREAI	0, 26, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 26, 4
	st	%g0, [%l1 + 4]
	!MOV	26, 19
	mov	 %l1, %l3	 
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 28
	mov	 %o0, %l1	 
	!STOREAI	0, 28, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 28, 4
	st	%g0, [%l1 + 4]
	!MOV	28, 20
	mov	 %l1, %l4	 
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
	!MOV	30, 21
	mov	 %l1, %l5	 
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 32
	mov	 %o0, %l1	 
	!STOREAI	0, 32, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 32, 4
	st	%g0, [%l1 + 4]
	!MOV	32, 22
	mov	 %l1, %l7	 
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
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	34, 23
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!READ	36
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	18, 37
	mov	 %l2, %l6	 
	!STOREAI	36, 37, 0
	st	%l1, [%l6 + 0]
	!READ	39
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	19, 40
	mov	 %l3, %l6	 
	!STOREAI	39, 40, 0
	st	%l1, [%l6 + 0]
	!READ	42
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	20, 43
	mov	 %l4, %l6	 
	!STOREAI	42, 43, 0
	st	%l1, [%l6 + 0]
	!READ	45
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	21, 46
	mov	 %l5, %l6	 
	!STOREAI	45, 46, 0
	st	%l1, [%l6 + 0]
	!READ	48
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	22, 49
	mov	 %l7, %l6	 
	!STOREAI	48, 49, 0
	st	%l1, [%l6 + 0]
	!READ	51
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!STOREAI	999, 999, 56
	st	%l0, [%sp + 56]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	23, 52
	mov	 %l0, %l6	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 56, 999
	ld	[%sp + 56], %l0
	!STOREAI	51, 52, 0
	st	%l1, [%l6 + 0]
	!MOV	19, 54
	mov	 %l3, %l1	 
	!MOV	18, 55
	mov	 %l2, %l6	 
	!STOREAI	54, 55, 4
	st	%l1, [%l6 + 4]
	!MOV	20, 57
	mov	 %l4, %l6	 
	!MOV	19, 58
	mov	 %l3, %l1	 
	!STOREAI	57, 58, 4
	st	%l6, [%l1 + 4]
	!MOV	21, 60
	mov	 %l5, %l3	 
	!MOV	20, 61
	mov	 %l4, %l1	 
	!STOREAI	60, 61, 4
	st	%l3, [%l1 + 4]
	!MOV	22, 63
	mov	 %l7, %l3	 
	!MOV	21, 64
	mov	 %l5, %l1	 
	!STOREAI	63, 64, 4
	st	%l3, [%l1 + 4]
	!STOREAI	999, 999, 72
	st	%l0, [%sp + 72]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	23, 66
	mov	 %l0, %l3	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 72, 999
	ld	[%sp + 72], %l0
	!MOV	22, 67
	mov	 %l7, %l1	 
	!STOREAI	66, 67, 4
	st	%l3, [%l1 + 4]
	!MOV	0, 69
	mov	 %g0, %l1	 	!null: reg 69 gets false
	!STOREAI	999, 999, 88
	st	%l1, [%sp + 88]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l1
	!MOV	23, 70
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 128
	st	%l1, [%sp + 128]
	!LOADAI	999, 88, 999
	ld	[%sp + 88], %l1
	!STOREAI	69, 70, 4
	st	%l1, [%l0 + 4]
	!MOV	18, 4
	mov	 %l2, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 