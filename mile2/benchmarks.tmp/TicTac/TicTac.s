	.file	"TicTac.ev"
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
	!NEW	36, 1
	mov	36, %o0
	call	malloc
	nop
	!MOV	1, 230
	mov	 %o0, %l3	 
	!STOREAI	0, 230, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 230, 4
	st	%g0, [%l3 + 4]
	!STOREAI	0, 230, 8
	st	%g0, [%l3 + 8]
	!STOREAI	0, 230, 12
	st	%g0, [%l3 + 12]
	!STOREAI	0, 230, 16
	st	%g0, [%l3 + 16]
	!STOREAI	0, 230, 20
	st	%g0, [%l3 + 20]
	!STOREAI	0, 230, 24
	st	%g0, [%l3 + 24]
	!STOREAI	0, 230, 28
	st	%g0, [%l3 + 28]
	!STOREAI	0, 230, 32
	st	%g0, [%l3 + 32]
	!LOADI	0, 231
	set	 0, %l1	 	!int: reg 231 gets val 0
	!MOV	231, 229
	mov	 %l1, %l4	 
	!LOADI	0, 233
	set	 0, %l1	 	!int: reg 233 gets val 0
	!MOV	233, 225
	mov	 %l1, %l6	 
	!LOADI	0, 235
	set	 0, %l1	 	!int: reg 235 gets val 0
	!MOV	235, 226
	mov	 %l1, %l1	 
	!LOADI	0, 237
	set	 0, %l1	 	!int: reg 237 gets val 0
	!MOV	237, 227
	mov	 %l1, %l1	 
	!LOADI	1, 240
	set	 1, %l1	 	!int: reg 240 gets val 1
	!LOADI	-1, 241
	mov	 -1, %l2	 
	!MULT	240, 241, 239
	smul	 %l1, %l2, %l1	 
	!MOV	239, 228
	mov	 %l1, %l5	 
	!NEW	36, 1
	mov	36, %o0
	call	malloc
	nop
	!MOV	1, 243
	mov	 %o0, %l1	 
	!STOREAI	0, 243, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 243, 4
	st	%g0, [%l1 + 4]
	!STOREAI	0, 243, 8
	st	%g0, [%l1 + 8]
	!STOREAI	0, 243, 12
	st	%g0, [%l1 + 12]
	!STOREAI	0, 243, 16
	st	%g0, [%l1 + 16]
	!STOREAI	0, 243, 20
	st	%g0, [%l1 + 20]
	!STOREAI	0, 243, 24
	st	%g0, [%l1 + 24]
	!STOREAI	0, 243, 28
	st	%g0, [%l1 + 28]
	!STOREAI	0, 243, 32
	st	%g0, [%l1 + 32]
	!MOV	243, 230
	mov	 %l1, %l3	 
	!MOV	230, 245
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	245, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 245to register outReg 1
	!CALL	cleanBoard
	call	 cleanBoard	
	nop
 !#while-guard:
.S135:
	!LOADI	8, 252
	set	 8, %l1	 	!int: reg 252 gets val 8
	!MOV	229, 251
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 248
	mov	 %g0, %l7	 
	!COMP	251, 252, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 248
	movne	 %icc, %g1, %l7	 
	!LOADI	0, 250
	set	 0, %l1	 	!int: reg 250 gets val 0
	!MOV	228, 249
	mov	 %l5, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	0, 247
	mov	 %g0, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!COMP	249, 250, 2
	cmp	 %l2, %l1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOVLT	2, 3, 247
	movl	 %icc, %g1, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!AND	247, 248, 246
	and	 %l0, %l7, %l1	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	246, 3, 2
	cmp	 %l1, %g1	 	!while: compare guard result (reg 246) to true
	!CBREQ	2, .S136, .S137
	be	 .S136	 	!while: branch true: '.S136' false: '.S137'
	nop
	ba	.S137 	!while: branch true: '.S136' false: '.S137'
	nop
 .S136:
	!MOV	230, 253
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	253, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 253to register outReg 1
	!CALL	printBoard
	call	 printBoard	
	nop
 !#if-guard:
	!LOADI	0, 256
	set	 0, %l1	 	!int: reg 256 gets val 0
	!MOV	225, 255
	mov	 %l6, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 254
	mov	 %g0, %l5	 
	!COMP	255, 256, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 254
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	254, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 254) to true
	!CBREQ	2, .S138, .S139
	be	 .S138	 	!if: branch true: '.S138' false: '.S139'
	nop
	ba	.S139 	!if: branch true: '.S138' false: '.S139'
	nop
 .S138:
	!LOADI	1, 259
	set	 1, %l1	 	!int: reg 259 gets val 1
	!MOV	225, 258
	mov	 %l6, %l2	 
	!ADD	258, 259, 257
	add	 %l2, %l1, %l1	 
	!MOV	257, 225
	mov	 %l1, %l6	 
	!READ	261
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	261, 226
	mov	 %l1, %l1	 
	!MOV	230, 263
	mov	 %l3, %l2	 
	!STOREOUTARGUMENT	263, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 263to register outReg 1
	!LOADI	1, 263
	set	 1, %l2	 	!int: reg 263 gets val 1
	!STOREOUTARGUMENT	263, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 263to register outReg 2
	!MOV	226, 263
	mov	 %l1, %l2	 
	!STOREOUTARGUMENT	263, 7
	mov	 %l2, %o2	 	!argument: store out param from reg 263to register outReg 3
	!CALL	placePiece
	call	 placePiece	
	nop
	!JUMPI	.S140
	ba	 .S140	 	!then: jump to #end-if '.S140'
	nop
 .S140:
	!MOV	230, 272
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	272, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 272to register outReg 1
	!CALL	checkWinner
	call	 checkWinner	
	nop
	!MOV	1, 271
	mov	 %o0, %l1	 
	!MOV	271, 228
	mov	 %l1, %l5	 
	!LOADI	1, 276
	set	 1, %l1	 	!int: reg 276 gets val 1
	!MOV	229, 275
	mov	 %l4, %l2	 
	!ADD	275, 276, 274
	add	 %l2, %l1, %l1	 
	!MOV	274, 229
	mov	 %l1, %l4	 
	!JUMPI	.S135
	ba	 .S135	 	!while: jump back to guard
	nop
 .S137:
	!LOADI	1, 280
	set	 1, %l1	 	!int: reg 280 gets val 1
	!MOV	228, 279
	mov	 %l5, %l2	 
	!ADD	279, 280, 278
	add	 %l2, %l1, %l1	 
	!PRINTLN	278
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
 .S139:
	!LOADI	1, 266
	set	 1, %l1	 	!int: reg 266 gets val 1
	!MOV	225, 265
	mov	 %l6, %l2	 
	!SUB	265, 266, 264
	sub	 %l2, %l1, %l1	 
	!MOV	264, 225
	mov	 %l1, %l6	 
	!READ	268
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	268, 227
	mov	 %l1, %l1	 
	!MOV	230, 270
	mov	 %l3, %l2	 
	!STOREOUTARGUMENT	270, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 270to register outReg 1
	!LOADI	2, 270
	set	 2, %l2	 	!int: reg 270 gets val 2
	!STOREOUTARGUMENT	270, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 270to register outReg 2
	!MOV	227, 270
	mov	 %l1, %l2	 
	!STOREOUTARGUMENT	270, 7
	mov	 %l2, %o2	 	!argument: store out param from reg 270to register outReg 3
	!CALL	placePiece
	call	 placePiece	
	nop
	!JUMPI	.S140
	ba	 .S140	 	!if: jump to #end-if '.S140'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	checkWinner
	.type	checkWinner, #function
	.proc	04
