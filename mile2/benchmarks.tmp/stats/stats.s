	.file	"stats.ev"
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
	!MOV	1, 169
	mov	 %o0, %l2	 
	!STOREAI	0, 169, 0
	st	%g0, [%l2 + 0]
	!STOREAI	0, 169, 4
	st	%g0, [%l2 + 4]
	!READ	170
	add	%sp, %g0, %l0
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l0

	!MOV	170, 166
	mov	 %l0, %l0	 
	!READ	172
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	172, 167
	mov	 %l1, %l1	 
	!MOV	166, 175
	mov	 %l0, %l2	 
	!STOREOUTARGUMENT	175, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 175to register outReg 1
	!MOV	167, 175
	mov	 %l1, %l2	 
	!STOREOUTARGUMENT	175, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 175to register outReg 2
	!CALL	getRands
	call	 getRands	
	nop
	!MOV	1, 174
	mov	 %o0, %l0	 
	!MOV	174, 169
	mov	 %l0, %l2	 
	!MOV	169, 178
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	178, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 178to register outReg 1
	!CALL	calcMean
	call	 calcMean	
	nop
	!MOV	1, 177
	mov	 %o0, %l0	 
	!MOV	177, 168
	mov	 %l0, %l0	 
	!MOV	168, 180
	mov	 %l0, %l0	 
	!PRINTLN	180
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!MOV	169, 181
	mov	 %l2, %l0	 
	!STOREOUTARGUMENT	181, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 181to register outReg 1
	!CALL	range
	call	 range	
	nop
	!MOV	169, 182
	mov	 %l2, %l0	 
	!STOREOUTARGUMENT	182, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 182to register outReg 1
	!CALL	approxSqrtAll
	call	 approxSqrtAll	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	range
	.type	range, #function
	.proc	04
!#function-entry:
range:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 132
	mov	 %i0, %l3	 
 !#function-body:
	!LOADI	0, 136
	set	 0, %l1	 	!int: reg 136 gets val 0
	!MOV	136, 133
	mov	 %l1, %l5	 
	!LOADI	0, 138
	set	 0, %l1	 	!int: reg 138 gets val 0
	!MOV	138, 134
	mov	 %l1, %l6	 
	!LOADI	1, 140
	set	 1, %l1	 	!bool: reg 140 gets true
	!MOV	140, 135
	mov	 %l1, %l4	 
 !#while-guard:
