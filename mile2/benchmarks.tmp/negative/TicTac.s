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
	!LOADI	0, 298
	mov	 0, %l1	 	!int: reg 298 gets val 0
	!MOV	296, 299
	mov	 %l2, %l2	 	!lvalue id: move reg 296 (var i) to reg 299
	!MOV	298, 299
	mov	 %l1, %l2	 
	!MOV	299, 296
	mov	 %l2, %l2	 
	!LOADI	0, 301
	mov	 0, %l1	 	!int: reg 301 gets val 0
	!MOV	292, 302
	mov	 %g2, %l5	 	!lvalue id: move reg 292 (var turn) to reg 302
	!MOV	301, 302
	mov	 %l1, %l5	 
	!MOV	302, 292
	mov	 %l5, %g2	 
	!LOADI	0, 304
	mov	 0, %l1	 	!int: reg 304 gets val 0
	!MOV	293, 305
	mov	 %l7, %l5	 	!lvalue id: move reg 293 (var space1) to reg 305
	!MOV	304, 305
	mov	 %l1, %l5	 
	!MOV	305, 293
	mov	 %l5, %l7	 
	!LOADI	0, 307
	mov	 0, %l1	 	!int: reg 307 gets val 0
	!MOV	294, 308
	mov	 %l6, %l5	 	!lvalue id: move reg 294 (var space2) to reg 308
	!MOV	307, 308
	mov	 %l1, %l5	 
	!MOV	308, 294
	mov	 %l5, %l6	 
	!LOADI	1, 312
	mov	 1, %l1	 	!int: reg 312 gets val 1
	!LOADI	-1, 313
	mov	 -1, %l5	 
	!MULT	312, 313, 310
	smul	 %l1, %l5, %l1	 
	!MOV	295, 311
	mov	 %l4, %l4	 	!lvalue id: move reg 295 (var winner) to reg 311
	!MOV	310, 311
	mov	 %l1, %l4	 
	!MOV	311, 295
	mov	 %l4, %l4	 
	!LOADI	36, 1
	mov	 36, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 315
	mov	 %o0, %l1	 
	!MOV	297, 316
	mov	 %l3, %l3	 	!lvalue id: move reg 297 (var board) to reg 316
	!MOV	315, 316
	mov	 %l1, %l3	 
	!MOV	316, 297
	mov	 %l3, %l3	 
	!MOV	297, 318
	mov	 %l3, %l1	 	!id: move reg 297 (var mainboard) to reg 318
	!STOREOUTARGUMENT	318, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 318to register outReg 1
	!CALL	cleanBoard
	call	 cleanBoard	
	nop
 !#while-guard:
.S135:
	!LOADI	8, 325
	mov	 8, %l1	 	!int: reg 325 gets val 8
	!MOV	296, 324
	mov	 %l2, %l5	 	!id: move reg 296 (var maini) to reg 324
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 321
	mov	 %g0, 321	 
	!COMP	324, 325, 2
	cmp	 %l5, %l1	 	!expression: compare: reg 324 (var null) to 325 (var null), store in cc-reg
	!MOVNE	2, 3, 321
	movne	 %icc, %g1, 321	 
	!LOADI	0, 323
	mov	 0, %l1	 	!int: reg 323 gets val 0
	!MOV	295, 322
	mov	 %l4, %l5	 	!id: move reg 295 (var mainwinner) to reg 322
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 320
	mov	 %g0, 320	 
	!COMP	322, 323, 2
	cmp	 %l5, %l1	 	!expression: compare: reg 322 (var null) to 323 (var null), store in cc-reg
	!MOVLT	2, 3, 320
	movl	 %icc, %g1, 320	 
	!AND	320, 321, 319
	and	 320, 321, %l1	 	!expression: reg 320 (var null) && 321 in reg 319 (var null)
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	319, 3, 2
	cmp	 %l1, %g1	 	!while: compare guard result (reg 319) to true
	!CBREQ	2, .S136, .S137
	be	 .S136	 	!while: branch true: '.S136' false: '.S137'
	nop
	ba	.S137 	!while: branch true: '.S136' false: '.S137'
	nop
 .S136:
	!MOV	297, 326
	mov	 %l3, %l1	 	!id: move reg 297 (var mainboard) to reg 326
	!STOREOUTARGUMENT	326, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 326to register outReg 1
	!CALL	printBoard
	call	 printBoard	
	nop
 !#if-guard:
	!LOADI	0, 329
	mov	 0, %l1	 	!int: reg 329 gets val 0
	!MOV	292, 328
	mov	 %g2, %l5	 	!id: move reg 292 (var mainturn) to reg 328
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 327
	mov	 %g0, 327	 
	!COMP	328, 329, 2
	cmp	 %l5, %l1	 	!expression: compare: reg 328 (var null) to 329 (var null), store in cc-reg
	!MOVEQ	2, 3, 327
	move	 %icc, %g1, 327	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	327, 3, 2
	cmp	 327, %g1	 	!if: compare guard result (reg 327) to true
	!CBREQ	2, .S138, .S139
	be	 .S138	 	!if: branch true: '.S138' false: '.S139'
	nop
	ba	.S139 	!if: branch true: '.S138' false: '.S139'
	nop
 .S138:
	!LOADI	1, 333
	mov	 1, %l5	 	!int: reg 333 gets val 1
	!MOV	292, 332
	mov	 %g2, %l1	 	!id: move reg 292 (var mainturn) to reg 332
	!ADD	332, 333, 330
	add	 %l1, %l5, %l5	 	!expression: reg 332 (var null) + 333 in reg 330 (var null)
	!MOV	292, 331
	mov	 %g2, %l1	 	!lvalue id: move reg 292 (var turn) to reg 331
	!MOV	330, 331
	mov	 %l5, %l1	 
	!MOV	331, 292
	mov	 %l1, %g2	 
	!MOV	293, 335
	mov	 %l7, %l1	 	!lvalue id: move reg 293 (var space1) to reg 335
	!READ	335
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	335, 293
	mov	 %l1, %l7	 
	!MOV	297, 337
	mov	 %l3, %l1	 	!id: move reg 297 (var mainboard) to reg 337
	!STOREOUTARGUMENT	337, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 337to register outReg 1
	!LOADI	1, 337
	mov	 1, %l1	 	!int: reg 337 gets val 1
	!STOREOUTARGUMENT	337, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 337to register outReg 2
	!MOV	293, 337
	mov	 %l7, %l1	 	!id: move reg 293 (var mainspace1) to reg 337
	!STOREOUTARGUMENT	337, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 337to register outReg 3
	!CALL	placePiece
	call	 placePiece	
	nop
	!JUMPI	.S140
	ba	 .S140	 	!then: jump to #end-if '.S140'
	nop
 .S140:
	!MOV	297, 348
	mov	 %l3, %l1	 	!id: move reg 297 (var mainboard) to reg 348
	!STOREOUTARGUMENT	348, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 348to register outReg 1
	!CALL	checkWinner
	call	 checkWinner	
	nop
	!MOV	1, 346
	mov	 %o0, %l0	 
	!MOV	295, 347
	mov	 %l4, %l1	 	!lvalue id: move reg 295 (var winner) to reg 347
	!MOV	346, 347
	mov	 %l0, %l1	 
	!MOV	347, 295
	mov	 %l1, %l4	 
	!LOADI	1, 353
	mov	 1, %l0	 	!int: reg 353 gets val 1
	!MOV	296, 352
	mov	 %l2, %l1	 	!id: move reg 296 (var maini) to reg 352
	!ADD	352, 353, 350
	add	 %l1, %l0, %l1	 	!expression: reg 352 (var null) + 353 in reg 350 (var null)
	!MOV	296, 351
	mov	 %l2, %l0	 	!lvalue id: move reg 296 (var i) to reg 351
	!MOV	350, 351
	mov	 %l1, %l0	 
	!MOV	351, 296
	mov	 %l0, %l2	 
	!JUMPI	.S135
	ba	 .S135	 	!while: jump back to guard
	nop
 .S139:
	!LOADI	1, 341
	mov	 1, %l5	 	!int: reg 341 gets val 1
	!MOV	292, 340
	mov	 %g2, %l1	 	!id: move reg 292 (var mainturn) to reg 340
	!SUB	340, 341, 338
	sub	 %l1, %l5, %l5	 	!expression: reg 340 (var null) - 341 in reg 338 (var null)
	!MOV	292, 339
	mov	 %g2, %l1	 	!lvalue id: move reg 292 (var turn) to reg 339
	!MOV	338, 339
	mov	 %l5, %l1	 
	!MOV	339, 292
	mov	 %l1, %g2	 
	!MOV	294, 343
	mov	 %l6, %l1	 	!lvalue id: move reg 294 (var space2) to reg 343
	!READ	343
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	343, 294
	mov	 %l1, %l6	 
	!MOV	297, 345
	mov	 %l3, %l1	 	!id: move reg 297 (var mainboard) to reg 345
	!STOREOUTARGUMENT	345, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 345to register outReg 1
	!LOADI	2, 345
	mov	 2, %l1	 	!int: reg 345 gets val 2
	!STOREOUTARGUMENT	345, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 345to register outReg 2
	!MOV	294, 345
	mov	 %l6, %l1	 	!id: move reg 294 (var mainspace2) to reg 345
	!STOREOUTARGUMENT	345, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 345to register outReg 3
	!CALL	placePiece
	call	 placePiece	
	nop
	!JUMPI	.S140
	ba	 .S140	 	!if: jump to #end-if '.S140'
	nop
 .S137:
	!LOADI	1, 357
	mov	 1, %l0	 	!int: reg 357 gets val 1
	!MOV	295, 356
	mov	 %l4, %l1	 	!id: move reg 295 (var mainwinner) to reg 356
	!ADD	356, 357, 355
	add	 %l1, %l0, %l0	 	!expression: reg 356 (var null) + 357 in reg 355 (var null)
	!PRINTLN	355
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
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
	!STOREINARGUMENT	10, 145
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	1, 148
	mov	 1, %l2	 	!int: reg 148 gets val 1
	!MOV	145, 149
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 149
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	149, 3, 147
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 146
	mov	 %g0, %l4	 
	!COMP	147, 148, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 147 (var null) to 148 (var null), store in cc-reg
	!MOVEQ	2, 3, 146
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	146, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 146) to true
	!CBREQ	2, .S27, .S28
	be	 .S27	 	!if: branch true: '.S27' false: '.S28'
	nop
	ba	.S28 	!if: branch true: '.S27' false: '.S28'
	nop
 .S27:
 !#if-guard:
	!LOADI	1, 152
	mov	 1, %l2	 	!int: reg 152 gets val 1
	!MOV	145, 153
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 153
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	153, 3, 151
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 150
	mov	 %g0, %l4	 
	!COMP	151, 152, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 151 (var null) to 152 (var null), store in cc-reg
	!MOVEQ	2, 3, 150
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	150, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 150) to true
	!CBREQ	2, .S30, .S31
	be	 .S30	 	!if: branch true: '.S30' false: '.S31'
	nop
	ba	.S31 	!if: branch true: '.S30' false: '.S31'
	nop
 .S30:
 !#if-guard:
	!LOADI	1, 156
	mov	 1, %l2	 	!int: reg 156 gets val 1
	!MOV	145, 157
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 157
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	157, 3, 155
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 154
	mov	 %g0, %l4	 
	!COMP	155, 156, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 155 (var null) to 156 (var null), store in cc-reg
	!MOVEQ	2, 3, 154
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	154, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 154) to true
	!CBREQ	2, .S33, .S34
	be	 .S33	 	!if: branch true: '.S33' false: '.S34'
	nop
	ba	.S34 	!if: branch true: '.S33' false: '.S34'
	nop
 .S33:
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
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
	!LOADI	2, 160
	mov	 2, %l2	 	!int: reg 160 gets val 2
	!MOV	145, 161
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 161
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	161, 3, 159
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 158
	mov	 %g0, %l4	 
	!COMP	159, 160, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 159 (var null) to 160 (var null), store in cc-reg
	!MOVEQ	2, 3, 158
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	158, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 158) to true
	!CBREQ	2, .S36, .S37
	be	 .S36	 	!if: branch true: '.S36' false: '.S37'
	nop
	ba	.S37 	!if: branch true: '.S36' false: '.S37'
	nop
 .S36:
 !#if-guard:
	!LOADI	2, 164
	mov	 2, %l2	 	!int: reg 164 gets val 2
	!MOV	145, 165
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 165
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	165, 3, 163
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 162
	mov	 %g0, %l4	 
	!COMP	163, 164, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 163 (var null) to 164 (var null), store in cc-reg
	!MOVEQ	2, 3, 162
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	162, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 162) to true
	!CBREQ	2, .S39, .S40
	be	 .S39	 	!if: branch true: '.S39' false: '.S40'
	nop
	ba	.S40 	!if: branch true: '.S39' false: '.S40'
	nop
 .S39:
 !#if-guard:
	!LOADI	2, 168
	mov	 2, %l2	 	!int: reg 168 gets val 2
	!MOV	145, 169
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 169
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	169, 3, 167
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 166
	mov	 %g0, %l4	 
	!COMP	167, 168, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 167 (var null) to 168 (var null), store in cc-reg
	!MOVEQ	2, 3, 166
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	166, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 166) to true
	!CBREQ	2, .S42, .S43
	be	 .S42	 	!if: branch true: '.S42' false: '.S43'
	nop
	ba	.S43 	!if: branch true: '.S42' false: '.S43'
	nop
 .S42:
	!LOADI	1, 4
	mov	 1, %i0	 	!int: reg 4 gets val 1
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
	!LOADI	1, 172
	mov	 1, %l2	 	!int: reg 172 gets val 1
	!MOV	145, 173
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 173
	!LOADI	12, 3
	mov	 12, %g1	 
	!LOADAI	173, 3, 171
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 170
	mov	 %g0, %l4	 
	!COMP	171, 172, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 171 (var null) to 172 (var null), store in cc-reg
	!MOVEQ	2, 3, 170
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	170, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 170) to true
	!CBREQ	2, .S45, .S46
	be	 .S45	 	!if: branch true: '.S45' false: '.S46'
	nop
	ba	.S46 	!if: branch true: '.S45' false: '.S46'
	nop
 .S45:
 !#if-guard:
	!LOADI	1, 176
	mov	 1, %l2	 	!int: reg 176 gets val 1
	!MOV	145, 177
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 177
	!LOADI	16, 3
	mov	 16, %g1	 
	!LOADAI	177, 3, 175
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 174
	mov	 %g0, %l4	 
	!COMP	175, 176, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 175 (var null) to 176 (var null), store in cc-reg
	!MOVEQ	2, 3, 174
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	174, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 174) to true
	!CBREQ	2, .S48, .S49
	be	 .S48	 	!if: branch true: '.S48' false: '.S49'
	nop
	ba	.S49 	!if: branch true: '.S48' false: '.S49'
	nop
 .S48:
 !#if-guard:
	!LOADI	1, 180
	mov	 1, %l2	 	!int: reg 180 gets val 1
	!MOV	145, 181
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 181
	!LOADI	20, 3
	mov	 20, %g1	 
	!LOADAI	181, 3, 179
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 178
	mov	 %g0, %l4	 
	!COMP	179, 180, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 179 (var null) to 180 (var null), store in cc-reg
	!MOVEQ	2, 3, 178
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	178, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 178) to true
	!CBREQ	2, .S51, .S52
	be	 .S51	 	!if: branch true: '.S51' false: '.S52'
	nop
	ba	.S52 	!if: branch true: '.S51' false: '.S52'
	nop
 .S51:
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
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
	!LOADI	2, 184
	mov	 2, %l2	 	!int: reg 184 gets val 2
	!MOV	145, 185
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 185
	!LOADI	12, 3
	mov	 12, %g1	 
	!LOADAI	185, 3, 183
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 182
	mov	 %g0, %l4	 
	!COMP	183, 184, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 183 (var null) to 184 (var null), store in cc-reg
	!MOVEQ	2, 3, 182
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	182, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 182) to true
	!CBREQ	2, .S54, .S55
	be	 .S54	 	!if: branch true: '.S54' false: '.S55'
	nop
	ba	.S55 	!if: branch true: '.S54' false: '.S55'
	nop
 .S54:
 !#if-guard:
	!LOADI	2, 188
	mov	 2, %l2	 	!int: reg 188 gets val 2
	!MOV	145, 189
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 189
	!LOADI	16, 3
	mov	 16, %g1	 
	!LOADAI	189, 3, 187
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 186
	mov	 %g0, %l4	 
	!COMP	187, 188, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 187 (var null) to 188 (var null), store in cc-reg
	!MOVEQ	2, 3, 186
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	186, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 186) to true
	!CBREQ	2, .S57, .S58
	be	 .S57	 	!if: branch true: '.S57' false: '.S58'
	nop
	ba	.S58 	!if: branch true: '.S57' false: '.S58'
	nop
 .S57:
 !#if-guard:
	!LOADI	2, 192
	mov	 2, %l2	 	!int: reg 192 gets val 2
	!MOV	145, 193
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 193
	!LOADI	20, 3
	mov	 20, %g1	 
	!LOADAI	193, 3, 191
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 190
	mov	 %g0, %l4	 
	!COMP	191, 192, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 191 (var null) to 192 (var null), store in cc-reg
	!MOVEQ	2, 3, 190
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	190, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 190) to true
	!CBREQ	2, .S60, .S61
	be	 .S60	 	!if: branch true: '.S60' false: '.S61'
	nop
	ba	.S61 	!if: branch true: '.S60' false: '.S61'
	nop
 .S60:
	!LOADI	1, 4
	mov	 1, %i0	 	!int: reg 4 gets val 1
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
	!LOADI	1, 196
	mov	 1, %l2	 	!int: reg 196 gets val 1
	!MOV	145, 197
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 197
	!LOADI	24, 3
	mov	 24, %g1	 
	!LOADAI	197, 3, 195
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 194
	mov	 %g0, %l4	 
	!COMP	195, 196, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 195 (var null) to 196 (var null), store in cc-reg
	!MOVEQ	2, 3, 194
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	194, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 194) to true
	!CBREQ	2, .S63, .S64
	be	 .S63	 	!if: branch true: '.S63' false: '.S64'
	nop
	ba	.S64 	!if: branch true: '.S63' false: '.S64'
	nop
 .S63:
 !#if-guard:
	!LOADI	1, 200
	mov	 1, %l2	 	!int: reg 200 gets val 1
	!MOV	145, 201
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 201
	!LOADI	28, 3
	mov	 28, %g1	 
	!LOADAI	201, 3, 199
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 198
	mov	 %g0, %l4	 
	!COMP	199, 200, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 199 (var null) to 200 (var null), store in cc-reg
	!MOVEQ	2, 3, 198
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	198, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 198) to true
	!CBREQ	2, .S66, .S67
	be	 .S66	 	!if: branch true: '.S66' false: '.S67'
	nop
	ba	.S67 	!if: branch true: '.S66' false: '.S67'
	nop
 .S66:
 !#if-guard:
	!LOADI	1, 204
	mov	 1, %l2	 	!int: reg 204 gets val 1
	!MOV	145, 205
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 205
	!LOADI	32, 3
	mov	 32, %g1	 
	!LOADAI	205, 3, 203
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 202
	mov	 %g0, %l4	 
	!COMP	203, 204, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 203 (var null) to 204 (var null), store in cc-reg
	!MOVEQ	2, 3, 202
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	202, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 202) to true
	!CBREQ	2, .S69, .S70
	be	 .S69	 	!if: branch true: '.S69' false: '.S70'
	nop
	ba	.S70 	!if: branch true: '.S69' false: '.S70'
	nop
 .S69:
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
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
	!LOADI	2, 208
	mov	 2, %l2	 	!int: reg 208 gets val 2
	!MOV	145, 209
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 209
	!LOADI	24, 3
	mov	 24, %g1	 
	!LOADAI	209, 3, 207
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 206
	mov	 %g0, %l4	 
	!COMP	207, 208, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 207 (var null) to 208 (var null), store in cc-reg
	!MOVEQ	2, 3, 206
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	206, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 206) to true
	!CBREQ	2, .S72, .S73
	be	 .S72	 	!if: branch true: '.S72' false: '.S73'
	nop
	ba	.S73 	!if: branch true: '.S72' false: '.S73'
	nop
 .S72:
 !#if-guard:
	!LOADI	2, 212
	mov	 2, %l2	 	!int: reg 212 gets val 2
	!MOV	145, 213
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 213
	!LOADI	28, 3
	mov	 28, %g1	 
	!LOADAI	213, 3, 211
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 210
	mov	 %g0, %l4	 
	!COMP	211, 212, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 211 (var null) to 212 (var null), store in cc-reg
	!MOVEQ	2, 3, 210
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	210, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 210) to true
	!CBREQ	2, .S75, .S76
	be	 .S75	 	!if: branch true: '.S75' false: '.S76'
	nop
	ba	.S76 	!if: branch true: '.S75' false: '.S76'
	nop
 .S75:
 !#if-guard:
	!LOADI	2, 216
	mov	 2, %l2	 	!int: reg 216 gets val 2
	!MOV	145, 217
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 217
	!LOADI	32, 3
	mov	 32, %g1	 
	!LOADAI	217, 3, 215
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 214
	mov	 %g0, %l4	 
	!COMP	215, 216, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 215 (var null) to 216 (var null), store in cc-reg
	!MOVEQ	2, 3, 214
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	214, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 214) to true
	!CBREQ	2, .S78, .S79
	be	 .S78	 	!if: branch true: '.S78' false: '.S79'
	nop
	ba	.S79 	!if: branch true: '.S78' false: '.S79'
	nop
 .S78:
	!LOADI	1, 4
	mov	 1, %i0	 	!int: reg 4 gets val 1
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
	!LOADI	1, 220
	mov	 1, %l2	 	!int: reg 220 gets val 1
	!MOV	145, 221
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 221
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	221, 3, 219
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 218
	mov	 %g0, %l4	 
	!COMP	219, 220, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 219 (var null) to 220 (var null), store in cc-reg
	!MOVEQ	2, 3, 218
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	218, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 218) to true
	!CBREQ	2, .S81, .S82
	be	 .S81	 	!if: branch true: '.S81' false: '.S82'
	nop
	ba	.S82 	!if: branch true: '.S81' false: '.S82'
	nop
 .S81:
 !#if-guard:
	!LOADI	1, 224
	mov	 1, %l2	 	!int: reg 224 gets val 1
	!MOV	145, 225
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 225
	!LOADI	12, 3
	mov	 12, %g1	 
	!LOADAI	225, 3, 223
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 222
	mov	 %g0, %l4	 
	!COMP	223, 224, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 223 (var null) to 224 (var null), store in cc-reg
	!MOVEQ	2, 3, 222
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	222, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 222) to true
	!CBREQ	2, .S84, .S85
	be	 .S84	 	!if: branch true: '.S84' false: '.S85'
	nop
	ba	.S85 	!if: branch true: '.S84' false: '.S85'
	nop
 .S84:
 !#if-guard:
	!LOADI	1, 228
	mov	 1, %l2	 	!int: reg 228 gets val 1
	!MOV	145, 229
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 229
	!LOADI	24, 3
	mov	 24, %g1	 
	!LOADAI	229, 3, 227
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 226
	mov	 %g0, %l4	 
	!COMP	227, 228, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 227 (var null) to 228 (var null), store in cc-reg
	!MOVEQ	2, 3, 226
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	226, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 226) to true
	!CBREQ	2, .S87, .S88
	be	 .S87	 	!if: branch true: '.S87' false: '.S88'
	nop
	ba	.S88 	!if: branch true: '.S87' false: '.S88'
	nop
 .S87:
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
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
	!LOADI	2, 232
	mov	 2, %l2	 	!int: reg 232 gets val 2
	!MOV	145, 233
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 233
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	233, 3, 231
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 230
	mov	 %g0, %l4	 
	!COMP	231, 232, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 231 (var null) to 232 (var null), store in cc-reg
	!MOVEQ	2, 3, 230
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	230, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 230) to true
	!CBREQ	2, .S90, .S91
	be	 .S90	 	!if: branch true: '.S90' false: '.S91'
	nop
	ba	.S91 	!if: branch true: '.S90' false: '.S91'
	nop
 .S90:
 !#if-guard:
	!LOADI	2, 236
	mov	 2, %l2	 	!int: reg 236 gets val 2
	!MOV	145, 237
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 237
	!LOADI	12, 3
	mov	 12, %g1	 
	!LOADAI	237, 3, 235
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 234
	mov	 %g0, %l4	 
	!COMP	235, 236, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 235 (var null) to 236 (var null), store in cc-reg
	!MOVEQ	2, 3, 234
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	234, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 234) to true
	!CBREQ	2, .S93, .S94
	be	 .S93	 	!if: branch true: '.S93' false: '.S94'
	nop
	ba	.S94 	!if: branch true: '.S93' false: '.S94'
	nop
 .S93:
 !#if-guard:
	!LOADI	2, 240
	mov	 2, %l2	 	!int: reg 240 gets val 2
	!MOV	145, 241
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 241
	!LOADI	24, 3
	mov	 24, %g1	 
	!LOADAI	241, 3, 239
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 238
	mov	 %g0, %l4	 
	!COMP	239, 240, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 239 (var null) to 240 (var null), store in cc-reg
	!MOVEQ	2, 3, 238
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	238, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 238) to true
	!CBREQ	2, .S96, .S97
	be	 .S96	 	!if: branch true: '.S96' false: '.S97'
	nop
	ba	.S97 	!if: branch true: '.S96' false: '.S97'
	nop
 .S96:
	!LOADI	1, 4
	mov	 1, %i0	 	!int: reg 4 gets val 1
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
	!LOADI	1, 244
	mov	 1, %l2	 	!int: reg 244 gets val 1
	!MOV	145, 245
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 245
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	245, 3, 243
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 242
	mov	 %g0, %l4	 
	!COMP	243, 244, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 243 (var null) to 244 (var null), store in cc-reg
	!MOVEQ	2, 3, 242
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	242, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 242) to true
	!CBREQ	2, .S99, .S100
	be	 .S99	 	!if: branch true: '.S99' false: '.S100'
	nop
	ba	.S100 	!if: branch true: '.S99' false: '.S100'
	nop
 .S99:
 !#if-guard:
	!LOADI	1, 248
	mov	 1, %l2	 	!int: reg 248 gets val 1
	!MOV	145, 249
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 249
	!LOADI	16, 3
	mov	 16, %g1	 
	!LOADAI	249, 3, 247
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 246
	mov	 %g0, %l4	 
	!COMP	247, 248, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 247 (var null) to 248 (var null), store in cc-reg
	!MOVEQ	2, 3, 246
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	246, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 246) to true
	!CBREQ	2, .S102, .S103
	be	 .S102	 	!if: branch true: '.S102' false: '.S103'
	nop
	ba	.S103 	!if: branch true: '.S102' false: '.S103'
	nop
 .S102:
 !#if-guard:
	!LOADI	1, 252
	mov	 1, %l2	 	!int: reg 252 gets val 1
	!MOV	145, 253
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 253
	!LOADI	28, 3
	mov	 28, %g1	 
	!LOADAI	253, 3, 251
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 250
	mov	 %g0, %l4	 
	!COMP	251, 252, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 251 (var null) to 252 (var null), store in cc-reg
	!MOVEQ	2, 3, 250
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	250, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 250) to true
	!CBREQ	2, .S105, .S106
	be	 .S105	 	!if: branch true: '.S105' false: '.S106'
	nop
	ba	.S106 	!if: branch true: '.S105' false: '.S106'
	nop
 .S105:
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
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
	!LOADI	2, 256
	mov	 2, %l2	 	!int: reg 256 gets val 2
	!MOV	145, 257
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 257
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	257, 3, 255
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 254
	mov	 %g0, %l4	 
	!COMP	255, 256, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 255 (var null) to 256 (var null), store in cc-reg
	!MOVEQ	2, 3, 254
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	254, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 254) to true
	!CBREQ	2, .S108, .S109
	be	 .S108	 	!if: branch true: '.S108' false: '.S109'
	nop
	ba	.S109 	!if: branch true: '.S108' false: '.S109'
	nop
 .S108:
 !#if-guard:
	!LOADI	2, 260
	mov	 2, %l2	 	!int: reg 260 gets val 2
	!MOV	145, 261
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 261
	!LOADI	16, 3
	mov	 16, %g1	 
	!LOADAI	261, 3, 259
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 258
	mov	 %g0, %l4	 
	!COMP	259, 260, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 259 (var null) to 260 (var null), store in cc-reg
	!MOVEQ	2, 3, 258
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	258, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 258) to true
	!CBREQ	2, .S111, .S112
	be	 .S111	 	!if: branch true: '.S111' false: '.S112'
	nop
	ba	.S112 	!if: branch true: '.S111' false: '.S112'
	nop
 .S111:
 !#if-guard:
	!LOADI	2, 264
	mov	 2, %l2	 	!int: reg 264 gets val 2
	!MOV	145, 265
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 265
	!LOADI	28, 3
	mov	 28, %g1	 
	!LOADAI	265, 3, 263
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 262
	mov	 %g0, %l4	 
	!COMP	263, 264, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 263 (var null) to 264 (var null), store in cc-reg
	!MOVEQ	2, 3, 262
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	262, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 262) to true
	!CBREQ	2, .S114, .S115
	be	 .S114	 	!if: branch true: '.S114' false: '.S115'
	nop
	ba	.S115 	!if: branch true: '.S114' false: '.S115'
	nop
 .S114:
	!LOADI	1, 4
	mov	 1, %i0	 	!int: reg 4 gets val 1
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
	!LOADI	1, 268
	mov	 1, %l2	 	!int: reg 268 gets val 1
	!MOV	145, 269
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 269
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	269, 3, 267
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 266
	mov	 %g0, %l4	 
	!COMP	267, 268, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 267 (var null) to 268 (var null), store in cc-reg
	!MOVEQ	2, 3, 266
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	266, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 266) to true
	!CBREQ	2, .S117, .S118
	be	 .S117	 	!if: branch true: '.S117' false: '.S118'
	nop
	ba	.S118 	!if: branch true: '.S117' false: '.S118'
	nop
 .S117:
 !#if-guard:
	!LOADI	1, 272
	mov	 1, %l2	 	!int: reg 272 gets val 1
	!MOV	145, 273
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 273
	!LOADI	20, 3
	mov	 20, %g1	 
	!LOADAI	273, 3, 271
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 270
	mov	 %g0, %l4	 
	!COMP	271, 272, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 271 (var null) to 272 (var null), store in cc-reg
	!MOVEQ	2, 3, 270
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	270, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 270) to true
	!CBREQ	2, .S120, .S121
	be	 .S120	 	!if: branch true: '.S120' false: '.S121'
	nop
	ba	.S121 	!if: branch true: '.S120' false: '.S121'
	nop
 .S120:
 !#if-guard:
	!LOADI	1, 276
	mov	 1, %l2	 	!int: reg 276 gets val 1
	!MOV	145, 277
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 277
	!LOADI	32, 3
	mov	 32, %g1	 
	!LOADAI	277, 3, 275
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 274
	mov	 %g0, %l4	 
	!COMP	275, 276, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 275 (var null) to 276 (var null), store in cc-reg
	!MOVEQ	2, 3, 274
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	274, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 274) to true
	!CBREQ	2, .S123, .S124
	be	 .S123	 	!if: branch true: '.S123' false: '.S124'
	nop
	ba	.S124 	!if: branch true: '.S123' false: '.S124'
	nop
 .S123:
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
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
	!LOADI	2, 280
	mov	 2, %l2	 	!int: reg 280 gets val 2
	!MOV	145, 281
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 281
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	281, 3, 279
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 278
	mov	 %g0, %l4	 
	!COMP	279, 280, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 279 (var null) to 280 (var null), store in cc-reg
	!MOVEQ	2, 3, 278
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	278, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 278) to true
	!CBREQ	2, .S126, .S127
	be	 .S126	 	!if: branch true: '.S126' false: '.S127'
	nop
	ba	.S127 	!if: branch true: '.S126' false: '.S127'
	nop
 .S126:
 !#if-guard:
	!LOADI	2, 284
	mov	 2, %l2	 	!int: reg 284 gets val 2
	!MOV	145, 285
	mov	 %l1, %l3	 	!id: move reg 145 (var checkWinnerboard) to reg 285
	!LOADI	20, 3
	mov	 20, %g1	 
	!LOADAI	285, 3, 283
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 282
	mov	 %g0, %l4	 
	!COMP	283, 284, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 283 (var null) to 284 (var null), store in cc-reg
	!MOVEQ	2, 3, 282
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	282, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 282) to true
	!CBREQ	2, .S129, .S130
	be	 .S129	 	!if: branch true: '.S129' false: '.S130'
	nop
	ba	.S130 	!if: branch true: '.S129' false: '.S130'
	nop
 .S129:
 !#if-guard:
	!LOADI	2, 288
	mov	 2, %l2	 	!int: reg 288 gets val 2
	!MOV	145, 289
	mov	 %l1, %l1	 	!id: move reg 145 (var checkWinnerboard) to reg 289
	!LOADI	32, 3
	mov	 32, %g1	 
	!LOADAI	289, 3, 287
	ld	[%l1 + %g1], %l1
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 286
	mov	 %g0, %l0	 
	!COMP	287, 288, 2
	cmp	 %l1, %l2	 	!expression: compare: reg 287 (var null) to 288 (var null), store in cc-reg
	!MOVEQ	2, 3, 286
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	286, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 286) to true
	!CBREQ	2, .S132, .S133
	be	 .S132	 	!if: branch true: '.S132' false: '.S133'
	nop
	ba	.S133 	!if: branch true: '.S132' false: '.S133'
	nop
 .S132:
	!LOADI	1, 4
	mov	 1, %i0	 	!int: reg 4 gets val 1
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
	!LOADI	1, 290
	mov	 1, %l0	 	!int: reg 290 gets val 1
	!LOADI	-1, 291
	mov	 -1, %l1	 
	!MULT	290, 291, 4
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
	!STOREINARGUMENT	10, 79
	mov	 %i0, %l3	 
	!STOREINARGUMENT	11, 80
	mov	 %i1, %l2	 
	!STOREINARGUMENT	12, 81
	mov	 %i2, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	1, 84
	mov	 1, %l4	 	!int: reg 84 gets val 1
	!MOV	81, 83
	mov	 %l1, %l5	 	!id: move reg 81 (var placePieceplacement) to reg 83
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 82
	mov	 %g0, %l6	 
	!COMP	83, 84, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 83 (var null) to 84 (var null), store in cc-reg
	!MOVEQ	2, 3, 82
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	82, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 82) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	80, 85
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 85
	!MOV	79, 87
	mov	 %l3, %l0	 
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	87, 3, 86
	ld	[%l0 + %g1], %l2
	!MOV	85, 86
	mov	 %l1, %l2	 
	!STOREAI	86, 87, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
 !#if-guard:
	!LOADI	2, 91
	mov	 2, %l4	 	!int: reg 91 gets val 2
	!MOV	81, 90
	mov	 %l1, %l5	 	!id: move reg 81 (var placePieceplacement) to reg 90
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 89
	mov	 %g0, %l6	 
	!COMP	90, 91, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 90 (var null) to 91 (var null), store in cc-reg
	!MOVEQ	2, 3, 89
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	89, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 89) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	80, 92
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 92
	!MOV	79, 94
	mov	 %l3, %l0	 
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	94, 3, 93
	ld	[%l0 + %g1], %l2
	!MOV	92, 93
	mov	 %l1, %l2	 
	!STOREAI	93, 94, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
	!JUMPI	.S2
	ba	 .S2	 	!if: jump to #end-if '.S2'
	nop
 .S4:
 !#if-guard:
	!LOADI	3, 98
	mov	 3, %l4	 	!int: reg 98 gets val 3
	!MOV	81, 97
	mov	 %l1, %l5	 	!id: move reg 81 (var placePieceplacement) to reg 97
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 96
	mov	 %g0, %l6	 
	!COMP	97, 98, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 97 (var null) to 98 (var null), store in cc-reg
	!MOVEQ	2, 3, 96
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	96, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 96) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	80, 99
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 99
	!MOV	79, 101
	mov	 %l3, %l0	 
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	101, 3, 100
	ld	[%l0 + %g1], %l2
	!MOV	99, 100
	mov	 %l1, %l2	 
	!STOREAI	100, 101, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 .S7:
 !#if-guard:
	!LOADI	4, 105
	mov	 4, %l4	 	!int: reg 105 gets val 4
	!MOV	81, 104
	mov	 %l1, %l5	 	!id: move reg 81 (var placePieceplacement) to reg 104
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 103
	mov	 %g0, %l6	 
	!COMP	104, 105, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 104 (var null) to 105 (var null), store in cc-reg
	!MOVEQ	2, 3, 103
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	103, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 103) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!MOV	80, 106
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 106
	!MOV	79, 108
	mov	 %l3, %l0	 
	!LOADI	12, 3
	mov	 12, %g1	 
	!LOADAI	108, 3, 107
	ld	[%l0 + %g1], %l2
	!MOV	106, 107
	mov	 %l1, %l2	 
	!STOREAI	107, 108, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
	!JUMPI	.S8
	ba	 .S8	 	!if: jump to #end-if '.S8'
	nop
 .S10:
 !#if-guard:
	!LOADI	5, 112
	mov	 5, %l4	 	!int: reg 112 gets val 5
	!MOV	81, 111
	mov	 %l1, %l5	 	!id: move reg 81 (var placePieceplacement) to reg 111
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 110
	mov	 %g0, %l6	 
	!COMP	111, 112, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 111 (var null) to 112 (var null), store in cc-reg
	!MOVEQ	2, 3, 110
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	110, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 110) to true
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!MOV	80, 113
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 113
	!MOV	79, 115
	mov	 %l3, %l0	 
	!LOADI	16, 3
	mov	 16, %g1	 
	!LOADAI	115, 3, 114
	ld	[%l0 + %g1], %l2
	!MOV	113, 114
	mov	 %l1, %l2	 
	!STOREAI	114, 115, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S14
	ba	 .S14	 	!then: jump to #end-if '.S14'
	nop
 .S14:
	!JUMPI	.S11
	ba	 .S11	 	!if: jump to #end-if '.S11'
	nop
 .S13:
 !#if-guard:
	!LOADI	6, 119
	mov	 6, %l4	 	!int: reg 119 gets val 6
	!MOV	81, 118
	mov	 %l1, %l5	 	!id: move reg 81 (var placePieceplacement) to reg 118
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 117
	mov	 %g0, %l6	 
	!COMP	118, 119, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 118 (var null) to 119 (var null), store in cc-reg
	!MOVEQ	2, 3, 117
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	117, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 117) to true
	!CBREQ	2, .S15, .S16
	be	 .S15	 	!if: branch true: '.S15' false: '.S16'
	nop
	ba	.S16 	!if: branch true: '.S15' false: '.S16'
	nop
 .S15:
	!MOV	80, 120
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 120
	!MOV	79, 122
	mov	 %l3, %l0	 
	!LOADI	20, 3
	mov	 20, %g1	 
	!LOADAI	122, 3, 121
	ld	[%l0 + %g1], %l2
	!MOV	120, 121
	mov	 %l1, %l2	 
	!STOREAI	121, 122, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S17
	ba	 .S17	 	!then: jump to #end-if '.S17'
	nop
 .S17:
	!JUMPI	.S14
	ba	 .S14	 	!if: jump to #end-if '.S14'
	nop
 .S16:
 !#if-guard:
	!LOADI	7, 126
	mov	 7, %l4	 	!int: reg 126 gets val 7
	!MOV	81, 125
	mov	 %l1, %l5	 	!id: move reg 81 (var placePieceplacement) to reg 125
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 124
	mov	 %g0, %l6	 
	!COMP	125, 126, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 125 (var null) to 126 (var null), store in cc-reg
	!MOVEQ	2, 3, 124
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	124, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 124) to true
	!CBREQ	2, .S18, .S19
	be	 .S18	 	!if: branch true: '.S18' false: '.S19'
	nop
	ba	.S19 	!if: branch true: '.S18' false: '.S19'
	nop
 .S18:
	!MOV	80, 127
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 127
	!MOV	79, 129
	mov	 %l3, %l0	 
	!LOADI	24, 3
	mov	 24, %g1	 
	!LOADAI	129, 3, 128
	ld	[%l0 + %g1], %l2
	!MOV	127, 128
	mov	 %l1, %l2	 
	!STOREAI	128, 129, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S20
	ba	 .S20	 	!then: jump to #end-if '.S20'
	nop
 .S20:
	!JUMPI	.S17
	ba	 .S17	 	!if: jump to #end-if '.S17'
	nop
 .S19:
 !#if-guard:
	!LOADI	8, 133
	mov	 8, %l4	 	!int: reg 133 gets val 8
	!MOV	81, 132
	mov	 %l1, %l5	 	!id: move reg 81 (var placePieceplacement) to reg 132
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 131
	mov	 %g0, %l6	 
	!COMP	132, 133, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 132 (var null) to 133 (var null), store in cc-reg
	!MOVEQ	2, 3, 131
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	131, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 131) to true
	!CBREQ	2, .S21, .S22
	be	 .S21	 	!if: branch true: '.S21' false: '.S22'
	nop
	ba	.S22 	!if: branch true: '.S21' false: '.S22'
	nop
 .S21:
	!MOV	80, 134
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 134
	!MOV	79, 136
	mov	 %l3, %l0	 
	!LOADI	28, 3
	mov	 28, %g1	 
	!LOADAI	136, 3, 135
	ld	[%l0 + %g1], %l2
	!MOV	134, 135
	mov	 %l1, %l2	 
	!STOREAI	135, 136, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S23
	ba	 .S23	 	!then: jump to #end-if '.S23'
	nop
 .S23:
	!JUMPI	.S20
	ba	 .S20	 	!if: jump to #end-if '.S20'
	nop
 .S22:
 !#if-guard:
	!LOADI	9, 140
	mov	 9, %l4	 	!int: reg 140 gets val 9
	!MOV	81, 139
	mov	 %l1, %l1	 	!id: move reg 81 (var placePieceplacement) to reg 139
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 138
	mov	 %g0, %l0	 
	!COMP	139, 140, 2
	cmp	 %l1, %l4	 	!expression: compare: reg 139 (var null) to 140 (var null), store in cc-reg
	!MOVEQ	2, 3, 138
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	138, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 138) to true
	!CBREQ	2, .S24, .S25
	be	 .S24	 	!if: branch true: '.S24' false: '.S25'
	nop
	ba	.S25 	!if: branch true: '.S24' false: '.S25'
	nop
 .S24:
	!MOV	80, 141
	mov	 %l2, %l1	 	!id: move reg 80 (var placePieceturn) to reg 141
	!MOV	79, 143
	mov	 %l3, %l0	 
	!LOADI	32, 3
	mov	 32, %g1	 
	!LOADAI	143, 3, 142
	ld	[%l0 + %g1], %l2
	!MOV	141, 142
	mov	 %l1, %l2	 
	!STOREAI	142, 143, 3
	st	%l2, [%l0 + %g1]
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
	!LOADI	123, 76
	mov	 123, %l0	 	!int: reg 76 gets val 123
	!PRINTLN	76
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	456, 77
	mov	 456, %l0	 	!int: reg 77 gets val 456
	!PRINTLN	77
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	789, 78
	mov	 789, %l0	 	!int: reg 78 gets val 789
	!PRINTLN	78
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
	!STOREINARGUMENT	10, 57
	mov	 %i0, %l0	 
 !#function-body:
	!MOV	57, 59
	mov	 %l0, %l1	 	!id: move reg 57 (var printBoardboard) to reg 59
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	59, 3, 58
	ld	[%l1 + %g1], %l1
	!PRINT	58
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	57, 61
	mov	 %l0, %l1	 	!id: move reg 57 (var printBoardboard) to reg 61
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	61, 3, 60
	ld	[%l1 + %g1], %l1
	!PRINT	60
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	57, 63
	mov	 %l0, %l1	 	!id: move reg 57 (var printBoardboard) to reg 63
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	63, 3, 62
	ld	[%l1 + %g1], %l1
	!PRINTLN	62
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	57, 65
	mov	 %l0, %l1	 	!id: move reg 57 (var printBoardboard) to reg 65
	!LOADI	12, 3
	mov	 12, %g1	 
	!LOADAI	65, 3, 64
	ld	[%l1 + %g1], %l1
	!PRINT	64
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	57, 67
	mov	 %l0, %l1	 	!id: move reg 57 (var printBoardboard) to reg 67
	!LOADI	16, 3
	mov	 16, %g1	 
	!LOADAI	67, 3, 66
	ld	[%l1 + %g1], %l1
	!PRINT	66
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	57, 69
	mov	 %l0, %l1	 	!id: move reg 57 (var printBoardboard) to reg 69
	!LOADI	20, 3
	mov	 20, %g1	 
	!LOADAI	69, 3, 68
	ld	[%l1 + %g1], %l1
	!PRINTLN	68
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	57, 71
	mov	 %l0, %l1	 	!id: move reg 57 (var printBoardboard) to reg 71
	!LOADI	24, 3
	mov	 24, %g1	 
	!LOADAI	71, 3, 70
	ld	[%l1 + %g1], %l1
	!PRINT	70
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	57, 73
	mov	 %l0, %l1	 	!id: move reg 57 (var printBoardboard) to reg 73
	!LOADI	28, 3
	mov	 28, %g1	 
	!LOADAI	73, 3, 72
	ld	[%l1 + %g1], %l1
	!PRINT	72
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	57, 75
	mov	 %l0, %l0	 	!id: move reg 57 (var printBoardboard) to reg 75
	!LOADI	32, 3
	mov	 32, %g1	 
	!LOADAI	75, 3, 74
	ld	[%l0 + %g1], %l0
	!PRINTLN	74
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
	!STOREINARGUMENT	10, 20
	mov	 %i0, %l0	 
 !#function-body:
	!LOADI	0, 21
	mov	 0, %l1	 	!int: reg 21 gets val 0
	!MOV	20, 23
	mov	 %l0, %l2	 
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	23, 3, 22
	ld	[%l2 + %g1], %l3
	!MOV	21, 22
	mov	 %l1, %l3	 
	!STOREAI	22, 23, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 25
	mov	 0, %l1	 	!int: reg 25 gets val 0
	!MOV	20, 27
	mov	 %l0, %l2	 
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	27, 3, 26
	ld	[%l2 + %g1], %l3
	!MOV	25, 26
	mov	 %l1, %l3	 
	!STOREAI	26, 27, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 29
	mov	 0, %l1	 	!int: reg 29 gets val 0
	!MOV	20, 31
	mov	 %l0, %l2	 
	!LOADI	8, 3
	mov	 8, %g1	 
	!LOADAI	31, 3, 30
	ld	[%l2 + %g1], %l3
	!MOV	29, 30
	mov	 %l1, %l3	 
	!STOREAI	30, 31, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 33
	mov	 0, %l1	 	!int: reg 33 gets val 0
	!MOV	20, 35
	mov	 %l0, %l2	 
	!LOADI	12, 3
	mov	 12, %g1	 
	!LOADAI	35, 3, 34
	ld	[%l2 + %g1], %l3
	!MOV	33, 34
	mov	 %l1, %l3	 
	!STOREAI	34, 35, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 37
	mov	 0, %l1	 	!int: reg 37 gets val 0
	!MOV	20, 39
	mov	 %l0, %l2	 
	!LOADI	16, 3
	mov	 16, %g1	 
	!LOADAI	39, 3, 38
	ld	[%l2 + %g1], %l3
	!MOV	37, 38
	mov	 %l1, %l3	 
	!STOREAI	38, 39, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 41
	mov	 0, %l1	 	!int: reg 41 gets val 0
	!MOV	20, 43
	mov	 %l0, %l2	 
	!LOADI	20, 3
	mov	 20, %g1	 
	!LOADAI	43, 3, 42
	ld	[%l2 + %g1], %l3
	!MOV	41, 42
	mov	 %l1, %l3	 
	!STOREAI	42, 43, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 45
	mov	 0, %l1	 	!int: reg 45 gets val 0
	!MOV	20, 47
	mov	 %l0, %l2	 
	!LOADI	24, 3
	mov	 24, %g1	 
	!LOADAI	47, 3, 46
	ld	[%l2 + %g1], %l3
	!MOV	45, 46
	mov	 %l1, %l3	 
	!STOREAI	46, 47, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 49
	mov	 0, %l1	 	!int: reg 49 gets val 0
	!MOV	20, 51
	mov	 %l0, %l2	 
	!LOADI	28, 3
	mov	 28, %g1	 
	!LOADAI	51, 3, 50
	ld	[%l2 + %g1], %l3
	!MOV	49, 50
	mov	 %l1, %l3	 
	!STOREAI	50, 51, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 53
	mov	 0, %l1	 	!int: reg 53 gets val 0
	!MOV	20, 55
	mov	 %l0, %l0	 
	!LOADI	32, 3
	mov	 32, %g1	 
	!LOADAI	55, 3, 54
	ld	[%l0 + %g1], %l2
	!MOV	53, 54
	mov	 %l1, %l2	 
	!STOREAI	54, 55, 3
	st	%l2, [%l0 + %g1]
 !#function-exit:
 