!#function-entry:
checkWinner:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 114
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	1, 117
	set	 1, %l2	 	!int: reg 117 gets val 1
	!MOV	114, 116
	mov	 %l1, %l3	 
	!LOADAI	116, 0, 116
	ld	[%l3 + 0], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 115
	mov	 %g0, %l4	 
	!COMP	116, 117, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 115
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	115, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 115) to true
	!CBREQ	2, .S27, .S28
	be	 .S27	 	!if: branch true: '.S27' false: '.S28'
	nop
	ba	.S28 	!if: branch true: '.S27' false: '.S28'
	nop
 .S27:
 !#if-guard:
	!LOADI	1, 120
	set	 1, %l2	 	!int: reg 120 gets val 1
	!MOV	114, 119
	mov	 %l1, %l3	 
	!LOADAI	119, 4, 119
	ld	[%l3 + 4], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 118
	mov	 %g0, %l4	 
	!COMP	119, 120, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 118
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	118, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 118) to true
	!CBREQ	2, .S30, .S31
	be	 .S30	 	!if: branch true: '.S30' false: '.S31'
	nop
	ba	.S31 	!if: branch true: '.S30' false: '.S31'
	nop
 .S30:
 !#if-guard:
	!LOADI	1, 123
	set	 1, %l2	 	!int: reg 123 gets val 1
	!MOV	114, 122
	mov	 %l1, %l3	 
	!LOADAI	122, 8, 122
	ld	[%l3 + 8], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 121
	mov	 %g0, %l4	 
	!COMP	122, 123, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 121
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	121, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 121) to true
	!CBREQ	2, .S33, .S34
	be	 .S33	 	!if: branch true: '.S33' false: '.S34'
	nop
	ba	.S34 	!if: branch true: '.S33' false: '.S34'
	nop
 .S33:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S35
	ba	 .S35	 	!then: jump to #end-if '.S35'
	nop
 .S35:
.S34:
	!JUMPI	.S32
	ba	 .S32	 	!then: jump to #end-if '.S32'
	nop
 .S32:
.S31:
	!JUMPI	.S29
	ba	 .S29	 	!then: jump to #end-if '.S29'
	nop
 .S29:
.S28:
 !#if-guard:
	!LOADI	2, 126
	set	 2, %l2	 	!int: reg 126 gets val 2
	!MOV	114, 125
	mov	 %l1, %l3	 
	!LOADAI	125, 0, 125
	ld	[%l3 + 0], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 124
	mov	 %g0, %l4	 
	!COMP	125, 126, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 124
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	124, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 124) to true
	!CBREQ	2, .S36, .S37
	be	 .S36	 	!if: branch true: '.S36' false: '.S37'
	nop
	ba	.S37 	!if: branch true: '.S36' false: '.S37'
	nop
 .S36:
 !#if-guard:
	!LOADI	2, 129
	set	 2, %l2	 	!int: reg 129 gets val 2
	!MOV	114, 128
	mov	 %l1, %l3	 
	!LOADAI	128, 4, 128
	ld	[%l3 + 4], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 127
	mov	 %g0, %l4	 
	!COMP	128, 129, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 127
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	127, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 127) to true
	!CBREQ	2, .S39, .S40
	be	 .S39	 	!if: branch true: '.S39' false: '.S40'
	nop
	ba	.S40 	!if: branch true: '.S39' false: '.S40'
	nop
 .S39:
 !#if-guard:
	!LOADI	2, 132
	set	 2, %l2	 	!int: reg 132 gets val 2
	!MOV	114, 131
	mov	 %l1, %l3	 
	!LOADAI	131, 8, 131
	ld	[%l3 + 8], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 130
	mov	 %g0, %l4	 
	!COMP	131, 132, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 130
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	130, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 130) to true
	!CBREQ	2, .S42, .S43
	be	 .S42	 	!if: branch true: '.S42' false: '.S43'
	nop
	ba	.S43 	!if: branch true: '.S42' false: '.S43'
	nop
 .S42:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S44
	ba	 .S44	 	!then: jump to #end-if '.S44'
	nop
 .S44:
.S43:
	!JUMPI	.S41
	ba	 .S41	 	!then: jump to #end-if '.S41'
	nop
 .S41:
.S40:
	!JUMPI	.S38
	ba	 .S38	 	!then: jump to #end-if '.S38'
	nop
 .S38:
.S37:
 !#if-guard:
	!LOADI	1, 135
	set	 1, %l2	 	!int: reg 135 gets val 1
	!MOV	114, 134
	mov	 %l1, %l3	 
	!LOADAI	134, 12, 134
	ld	[%l3 + 12], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 133
	mov	 %g0, %l4	 
	!COMP	134, 135, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 133
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	133, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 133) to true
	!CBREQ	2, .S45, .S46
	be	 .S45	 	!if: branch true: '.S45' false: '.S46'
	nop
	ba	.S46 	!if: branch true: '.S45' false: '.S46'
	nop
 .S45:
 !#if-guard:
	!LOADI	1, 138
	set	 1, %l2	 	!int: reg 138 gets val 1
	!MOV	114, 137
	mov	 %l1, %l3	 
	!LOADAI	137, 16, 137
	ld	[%l3 + 16], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 136
	mov	 %g0, %l4	 
	!COMP	137, 138, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 136
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	136, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 136) to true
	!CBREQ	2, .S48, .S49
	be	 .S48	 	!if: branch true: '.S48' false: '.S49'
	nop
	ba	.S49 	!if: branch true: '.S48' false: '.S49'
	nop
 .S48:
 !#if-guard:
	!LOADI	1, 141
	set	 1, %l2	 	!int: reg 141 gets val 1
	!MOV	114, 140
	mov	 %l1, %l3	 
	!LOADAI	140, 20, 140
	ld	[%l3 + 20], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 139
	mov	 %g0, %l4	 
	!COMP	140, 141, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 139
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	139, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 139) to true
	!CBREQ	2, .S51, .S52
	be	 .S51	 	!if: branch true: '.S51' false: '.S52'
	nop
	ba	.S52 	!if: branch true: '.S51' false: '.S52'
	nop
 .S51:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S53
	ba	 .S53	 	!then: jump to #end-if '.S53'
	nop
 .S53:
.S52:
	!JUMPI	.S50
	ba	 .S50	 	!then: jump to #end-if '.S50'
	nop
 .S50:
.S49:
	!JUMPI	.S47
	ba	 .S47	 	!then: jump to #end-if '.S47'
	nop
 .S47:
.S46:
 !#if-guard:
	!LOADI	2, 144
	set	 2, %l2	 	!int: reg 144 gets val 2
	!MOV	114, 143
	mov	 %l1, %l3	 
	!LOADAI	143, 12, 143
	ld	[%l3 + 12], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 142
	mov	 %g0, %l4	 
	!COMP	143, 144, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 142
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	142, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 142) to true
	!CBREQ	2, .S54, .S55
	be	 .S54	 	!if: branch true: '.S54' false: '.S55'
	nop
	ba	.S55 	!if: branch true: '.S54' false: '.S55'
	nop
 .S54:
 !#if-guard:
	!LOADI	2, 147
	set	 2, %l2	 	!int: reg 147 gets val 2
	!MOV	114, 146
	mov	 %l1, %l3	 
	!LOADAI	146, 16, 146
	ld	[%l3 + 16], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 145
	mov	 %g0, %l4	 
	!COMP	146, 147, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 145
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	145, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 145) to true
	!CBREQ	2, .S57, .S58
	be	 .S57	 	!if: branch true: '.S57' false: '.S58'
	nop
	ba	.S58 	!if: branch true: '.S57' false: '.S58'
	nop
 .S57:
 !#if-guard:
	!LOADI	2, 150
	set	 2, %l2	 	!int: reg 150 gets val 2
	!MOV	114, 149
	mov	 %l1, %l3	 
	!LOADAI	149, 20, 149
	ld	[%l3 + 20], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 148
	mov	 %g0, %l4	 
	!COMP	149, 150, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 148
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	148, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 148) to true
	!CBREQ	2, .S60, .S61
	be	 .S60	 	!if: branch true: '.S60' false: '.S61'
	nop
	ba	.S61 	!if: branch true: '.S60' false: '.S61'
	nop
 .S60:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S62
	ba	 .S62	 	!then: jump to #end-if '.S62'
	nop
 .S62:
.S61:
	!JUMPI	.S59
	ba	 .S59	 	!then: jump to #end-if '.S59'
	nop
 .S59:
.S58:
	!JUMPI	.S56
	ba	 .S56	 	!then: jump to #end-if '.S56'
	nop
 .S56:
.S55:
 !#if-guard:
	!LOADI	1, 153
	set	 1, %l2	 	!int: reg 153 gets val 1
	!MOV	114, 152
	mov	 %l1, %l3	 
	!LOADAI	152, 24, 152
	ld	[%l3 + 24], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 151
	mov	 %g0, %l4	 
	!COMP	152, 153, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 151
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	151, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 151) to true
	!CBREQ	2, .S63, .S64
	be	 .S63	 	!if: branch true: '.S63' false: '.S64'
	nop
	ba	.S64 	!if: branch true: '.S63' false: '.S64'
	nop
 .S63:
 !#if-guard:
	!LOADI	1, 156
	set	 1, %l2	 	!int: reg 156 gets val 1
	!MOV	114, 155
	mov	 %l1, %l3	 
	!LOADAI	155, 28, 155
	ld	[%l3 + 28], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 154
	mov	 %g0, %l4	 
	!COMP	155, 156, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 154
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	154, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 154) to true
	!CBREQ	2, .S66, .S67
	be	 .S66	 	!if: branch true: '.S66' false: '.S67'
	nop
	ba	.S67 	!if: branch true: '.S66' false: '.S67'
	nop
 .S66:
 !#if-guard:
	!LOADI	1, 159
	set	 1, %l2	 	!int: reg 159 gets val 1
	!MOV	114, 158
	mov	 %l1, %l3	 
	!LOADAI	158, 32, 158
	ld	[%l3 + 32], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 157
	mov	 %g0, %l4	 
	!COMP	158, 159, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 157
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	157, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 157) to true
	!CBREQ	2, .S69, .S70
	be	 .S69	 	!if: branch true: '.S69' false: '.S70'
	nop
	ba	.S70 	!if: branch true: '.S69' false: '.S70'
	nop
 .S69:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S71
	ba	 .S71	 	!then: jump to #end-if '.S71'
	nop
 .S71:
.S70:
	!JUMPI	.S68
	ba	 .S68	 	!then: jump to #end-if '.S68'
	nop
 .S68:
.S67:
	!JUMPI	.S65
	ba	 .S65	 	!then: jump to #end-if '.S65'
	nop
 .S65:
.S64:
 !#if-guard:
	!LOADI	2, 162
	set	 2, %l2	 	!int: reg 162 gets val 2
	!MOV	114, 161
	mov	 %l1, %l3	 
	!LOADAI	161, 24, 161
	ld	[%l3 + 24], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 160
	mov	 %g0, %l4	 
	!COMP	161, 162, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 160
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	160, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 160) to true
	!CBREQ	2, .S72, .S73
	be	 .S72	 	!if: branch true: '.S72' false: '.S73'
	nop
	ba	.S73 	!if: branch true: '.S72' false: '.S73'
	nop
 .S72:
 !#if-guard:
	!LOADI	2, 165
	set	 2, %l2	 	!int: reg 165 gets val 2
	!MOV	114, 164
	mov	 %l1, %l3	 
	!LOADAI	164, 28, 164
	ld	[%l3 + 28], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 163
	mov	 %g0, %l4	 
	!COMP	164, 165, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 163
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	163, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 163) to true
	!CBREQ	2, .S75, .S76
	be	 .S75	 	!if: branch true: '.S75' false: '.S76'
	nop
	ba	.S76 	!if: branch true: '.S75' false: '.S76'
	nop
 .S75:
 !#if-guard:
	!LOADI	2, 168
	set	 2, %l2	 	!int: reg 168 gets val 2
	!MOV	114, 167
	mov	 %l1, %l3	 
	!LOADAI	167, 32, 167
	ld	[%l3 + 32], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 166
	mov	 %g0, %l4	 
	!COMP	167, 168, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 166
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	166, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 166) to true
	!CBREQ	2, .S78, .S79
	be	 .S78	 	!if: branch true: '.S78' false: '.S79'
	nop
	ba	.S79 	!if: branch true: '.S78' false: '.S79'
	nop
 .S78:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S80
	ba	 .S80	 	!then: jump to #end-if '.S80'
	nop
 .S80:
.S79:
	!JUMPI	.S77
	ba	 .S77	 	!then: jump to #end-if '.S77'
	nop
 .S77:
.S76:
	!JUMPI	.S74
	ba	 .S74	 	!then: jump to #end-if '.S74'
	nop
 .S74:
.S73:
 !#if-guard:
	!LOADI	1, 171
	set	 1, %l2	 	!int: reg 171 gets val 1
	!MOV	114, 170
	mov	 %l1, %l3	 
	!LOADAI	170, 0, 170
	ld	[%l3 + 0], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 169
	mov	 %g0, %l4	 
	!COMP	170, 171, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 169
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	169, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 169) to true
	!CBREQ	2, .S81, .S82
	be	 .S81	 	!if: branch true: '.S81' false: '.S82'
	nop
	ba	.S82 	!if: branch true: '.S81' false: '.S82'
	nop
 .S81:
 !#if-guard:
	!LOADI	1, 174
	set	 1, %l2	 	!int: reg 174 gets val 1
	!MOV	114, 173
	mov	 %l1, %l3	 
	!LOADAI	173, 12, 173
	ld	[%l3 + 12], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 172
	mov	 %g0, %l4	 
	!COMP	173, 174, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 172
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	172, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 172) to true
	!CBREQ	2, .S84, .S85
	be	 .S84	 	!if: branch true: '.S84' false: '.S85'
	nop
	ba	.S85 	!if: branch true: '.S84' false: '.S85'
	nop
 .S84:
 !#if-guard:
	!LOADI	1, 177
	set	 1, %l2	 	!int: reg 177 gets val 1
	!MOV	114, 176
	mov	 %l1, %l3	 
	!LOADAI	176, 24, 176
	ld	[%l3 + 24], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 175
	mov	 %g0, %l4	 
	!COMP	176, 177, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 175
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	175, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 175) to true
	!CBREQ	2, .S87, .S88
	be	 .S87	 	!if: branch true: '.S87' false: '.S88'
	nop
	ba	.S88 	!if: branch true: '.S87' false: '.S88'
	nop
 .S87:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S89
	ba	 .S89	 	!then: jump to #end-if '.S89'
	nop
 .S89:
.S88:
	!JUMPI	.S86
	ba	 .S86	 	!then: jump to #end-if '.S86'
	nop
 .S86:
.S85:
	!JUMPI	.S83
	ba	 .S83	 	!then: jump to #end-if '.S83'
	nop
 .S83:
.S82:
 !#if-guard:
	!LOADI	2, 180
	set	 2, %l2	 	!int: reg 180 gets val 2
	!MOV	114, 179
	mov	 %l1, %l3	 
	!LOADAI	179, 0, 179
	ld	[%l3 + 0], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 178
	mov	 %g0, %l4	 
	!COMP	179, 180, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 178
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	178, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 178) to true
	!CBREQ	2, .S90, .S91
	be	 .S90	 	!if: branch true: '.S90' false: '.S91'
	nop
	ba	.S91 	!if: branch true: '.S90' false: '.S91'
	nop
 .S90:
 !#if-guard:
	!LOADI	2, 183
	set	 2, %l2	 	!int: reg 183 gets val 2
	!MOV	114, 182
	mov	 %l1, %l3	 
	!LOADAI	182, 12, 182
	ld	[%l3 + 12], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 181
	mov	 %g0, %l4	 
	!COMP	182, 183, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 181
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	181, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 181) to true
	!CBREQ	2, .S93, .S94
	be	 .S93	 	!if: branch true: '.S93' false: '.S94'
	nop
	ba	.S94 	!if: branch true: '.S93' false: '.S94'
	nop
 .S93:
 !#if-guard:
	!LOADI	2, 186
	set	 2, %l2	 	!int: reg 186 gets val 2
	!MOV	114, 185
	mov	 %l1, %l3	 
	!LOADAI	185, 24, 185
	ld	[%l3 + 24], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 184
	mov	 %g0, %l4	 
	!COMP	185, 186, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 184
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	184, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 184) to true
	!CBREQ	2, .S96, .S97
	be	 .S96	 	!if: branch true: '.S96' false: '.S97'
	nop
	ba	.S97 	!if: branch true: '.S96' false: '.S97'
	nop
 .S96:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S98
	ba	 .S98	 	!then: jump to #end-if '.S98'
	nop
 .S98:
.S97:
	!JUMPI	.S95
	ba	 .S95	 	!then: jump to #end-if '.S95'
	nop
 .S95:
.S94:
	!JUMPI	.S92
	ba	 .S92	 	!then: jump to #end-if '.S92'
	nop
 .S92:
.S91:
 !#if-guard:
	!LOADI	1, 189
	set	 1, %l2	 	!int: reg 189 gets val 1
	!MOV	114, 188
	mov	 %l1, %l3	 
	!LOADAI	188, 4, 188
	ld	[%l3 + 4], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 187
	mov	 %g0, %l4	 
	!COMP	188, 189, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 187
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	187, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 187) to true
	!CBREQ	2, .S99, .S100
	be	 .S99	 	!if: branch true: '.S99' false: '.S100'
	nop
	ba	.S100 	!if: branch true: '.S99' false: '.S100'
	nop
 .S99:
 !#if-guard:
	!LOADI	1, 192
	set	 1, %l2	 	!int: reg 192 gets val 1
	!MOV	114, 191
	mov	 %l1, %l3	 
	!LOADAI	191, 16, 191
	ld	[%l3 + 16], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 190
	mov	 %g0, %l4	 
	!COMP	191, 192, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 190
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	190, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 190) to true
	!CBREQ	2, .S102, .S103
	be	 .S102	 	!if: branch true: '.S102' false: '.S103'
	nop
	ba	.S103 	!if: branch true: '.S102' false: '.S103'
	nop
 .S102:
 !#if-guard:
	!LOADI	1, 195
	set	 1, %l2	 	!int: reg 195 gets val 1
	!MOV	114, 194
	mov	 %l1, %l3	 
	!LOADAI	194, 28, 194
	ld	[%l3 + 28], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 193
	mov	 %g0, %l4	 
	!COMP	194, 195, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 193
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	193, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 193) to true
	!CBREQ	2, .S105, .S106
	be	 .S105	 	!if: branch true: '.S105' false: '.S106'
	nop
	ba	.S106 	!if: branch true: '.S105' false: '.S106'
	nop
 .S105:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S107
	ba	 .S107	 	!then: jump to #end-if '.S107'
	nop
 .S107:
.S106:
	!JUMPI	.S104
	ba	 .S104	 	!then: jump to #end-if '.S104'
	nop
 .S104:
.S103:
	!JUMPI	.S101
	ba	 .S101	 	!then: jump to #end-if '.S101'
	nop
 .S101:
.S100:
 !#if-guard:
	!LOADI	2, 198
	set	 2, %l2	 	!int: reg 198 gets val 2
	!MOV	114, 197
	mov	 %l1, %l3	 
	!LOADAI	197, 4, 197
	ld	[%l3 + 4], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 196
	mov	 %g0, %l4	 
	!COMP	197, 198, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 196
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	196, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 196) to true
	!CBREQ	2, .S108, .S109
	be	 .S108	 	!if: branch true: '.S108' false: '.S109'
	nop
	ba	.S109 	!if: branch true: '.S108' false: '.S109'
	nop
 .S108:
 !#if-guard:
	!LOADI	2, 201
	set	 2, %l2	 	!int: reg 201 gets val 2
	!MOV	114, 200
	mov	 %l1, %l3	 
	!LOADAI	200, 16, 200
	ld	[%l3 + 16], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 199
	mov	 %g0, %l4	 
	!COMP	200, 201, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 199
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	199, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 199) to true
	!CBREQ	2, .S111, .S112
	be	 .S111	 	!if: branch true: '.S111' false: '.S112'
	nop
	ba	.S112 	!if: branch true: '.S111' false: '.S112'
	nop
 .S111:
 !#if-guard:
	!LOADI	2, 204
	set	 2, %l2	 	!int: reg 204 gets val 2
	!MOV	114, 203
	mov	 %l1, %l3	 
	!LOADAI	203, 28, 203
	ld	[%l3 + 28], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 202
	mov	 %g0, %l4	 
	!COMP	203, 204, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 202
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	202, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 202) to true
	!CBREQ	2, .S114, .S115
	be	 .S114	 	!if: branch true: '.S114' false: '.S115'
	nop
	ba	.S115 	!if: branch true: '.S114' false: '.S115'
	nop
 .S114:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S116
	ba	 .S116	 	!then: jump to #end-if '.S116'
	nop
 .S116:
.S115:
	!JUMPI	.S113
	ba	 .S113	 	!then: jump to #end-if '.S113'
	nop
 .S113:
.S112:
	!JUMPI	.S110
	ba	 .S110	 	!then: jump to #end-if '.S110'
	nop
 .S110:
.S109:
 !#if-guard:
	!LOADI	1, 207
	set	 1, %l2	 	!int: reg 207 gets val 1
	!MOV	114, 206
	mov	 %l1, %l3	 
	!LOADAI	206, 8, 206
	ld	[%l3 + 8], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 205
	mov	 %g0, %l4	 
	!COMP	206, 207, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 205
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	205, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 205) to true
	!CBREQ	2, .S117, .S118
	be	 .S117	 	!if: branch true: '.S117' false: '.S118'
	nop
	ba	.S118 	!if: branch true: '.S117' false: '.S118'
	nop
 .S117:
 !#if-guard:
	!LOADI	1, 210
	set	 1, %l2	 	!int: reg 210 gets val 1
	!MOV	114, 209
	mov	 %l1, %l3	 
	!LOADAI	209, 20, 209
	ld	[%l3 + 20], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 208
	mov	 %g0, %l4	 
	!COMP	209, 210, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 208
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	208, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 208) to true
	!CBREQ	2, .S120, .S121
	be	 .S120	 	!if: branch true: '.S120' false: '.S121'
	nop
	ba	.S121 	!if: branch true: '.S120' false: '.S121'
	nop
 .S120:
 !#if-guard:
	!LOADI	1, 213
	set	 1, %l2	 	!int: reg 213 gets val 1
	!MOV	114, 212
	mov	 %l1, %l3	 
	!LOADAI	212, 32, 212
	ld	[%l3 + 32], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 211
	mov	 %g0, %l4	 
	!COMP	212, 213, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 211
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	211, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 211) to true
	!CBREQ	2, .S123, .S124
	be	 .S123	 	!if: branch true: '.S123' false: '.S124'
	nop
	ba	.S124 	!if: branch true: '.S123' false: '.S124'
	nop
 .S123:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S125
	ba	 .S125	 	!then: jump to #end-if '.S125'
	nop
 .S125:
.S124:
	!JUMPI	.S122
	ba	 .S122	 	!then: jump to #end-if '.S122'
	nop
 .S122:
.S121:
	!JUMPI	.S119
	ba	 .S119	 	!then: jump to #end-if '.S119'
	nop
 .S119:
.S118:
 !#if-guard:
	!LOADI	2, 216
	set	 2, %l2	 	!int: reg 216 gets val 2
	!MOV	114, 215
	mov	 %l1, %l3	 
	!LOADAI	215, 8, 215
	ld	[%l3 + 8], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 214
	mov	 %g0, %l4	 
	!COMP	215, 216, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 214
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	214, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 214) to true
	!CBREQ	2, .S126, .S127
	be	 .S126	 	!if: branch true: '.S126' false: '.S127'
	nop
	ba	.S127 	!if: branch true: '.S126' false: '.S127'
	nop
 .S126:
 !#if-guard:
	!LOADI	2, 219
	set	 2, %l2	 	!int: reg 219 gets val 2
	!MOV	114, 218
	mov	 %l1, %l3	 
	!LOADAI	218, 20, 218
	ld	[%l3 + 20], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 217
	mov	 %g0, %l4	 
	!COMP	218, 219, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 217
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	217, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 217) to true
	!CBREQ	2, .S129, .S130
	be	 .S129	 	!if: branch true: '.S129' false: '.S130'
	nop
	ba	.S130 	!if: branch true: '.S129' false: '.S130'
	nop
 .S129:
 !#if-guard:
	!LOADI	2, 222
	set	 2, %l2	 	!int: reg 222 gets val 2
	!MOV	114, 221
	mov	 %l1, %l1	 
	!LOADAI	221, 32, 221
	ld	[%l1 + 32], %l1
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 220
	mov	 %g0, %l0	 
	!COMP	221, 222, 2
	cmp	 %l1, %l2	 
	!MOVEQ	2, 3, 220
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	220, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 220) to true
	!CBREQ	2, .S132, .S133
	be	 .S132	 	!if: branch true: '.S132' false: '.S133'
	nop
	ba	.S133 	!if: branch true: '.S132' false: '.S133'
	nop
 .S132:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S134
	ba	 .S134	 	!then: jump to #end-if '.S134'
	nop
 .S134:
.S133:
	!JUMPI	.S131
	ba	 .S131	 	!then: jump to #end-if '.S131'
	nop
 .S131:
.S130:
	!JUMPI	.S128
	ba	 .S128	 	!then: jump to #end-if '.S128'
	nop
 .S128:
.S127:
	!LOADI	1, 223
	set	 1, %l0	 	!int: reg 223 gets val 1
	!LOADI	-1, 224
	mov	 -1, %l1	 
	!MULT	223, 224, 4
	smul	 %l0, %l1, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	placePiece
	.type	placePiece, #function
	.proc	04