.S15:
	!MOV	0, 144
	mov	 %g0, %l1	 	!null: reg 144 gets false
	!MOV	132, 143
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 142
	mov	 %g0, %l7	 
	!COMP	143, 144, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 142
	movne	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	142, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 142) to true
	!CBREQ	2, .S16, .S17
	be	 .S16	 	!while: branch true: '.S16' false: '.S17'
	nop
	ba	.S17 	!while: branch true: '.S16' false: '.S17'
	nop
 .S16:
 !#if-guard:
	!MOV	135, 145
	mov	 %l4, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	145, 3, 2
	cmp	 %l1, %g1	 	!if: compare guard result (reg 145) to true
	!CBREQ	2, .S18, .S19
	be	 .S18	 	!if: branch true: '.S18' false: '.S19'
	nop
	ba	.S19 	!if: branch true: '.S18' false: '.S19'
	nop
 .S18:
	!MOV	132, 146
	mov	 %l3, %l1	 
	!LOADAI	146, 0, 146
	ld	[%l1 + 0], %l1
	!MOV	146, 133
	mov	 %l1, %l5	 
	!MOV	132, 148
	mov	 %l3, %l1	 
	!LOADAI	148, 0, 148
	ld	[%l1 + 0], %l1
	!MOV	148, 134
	mov	 %l1, %l6	 
	!MOV	0, 150
	mov	 %g0, %l1	 	!bool: reg 150 gets false
	!MOV	150, 135
	mov	 %l1, %l4	 
	!JUMPI	.S20
	ba	 .S20	 	!then: jump to #end-if '.S20'
	nop
 .S20:
	!MOV	132, 162
	mov	 %l3, %l1	 
	!LOADAI	162, 4, 162
	ld	[%l1 + 4], %l1
	!MOV	162, 132
	mov	 %l1, %l3	 
	!JUMPI	.S15
	ba	 .S15	 	!while: jump back to guard
	nop
 .S17:
	!MOV	133, 164
	mov	 %l5, %l1	 
	!PRINTLN	164
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	134, 165
	mov	 %l6, %l1	 
	!PRINTLN	165
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
 .S19:
 !#if-guard:
	!MOV	133, 154
	mov	 %l5, %l1	 
	!MOV	132, 153
	mov	 %l3, %l2	 
	!LOADAI	153, 0, 153
	ld	[%l2 + 0], %l2
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 152
	mov	 %g0, %l7	 
	!COMP	153, 154, 2
	cmp	 %l2, %l1	 
	!MOVLT	2, 3, 152
	movl	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	152, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 152) to true
	!CBREQ	2, .S21, .S22
	be	 .S21	 	!if: branch true: '.S21' false: '.S22'
	nop
	ba	.S22 	!if: branch true: '.S21' false: '.S22'
	nop
 .S21:
	!MOV	132, 155
	mov	 %l3, %l1	 
	!LOADAI	155, 0, 155
	ld	[%l1 + 0], %l1
	!MOV	155, 133
	mov	 %l1, %l5	 
	!JUMPI	.S23
	ba	 .S23	 	!then: jump to #end-if '.S23'
	nop
 .S23:
	!JUMPI	.S20
	ba	 .S20	 	!if: jump to #end-if '.S20'
	nop
 .S22:
 !#if-guard:
	!MOV	134, 159
	mov	 %l6, %l1	 
	!MOV	132, 158
	mov	 %l3, %l2	 
	!LOADAI	158, 0, 158
	ld	[%l2 + 0], %l2
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 157
	mov	 %g0, %l7	 
	!COMP	158, 159, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 157
	movg	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	157, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 157) to true
	!CBREQ	2, .S24, .S25
	be	 .S24	 	!if: branch true: '.S24' false: '.S25'
	nop
	ba	.S25 	!if: branch true: '.S24' false: '.S25'
	nop
 .S24:
	!MOV	132, 160
	mov	 %l3, %l1	 
	!LOADAI	160, 0, 160
	ld	[%l1 + 0], %l1
	!MOV	160, 134
	mov	 %l1, %l6	 
	!JUMPI	.S26
	ba	 .S26	 	!then: jump to #end-if '.S26'
	nop
 .S26:
.S25:
	!JUMPI	.S23
	ba	 .S23	 	!if: jump to #end-if '.S23'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	approxSqrtAll
	.type	approxSqrtAll, #function
	.proc	04
!#function-entry:
approxSqrtAll:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 124
	mov	 %i0, %l3	 
 !#function-body:
 !#while-guard:
.S12:
	!MOV	0, 127
	mov	 %g0, %l1	 	!null: reg 127 gets false
	!MOV	124, 126
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 125
	mov	 %g0, %l4	 
	!COMP	126, 127, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 125
	movne	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	125, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 125) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
	!MOV	124, 129
	mov	 %l3, %l1	 
	!LOADAI	129, 0, 129
	ld	[%l1 + 0], %l1
	!STOREOUTARGUMENT	129, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 129to register outReg 1
	!CALL	approxSqrt
	call	 approxSqrt	
	nop
	!MOV	1, 128
	mov	 %o0, %l1	 
	!PRINTLN	128
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	124, 130
	mov	 %l3, %l1	 
	!LOADAI	130, 4, 130
	ld	[%l1 + 4], %l1
	!MOV	130, 124
	mov	 %l1, %l3	 
	!JUMPI	.S12
	ba	 .S12	 	!while: jump back to guard
	nop
 .S14:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	approxSqrt
	.type	approxSqrt, #function
	.proc	04
!#function-entry:
approxSqrt:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 101
	mov	 %i0, %l1	 
 !#function-body:
	!LOADI	1, 105
	set	 1, %l2	 	!int: reg 105 gets val 1
	!MOV	105, 102
	mov	 %l2, %l4	 
	!MOV	102, 107
	mov	 %l4, %l2	 
	!MOV	107, 104
	mov	 %l2, %l5	 
	!LOADI	0, 109
	set	 0, %l2	 	!int: reg 109 gets val 0
	!MOV	109, 103
	mov	 %l2, %l6	 
 !#while-guard:
.S9:
	!MOV	101, 113
	mov	 %l1, %l2	 
	!MOV	103, 112
	mov	 %l6, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 111
	mov	 %g0, %l7	 
	!COMP	112, 113, 2
	cmp	 %l3, %l2	 
	!MOVLT	2, 3, 111
	movl	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	111, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 111) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!MOV	102, 116
	mov	 %l4, %l2	 
	!MOV	102, 115
	mov	 %l4, %l3	 
	!MULT	115, 116, 114
	smul	 %l3, %l2, %l2	 
	!MOV	114, 103
	mov	 %l2, %l6	 
	!MOV	102, 118
	mov	 %l4, %l2	 
	!MOV	118, 104
	mov	 %l2, %l5	 
	!LOADI	1, 122
	set	 1, %l2	 	!int: reg 122 gets val 1
	!MOV	102, 121
	mov	 %l4, %l3	 
	!ADD	121, 122, 120
	add	 %l3, %l2, %l2	 
	!MOV	120, 102
	mov	 %l2, %l4	 
	!JUMPI	.S9
	ba	 .S9	 	!while: jump back to guard
	nop
 .S11:
	!MOV	104, 4
	mov	 %l5, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	calcMean
	.type	calcMean, #function
	.proc	04
!#function-entry:
calcMean:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 71
	mov	 %i0, %l4	 
 !#function-body:
	!LOADI	0, 75
	set	 0, %l1	 	!int: reg 75 gets val 0
	!MOV	75, 72
	mov	 %l1, %l5	 
	!LOADI	0, 77
	set	 0, %l1	 	!int: reg 77 gets val 0
	!MOV	77, 73
	mov	 %l1, %l6	 
	!LOADI	0, 79
	set	 0, %l1	 	!int: reg 79 gets val 0
	!MOV	79, 74
	mov	 %l1, %l3	 
 !#while-guard:
.S3:
	!MOV	0, 83
	mov	 %g0, %l1	 	!null: reg 83 gets false
	!MOV	71, 82
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 81
	mov	 %g0, %l7	 
	!COMP	82, 83, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 81
	movne	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	81, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 81) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
	!LOADI	1, 86
	set	 1, %l1	 	!int: reg 86 gets val 1
	!MOV	73, 85
	mov	 %l6, %l2	 
	!ADD	85, 86, 84
	add	 %l2, %l1, %l1	 
	!MOV	84, 73
	mov	 %l1, %l6	 
	!MOV	71, 90
	mov	 %l4, %l2	 
	!LOADAI	90, 0, 90
	ld	[%l2 + 0], %l2
	!MOV	72, 89
	mov	 %l5, %l1	 
	!ADD	89, 90, 88
	add	 %l1, %l2, %l1	 
	!MOV	88, 72
	mov	 %l1, %l5	 
	!MOV	71, 92
	mov	 %l4, %l1	 
	!LOADAI	92, 4, 92
	ld	[%l1 + 4], %l1
	!MOV	92, 71
	mov	 %l1, %l4	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
 !#if-guard:
	!LOADI	0, 96
	set	 0, %l1	 	!int: reg 96 gets val 0
	!MOV	73, 95
	mov	 %l6, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 94
	mov	 %g0, %l0	 
	!COMP	95, 96, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 94
	movne	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	94, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 94) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	73, 99
	mov	 %l6, %l0	 
	!MOV	72, 98
	mov	 %l5, %l1	 
	!DIV	98, 99, 97
	sdiv	 %l1, %l0, %l0	 
	!MOV	97, 74
	mov	 %l0, %l3	 
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!MOV	74, 4
	mov	 %l3, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	getRands
	.type	getRands, #function
	.proc	04