!#function-entry:
placePiece:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 57
	mov	 %i0, %l3	 
	!STOREINARGUMENT	11, 58
	mov	 %i1, %l2	 
	!STOREINARGUMENT	12, 59
	mov	 %i2, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	1, 62
	set	 1, %l4	 	!int: reg 62 gets val 1
	!MOV	59, 61
	mov	 %l1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 60
	mov	 %g0, %l6	 
	!COMP	61, 62, 2
	cmp	 %l5, %l4	 
	!MOVEQ	2, 3, 60
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	60, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 60) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	58, 63
	mov	 %l2, %l1	 
	!MOV	57, 64
	mov	 %l3, %l0	 
	!STOREAI	63, 64, 0
	st	%l1, [%l0 + 0]
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
 !#if-guard:
	!LOADI	2, 68
	set	 2, %l4	 	!int: reg 68 gets val 2
	!MOV	59, 67
	mov	 %l1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 66
	mov	 %g0, %l6	 
	!COMP	67, 68, 2
	cmp	 %l5, %l4	 
	!MOVEQ	2, 3, 66
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	66, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 66) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	58, 69
	mov	 %l2, %l1	 
	!MOV	57, 70
	mov	 %l3, %l0	 
	!STOREAI	69, 70, 4
	st	%l1, [%l0 + 4]
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
	!JUMPI	.S2
	ba	 .S2	 	!if: jump to #end-if '.S2'
	nop
 .S4:
 !#if-guard:
	!LOADI	3, 74
	set	 3, %l4	 	!int: reg 74 gets val 3
	!MOV	59, 73
	mov	 %l1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 72
	mov	 %g0, %l6	 
	!COMP	73, 74, 2
	cmp	 %l5, %l4	 
	!MOVEQ	2, 3, 72
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	72, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 72) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	58, 75
	mov	 %l2, %l1	 
	!MOV	57, 76
	mov	 %l3, %l0	 
	!STOREAI	75, 76, 8
	st	%l1, [%l0 + 8]
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 .S7:
 !#if-guard:
	!LOADI	4, 80
	set	 4, %l4	 	!int: reg 80 gets val 4
	!MOV	59, 79
	mov	 %l1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 78
	mov	 %g0, %l6	 
	!COMP	79, 80, 2
	cmp	 %l5, %l4	 
	!MOVEQ	2, 3, 78
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	78, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 78) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!MOV	58, 81
	mov	 %l2, %l1	 
	!MOV	57, 82
	mov	 %l3, %l0	 
	!STOREAI	81, 82, 12
	st	%l1, [%l0 + 12]
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
	!JUMPI	.S8
	ba	 .S8	 	!if: jump to #end-if '.S8'
	nop
 .S10:
 !#if-guard:
	!LOADI	5, 86
	set	 5, %l4	 	!int: reg 86 gets val 5
	!MOV	59, 85
	mov	 %l1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 84
	mov	 %g0, %l6	 
	!COMP	85, 86, 2
	cmp	 %l5, %l4	 
	!MOVEQ	2, 3, 84
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	84, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 84) to true
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!MOV	58, 87
	mov	 %l2, %l1	 
	!MOV	57, 88
	mov	 %l3, %l0	 
	!STOREAI	87, 88, 16
	st	%l1, [%l0 + 16]
	!JUMPI	.S14
	ba	 .S14	 	!then: jump to #end-if '.S14'
	nop
 .S14:
	!JUMPI	.S11
	ba	 .S11	 	!if: jump to #end-if '.S11'
	nop
 .S13:
 !#if-guard:
	!LOADI	6, 92
	set	 6, %l4	 	!int: reg 92 gets val 6
	!MOV	59, 91
	mov	 %l1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 90
	mov	 %g0, %l6	 
	!COMP	91, 92, 2
	cmp	 %l5, %l4	 
	!MOVEQ	2, 3, 90
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	90, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 90) to true
	!CBREQ	2, .S15, .S16
	be	 .S15	 	!if: branch true: '.S15' false: '.S16'
	nop
	ba	.S16 	!if: branch true: '.S15' false: '.S16'
	nop
 .S15:
	!MOV	58, 93
	mov	 %l2, %l1	 
	!MOV	57, 94
	mov	 %l3, %l0	 
	!STOREAI	93, 94, 20
	st	%l1, [%l0 + 20]
	!JUMPI	.S17
	ba	 .S17	 	!then: jump to #end-if '.S17'
	nop
 .S17:
	!JUMPI	.S14
	ba	 .S14	 	!if: jump to #end-if '.S14'
	nop
 .S16:
 !#if-guard:
	!LOADI	7, 98
	set	 7, %l4	 	!int: reg 98 gets val 7
	!MOV	59, 97
	mov	 %l1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 96
	mov	 %g0, %l6	 
	!COMP	97, 98, 2
	cmp	 %l5, %l4	 
	!MOVEQ	2, 3, 96
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	96, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 96) to true
	!CBREQ	2, .S18, .S19
	be	 .S18	 	!if: branch true: '.S18' false: '.S19'
	nop
	ba	.S19 	!if: branch true: '.S18' false: '.S19'
	nop
 .S18:
	!MOV	58, 99
	mov	 %l2, %l1	 
	!MOV	57, 100
	mov	 %l3, %l0	 
	!STOREAI	99, 100, 24
	st	%l1, [%l0 + 24]
	!JUMPI	.S20
	ba	 .S20	 	!then: jump to #end-if '.S20'
	nop
 .S20:
	!JUMPI	.S17
	ba	 .S17	 	!if: jump to #end-if '.S17'
	nop
 .S19:
 !#if-guard:
	!LOADI	8, 104
	set	 8, %l4	 	!int: reg 104 gets val 8
	!MOV	59, 103
	mov	 %l1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 102
	mov	 %g0, %l6	 
	!COMP	103, 104, 2
	cmp	 %l5, %l4	 
	!MOVEQ	2, 3, 102
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	102, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 102) to true
	!CBREQ	2, .S21, .S22
	be	 .S21	 	!if: branch true: '.S21' false: '.S22'
	nop
	ba	.S22 	!if: branch true: '.S21' false: '.S22'
	nop
 .S21:
	!MOV	58, 105
	mov	 %l2, %l1	 
	!MOV	57, 106
	mov	 %l3, %l0	 
	!STOREAI	105, 106, 28
	st	%l1, [%l0 + 28]
	!JUMPI	.S23
	ba	 .S23	 	!then: jump to #end-if '.S23'
	nop
 .S23:
	!JUMPI	.S20
	ba	 .S20	 	!if: jump to #end-if '.S20'
	nop
 .S22:
 !#if-guard:
	!LOADI	9, 110
	set	 9, %l4	 	!int: reg 110 gets val 9
	!MOV	59, 109
	mov	 %l1, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 108
	mov	 %g0, %l0	 
	!COMP	109, 110, 2
	cmp	 %l1, %l4	 
	!MOVEQ	2, 3, 108
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	108, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 108) to true
	!CBREQ	2, .S24, .S25
	be	 .S24	 	!if: branch true: '.S24' false: '.S25'
	nop
	ba	.S25 	!if: branch true: '.S24' false: '.S25'
	nop
 .S24:
	!MOV	58, 111
	mov	 %l2, %l1	 
	!MOV	57, 112
	mov	 %l3, %l0	 
	!STOREAI	111, 112, 32
	st	%l1, [%l0 + 32]
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
	.global	printMoveBoard
	.type	printMoveBoard, #function
	.proc	04