!#function-entry:
getRands:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 17
	mov	 %i1, %l7	 
 !#function-body:
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
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	1, 21
	mov	 %o0, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!STOREAI	0, 21, 0
	st	%g0, [%l0 + 0]
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!STOREAI	0, 21, 4
	st	%g0, [%l0 + 4]
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!MOV	16, 24
	mov	 %l1, %l2	 
	!MOV	16, 23
	mov	 %l1, %l3	 
	!MULT	23, 24, 22
	smul	 %l3, %l2, %l2	 
	!MOV	22, 18
	mov	 %l2, %l5	 
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 26
	mov	 %o0, %l2	 
	!STOREAI	0, 26, 0
	st	%g0, [%l2 + 0]
	!STOREAI	0, 26, 4
	st	%g0, [%l2 + 4]
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	26, 21
	mov	 %l2, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	18, 28
	mov	 %l5, %l2	 
	!STOREAI	999, 999, 56
	st	%l0, [%sp + 56]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	21, 29
	mov	 %l0, %l3	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 56, 999
	ld	[%sp + 56], %l0
	!STOREAI	28, 29, 0
	st	%l2, [%l3 + 0]
	!MOV	0, 31
	mov	 %g0, %l2	 	!null: reg 31 gets false
	!STOREAI	999, 999, 72
	st	%l0, [%sp + 72]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	21, 32
	mov	 %l0, %l3	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 72, 999
	ld	[%sp + 72], %l0
	!STOREAI	31, 32, 4
	st	%l2, [%l3 + 4]
	!LOADI	1, 36
	set	 1, %l2	 	!int: reg 36 gets val 1
	!MOV	17, 35
	mov	 %l7, %l3	 
	!SUB	35, 36, 34
	sub	 %l3, %l2, %l2	 
	!MOV	34, 17
	mov	 %l2, %l7	 
	!MOV	18, 38
	mov	 %l5, %l2	 
	!MOV	38, 19
	mov	 %l2, %l6	 
 !#while-guard:
.S0:
	!LOADI	0, 42
	set	 0, %l2	 	!int: reg 42 gets val 0
	!MOV	17, 41
	mov	 %l7, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 40
	mov	 %g0, %l5	 
	!COMP	41, 42, 2
	cmp	 %l3, %l2	 
	!MOVGT	2, 3, 40
	movg	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	40, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 40) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!LOADI	1, 45
	set	 1, %l2	 	!int: reg 45 gets val 1
	!LOADI	2, 53
	set	 2, %l3	 	!int: reg 53 gets val 2
	!MOV	16, 52
	mov	 %l1, %l4	 
	!DIV	52, 53, 47
	sdiv	 %l4, %l3, %l3	 
	!MOV	16, 49
	mov	 %l1, %l4	 
	!MOV	19, 51
	mov	 %l6, %l5	 
	!MOV	19, 50
	mov	 %l6, %l6	 
	!MULT	50, 51, 48
	smul	 %l6, %l5, %l5	 
	!DIV	48, 49, 46
	sdiv	 %l5, %l4, %l4	 
	!MULT	46, 47, 44
	smul	 %l4, %l3, %l3	 
	!ADD	44, 45, 43
	add	 %l3, %l2, %l2	 
	!MOV	43, 18
	mov	 %l2, %l5	 
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 55
	mov	 %o0, %l2	 
	!STOREAI	0, 55, 0
	st	%g0, [%l2 + 0]
	!STOREAI	0, 55, 4
	st	%g0, [%l2 + 4]
	!MOV	55, 20
	mov	 %l2, %l4	 
	!MOV	18, 57
	mov	 %l5, %l2	 
	!MOV	20, 58
	mov	 %l4, %l3	 
	!STOREAI	57, 58, 0
	st	%l2, [%l3 + 0]
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	21, 60
	mov	 %l0, %l2	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!MOV	20, 61
	mov	 %l4, %l3	 
	!STOREAI	60, 61, 4
	st	%l2, [%l3 + 4]
	!MOV	20, 63
	mov	 %l4, %l2	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	63, 21
	mov	 %l2, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!LOADI	1, 67
	set	 1, %l2	 	!int: reg 67 gets val 1
	!MOV	17, 66
	mov	 %l7, %l3	 
	!SUB	66, 67, 65
	sub	 %l3, %l2, %l2	 
	!MOV	65, 17
	mov	 %l2, %l7	 
	!MOV	18, 69
	mov	 %l5, %l2	 
	!MOV	69, 19
	mov	 %l2, %l6	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!MOV	20, 4
	mov	 %l4, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 