!#function-entry:
printMoveBoard:
	!SAVE	
	save	%sp, -800, %sp 
 !#function-body:
	!LOADI	123, 54
	set	 123, %l0	 	!int: reg 54 gets val 123
	!PRINTLN	54
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	456, 55
	set	 456, %l0	 	!int: reg 55 gets val 456
	!PRINTLN	55
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	789, 56
	set	 789, %l0	 	!int: reg 56 gets val 789
	!PRINTLN	56
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	printBoard
	.type	printBoard, #function
	.proc	04
!#function-entry:
printBoard:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 44
	mov	 %i0, %l0	 
 !#function-body:
	!MOV	44, 45
	mov	 %l0, %l1	 
	!LOADAI	45, 0, 45
	ld	[%l1 + 0], %l1
	!PRINT	45
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	44, 46
	mov	 %l0, %l1	 
	!LOADAI	46, 4, 46
	ld	[%l1 + 4], %l1
	!PRINT	46
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	44, 47
	mov	 %l0, %l1	 
	!LOADAI	47, 8, 47
	ld	[%l1 + 8], %l1
	!PRINTLN	47
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	44, 48
	mov	 %l0, %l1	 
	!LOADAI	48, 12, 48
	ld	[%l1 + 12], %l1
	!PRINT	48
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	44, 49
	mov	 %l0, %l1	 
	!LOADAI	49, 16, 49
	ld	[%l1 + 16], %l1
	!PRINT	49
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	44, 50
	mov	 %l0, %l1	 
	!LOADAI	50, 20, 50
	ld	[%l1 + 20], %l1
	!PRINTLN	50
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	44, 51
	mov	 %l0, %l1	 
	!LOADAI	51, 24, 51
	ld	[%l1 + 24], %l1
	!PRINT	51
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	44, 52
	mov	 %l0, %l1	 
	!LOADAI	52, 28, 52
	ld	[%l1 + 28], %l1
	!PRINT	52
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	44, 53
	mov	 %l0, %l0	 
	!LOADAI	53, 32, 53
	ld	[%l0 + 32], %l0
	!PRINTLN	53
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	cleanBoard
	.type	cleanBoard, #function
	.proc	04
!#function-entry:
cleanBoard:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l0	 
 !#function-body:
	!LOADI	0, 17
	set	 0, %l1	 	!int: reg 17 gets val 0
	!MOV	16, 18
	mov	 %l0, %l2	 
	!STOREAI	17, 18, 0
	st	%l1, [%l2 + 0]
	!LOADI	0, 20
	set	 0, %l1	 	!int: reg 20 gets val 0
	!MOV	16, 21
	mov	 %l0, %l2	 
	!STOREAI	20, 21, 4
	st	%l1, [%l2 + 4]
	!LOADI	0, 23
	set	 0, %l1	 	!int: reg 23 gets val 0
	!MOV	16, 24
	mov	 %l0, %l2	 
	!STOREAI	23, 24, 8
	st	%l1, [%l2 + 8]
	!LOADI	0, 26
	set	 0, %l1	 	!int: reg 26 gets val 0
	!MOV	16, 27
	mov	 %l0, %l2	 
	!STOREAI	26, 27, 12
	st	%l1, [%l2 + 12]
	!LOADI	0, 29
	set	 0, %l1	 	!int: reg 29 gets val 0
	!MOV	16, 30
	mov	 %l0, %l2	 
	!STOREAI	29, 30, 16
	st	%l1, [%l2 + 16]
	!LOADI	0, 32
	set	 0, %l1	 	!int: reg 32 gets val 0
	!MOV	16, 33
	mov	 %l0, %l2	 
	!STOREAI	32, 33, 20
	st	%l1, [%l2 + 20]
	!LOADI	0, 35
	set	 0, %l1	 	!int: reg 35 gets val 0
	!MOV	16, 36
	mov	 %l0, %l2	 
	!STOREAI	35, 36, 24
	st	%l1, [%l2 + 24]
	!LOADI	0, 38
	set	 0, %l1	 	!int: reg 38 gets val 0
	!MOV	16, 39
	mov	 %l0, %l2	 
	!STOREAI	38, 39, 28
	st	%l1, [%l2 + 28]
	!LOADI	0, 41
	set	 0, %l1	 	!int: reg 41 gets val 0
	!MOV	16, 42
	mov	 %l0, %l0	 
	!STOREAI	41, 42, 32
	st	%l1, [%l0 + 32]
 !#function-exit:
 