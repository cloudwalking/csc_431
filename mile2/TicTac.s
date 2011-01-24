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
	!LOADI	0, 294
	set	 0, %l1	 	!int: reg 294 gets val 0
	!MOV	292, 295
	mov	 %l2, %l2	 	!lvalue id: move reg 292 (var i) to reg 295
	!MOV	294, 295
	mov	 %l1, %l2	 
	!MOV	295, 292
	mov	 %l2, %l2	 
	!LOADI	0, 297
	set	 0, %l1	 	!int: reg 297 gets val 0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	288, 298
	mov	 %l0, %l5	 	!lvalue id: move reg 288 (var turn) to reg 298
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!MOV	297, 298
	mov	 %l1, %l5	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	298, 288
	mov	 %l5, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!LOADI	0, 300
	set	 0, %l1	 	!int: reg 300 gets val 0
	!MOV	289, 301
	mov	 %l7, %l5	 	!lvalue id: move reg 289 (var space1) to reg 301
	!MOV	300, 301
	mov	 %l1, %l5	 
	!MOV	301, 289
	mov	 %l5, %l7	 
	!LOADI	0, 303
	set	 0, %l1	 	!int: reg 303 gets val 0
	!MOV	290, 304
	mov	 %l6, %l5	 	!lvalue id: move reg 290 (var space2) to reg 304
	!MOV	303, 304
	mov	 %l1, %l5	 
	!MOV	304, 290
	mov	 %l5, %l6	 
	!LOADI	1, 308
	set	 1, %l1	 	!int: reg 308 gets val 1
	!LOADI	-1, 309
	mov	 -1, %l5	 
	!MULT	308, 309, 306
	smul	 %l1, %l5, %l1	 
	!MOV	291, 307
	mov	 %l4, %l4	 	!lvalue id: move reg 291 (var winner) to reg 307
	!MOV	306, 307
	mov	 %l1, %l4	 
	!MOV	307, 291
	mov	 %l4, %l4	 
	!LOADI	36, 1
	set	 36, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 311
	mov	 %o0, %l1	 
	!MOV	293, 312
	mov	 %l3, %l3	 	!lvalue id: move reg 293 (var board) to reg 312
	!MOV	311, 312
	mov	 %l1, %l3	 
	!MOV	312, 293
	mov	 %l3, %l3	 
	!MOV	293, 314
	mov	 %l3, %l1	 	!id: move reg 293 (var mainboard) to reg 314
	!STOREOUTARGUMENT	314, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 314to register outReg 1
	!CALL	cleanBoard
	call	 cleanBoard	
	nop
 !#while-guard:
.S135:
	!LOADI	8, 321
	set	 8, %l1	 	!int: reg 321 gets val 8
	!MOV	292, 320
	mov	 %l2, %l5	 	!id: move reg 292 (var maini) to reg 320
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 317
	mov	 %g0, %g3	 
	!COMP	320, 321, 2
	cmp	 %l5, %l1	 	!expression: compare: reg 320 (var null) to 321 (var null), store in cc-reg
	!MOVNE	2, 3, 317
	movne	 %icc, %g1, %g3	 
	!LOADI	0, 319
	set	 0, %l1	 	!int: reg 319 gets val 0
	!MOV	291, 318
	mov	 %l4, %l5	 	!id: move reg 291 (var mainwinner) to reg 318
	!LOADI	1, 3
	set	 1, %g1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	0, 316
	mov	 %g0, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!COMP	318, 319, 2
	cmp	 %l5, %l1	 	!expression: compare: reg 318 (var null) to 319 (var null), store in cc-reg
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOVLT	2, 3, 316
	movl	 %icc, %g1, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!AND	316, 317, 315
	and	 %l0, %g3, %l1	 	!expression: reg 316 (var null) && 317 in reg 315 (var null)
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	315, 3, 2
	cmp	 %l1, %g1	 	!while: compare guard result (reg 315) to true
	!CBREQ	2, .S136, .S137
	be	 .S136	 	!while: branch true: '.S136' false: '.S137'
	nop
	ba	.S137 	!while: branch true: '.S136' false: '.S137'
	nop
 .S136:
	!MOV	293, 322
	mov	 %l3, %l1	 	!id: move reg 293 (var mainboard) to reg 322
	!STOREOUTARGUMENT	322, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 322to register outReg 1
	!CALL	printBoard
	call	 printBoard	
	nop
 !#if-guard:
	!LOADI	0, 325
	set	 0, %l1	 	!int: reg 325 gets val 0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	288, 324
	mov	 %l0, %l5	 	!id: move reg 288 (var mainturn) to reg 324
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 323
	mov	 %g0, %g3	 
	!COMP	324, 325, 2
	cmp	 %l5, %l1	 	!expression: compare: reg 324 (var null) to 325 (var null), store in cc-reg
	!MOVEQ	2, 3, 323
	move	 %icc, %g1, %g3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	323, 3, 2
	cmp	 %g3, %g1	 	!if: compare guard result (reg 323) to true
	!CBREQ	2, .S138, .S139
	be	 .S138	 	!if: branch true: '.S138' false: '.S139'
	nop
	ba	.S139 	!if: branch true: '.S138' false: '.S139'
	nop
 .S138:
	!LOADI	1, 329
	set	 1, %l5	 	!int: reg 329 gets val 1
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	288, 328
	mov	 %l0, %l1	 	!id: move reg 288 (var mainturn) to reg 328
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!ADD	328, 329, 326
	add	 %l1, %l5, %l5	 	!expression: reg 328 (var null) + 329 in reg 326 (var null)
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	288, 327
	mov	 %l0, %l1	 	!lvalue id: move reg 288 (var turn) to reg 327
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!MOV	326, 327
	mov	 %l5, %l1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	327, 288
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	289, 331
	mov	 %l7, %l1	 	!lvalue id: move reg 289 (var space1) to reg 331
	!READ	331
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	331, 289
	mov	 %l1, %l7	 
	!MOV	293, 333
	mov	 %l3, %l1	 	!id: move reg 293 (var mainboard) to reg 333
	!STOREOUTARGUMENT	333, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 333to register outReg 1
	!LOADI	1, 333
	set	 1, %l1	 	!int: reg 333 gets val 1
	!STOREOUTARGUMENT	333, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 333to register outReg 2
	!MOV	289, 333
	mov	 %l7, %l1	 	!id: move reg 289 (var mainspace1) to reg 333
	!STOREOUTARGUMENT	333, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 333to register outReg 3
	!CALL	placePiece
	call	 placePiece	
	nop
	!JUMPI	.S140
	ba	 .S140	 	!then: jump to #end-if '.S140'
	nop
 .S140:
	!MOV	293, 344
	mov	 %l3, %l1	 	!id: move reg 293 (var mainboard) to reg 344
	!STOREOUTARGUMENT	344, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 344to register outReg 1
	!CALL	checkWinner
	call	 checkWinner	
	nop
	!MOV	1, 342
	mov	 %o0, %l0	 
	!MOV	291, 343
	mov	 %l4, %l1	 	!lvalue id: move reg 291 (var winner) to reg 343
	!MOV	342, 343
	mov	 %l0, %l1	 
	!MOV	343, 291
	mov	 %l1, %l4	 
	!LOADI	1, 349
	set	 1, %l0	 	!int: reg 349 gets val 1
	!MOV	292, 348
	mov	 %l2, %l1	 	!id: move reg 292 (var maini) to reg 348
	!ADD	348, 349, 346
	add	 %l1, %l0, %l1	 	!expression: reg 348 (var null) + 349 in reg 346 (var null)
	!MOV	292, 347
	mov	 %l2, %l0	 	!lvalue id: move reg 292 (var i) to reg 347
	!MOV	346, 347
	mov	 %l1, %l0	 
	!MOV	347, 292
	mov	 %l0, %l2	 
	!JUMPI	.S135
	ba	 .S135	 	!while: jump back to guard
	nop
 .S139:
	!LOADI	1, 337
	set	 1, %l5	 	!int: reg 337 gets val 1
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	288, 336
	mov	 %l0, %l1	 	!id: move reg 288 (var mainturn) to reg 336
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!SUB	336, 337, 334
	sub	 %l1, %l5, %l5	 	!expression: reg 336 (var null) - 337 in reg 334 (var null)
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	288, 335
	mov	 %l0, %l1	 	!lvalue id: move reg 288 (var turn) to reg 335
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!MOV	334, 335
	mov	 %l5, %l1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	335, 288
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	290, 339
	mov	 %l6, %l1	 	!lvalue id: move reg 290 (var space2) to reg 339
	!READ	339
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	339, 290
	mov	 %l1, %l6	 
	!MOV	293, 341
	mov	 %l3, %l1	 	!id: move reg 293 (var mainboard) to reg 341
	!STOREOUTARGUMENT	341, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 341to register outReg 1
	!LOADI	2, 341
	set	 2, %l1	 	!int: reg 341 gets val 2
	!STOREOUTARGUMENT	341, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 341to register outReg 2
	!MOV	290, 341
	mov	 %l6, %l1	 	!id: move reg 290 (var mainspace2) to reg 341
	!STOREOUTARGUMENT	341, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 341to register outReg 3
	!CALL	placePiece
	call	 placePiece	
	nop
	!JUMPI	.S140
	ba	 .S140	 	!if: jump to #end-if '.S140'
	nop
 .S137:
	!LOADI	1, 353
	set	 1, %l0	 	!int: reg 353 gets val 1
	!MOV	291, 352
	mov	 %l4, %l1	 	!id: move reg 291 (var mainwinner) to reg 352
	!ADD	352, 353, 351
	add	 %l1, %l0, %l0	 	!expression: reg 352 (var null) + 353 in reg 351 (var null)
	!PRINTLN	351
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
	.global	checkWinner
	.type	checkWinner, #function
	.proc	04
!#function-entry:
checkWinner:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 141
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	1, 144
	set	 1, %l2	 	!int: reg 144 gets val 1
	!MOV	141, 145
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 145
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	145, 3, 143
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 142
	mov	 %g0, %l4	 
	!COMP	143, 144, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 143 (var null) to 144 (var null), store in cc-reg
	!MOVEQ	2, 3, 142
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	142, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 142) to true
	!CBREQ	2, .S27, .S28
	be	 .S27	 	!if: branch true: '.S27' false: '.S28'
	nop
	ba	.S28 	!if: branch true: '.S27' false: '.S28'
	nop
 .S27:
 !#if-guard:
	!LOADI	1, 148
	set	 1, %l2	 	!int: reg 148 gets val 1
	!MOV	141, 149
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 149
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	149, 3, 147
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 146
	mov	 %g0, %l4	 
	!COMP	147, 148, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 147 (var null) to 148 (var null), store in cc-reg
	!MOVEQ	2, 3, 146
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	146, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 146) to true
	!CBREQ	2, .S30, .S31
	be	 .S30	 	!if: branch true: '.S30' false: '.S31'
	nop
	ba	.S31 	!if: branch true: '.S30' false: '.S31'
	nop
 .S30:
 !#if-guard:
	!LOADI	1, 152
	set	 1, %l2	 	!int: reg 152 gets val 1
	!MOV	141, 153
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 153
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	153, 3, 151
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 150
	mov	 %g0, %l4	 
	!COMP	151, 152, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 151 (var null) to 152 (var null), store in cc-reg
	!MOVEQ	2, 3, 150
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	150, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 150) to true
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
	!LOADI	2, 156
	set	 2, %l2	 	!int: reg 156 gets val 2
	!MOV	141, 157
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 157
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	157, 3, 155
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 154
	mov	 %g0, %l4	 
	!COMP	155, 156, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 155 (var null) to 156 (var null), store in cc-reg
	!MOVEQ	2, 3, 154
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	154, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 154) to true
	!CBREQ	2, .S36, .S37
	be	 .S36	 	!if: branch true: '.S36' false: '.S37'
	nop
	ba	.S37 	!if: branch true: '.S36' false: '.S37'
	nop
 .S36:
 !#if-guard:
	!LOADI	2, 160
	set	 2, %l2	 	!int: reg 160 gets val 2
	!MOV	141, 161
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 161
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	161, 3, 159
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 158
	mov	 %g0, %l4	 
	!COMP	159, 160, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 159 (var null) to 160 (var null), store in cc-reg
	!MOVEQ	2, 3, 158
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	158, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 158) to true
	!CBREQ	2, .S39, .S40
	be	 .S39	 	!if: branch true: '.S39' false: '.S40'
	nop
	ba	.S40 	!if: branch true: '.S39' false: '.S40'
	nop
 .S39:
 !#if-guard:
	!LOADI	2, 164
	set	 2, %l2	 	!int: reg 164 gets val 2
	!MOV	141, 165
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 165
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	165, 3, 163
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 162
	mov	 %g0, %l4	 
	!COMP	163, 164, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 163 (var null) to 164 (var null), store in cc-reg
	!MOVEQ	2, 3, 162
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	162, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 162) to true
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
	!LOADI	1, 168
	set	 1, %l2	 	!int: reg 168 gets val 1
	!MOV	141, 169
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 169
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	169, 3, 167
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 166
	mov	 %g0, %l4	 
	!COMP	167, 168, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 167 (var null) to 168 (var null), store in cc-reg
	!MOVEQ	2, 3, 166
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	166, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 166) to true
	!CBREQ	2, .S45, .S46
	be	 .S45	 	!if: branch true: '.S45' false: '.S46'
	nop
	ba	.S46 	!if: branch true: '.S45' false: '.S46'
	nop
 .S45:
 !#if-guard:
	!LOADI	1, 172
	set	 1, %l2	 	!int: reg 172 gets val 1
	!MOV	141, 173
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 173
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	173, 3, 171
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 170
	mov	 %g0, %l4	 
	!COMP	171, 172, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 171 (var null) to 172 (var null), store in cc-reg
	!MOVEQ	2, 3, 170
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	170, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 170) to true
	!CBREQ	2, .S48, .S49
	be	 .S48	 	!if: branch true: '.S48' false: '.S49'
	nop
	ba	.S49 	!if: branch true: '.S48' false: '.S49'
	nop
 .S48:
 !#if-guard:
	!LOADI	1, 176
	set	 1, %l2	 	!int: reg 176 gets val 1
	!MOV	141, 177
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 177
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	177, 3, 175
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 174
	mov	 %g0, %l4	 
	!COMP	175, 176, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 175 (var null) to 176 (var null), store in cc-reg
	!MOVEQ	2, 3, 174
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	174, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 174) to true
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
	!LOADI	2, 180
	set	 2, %l2	 	!int: reg 180 gets val 2
	!MOV	141, 181
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 181
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	181, 3, 179
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 178
	mov	 %g0, %l4	 
	!COMP	179, 180, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 179 (var null) to 180 (var null), store in cc-reg
	!MOVEQ	2, 3, 178
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	178, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 178) to true
	!CBREQ	2, .S54, .S55
	be	 .S54	 	!if: branch true: '.S54' false: '.S55'
	nop
	ba	.S55 	!if: branch true: '.S54' false: '.S55'
	nop
 .S54:
 !#if-guard:
	!LOADI	2, 184
	set	 2, %l2	 	!int: reg 184 gets val 2
	!MOV	141, 185
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 185
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	185, 3, 183
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 182
	mov	 %g0, %l4	 
	!COMP	183, 184, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 183 (var null) to 184 (var null), store in cc-reg
	!MOVEQ	2, 3, 182
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	182, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 182) to true
	!CBREQ	2, .S57, .S58
	be	 .S57	 	!if: branch true: '.S57' false: '.S58'
	nop
	ba	.S58 	!if: branch true: '.S57' false: '.S58'
	nop
 .S57:
 !#if-guard:
	!LOADI	2, 188
	set	 2, %l2	 	!int: reg 188 gets val 2
	!MOV	141, 189
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 189
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	189, 3, 187
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 186
	mov	 %g0, %l4	 
	!COMP	187, 188, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 187 (var null) to 188 (var null), store in cc-reg
	!MOVEQ	2, 3, 186
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	186, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 186) to true
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
	!LOADI	1, 192
	set	 1, %l2	 	!int: reg 192 gets val 1
	!MOV	141, 193
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 193
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	193, 3, 191
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 190
	mov	 %g0, %l4	 
	!COMP	191, 192, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 191 (var null) to 192 (var null), store in cc-reg
	!MOVEQ	2, 3, 190
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	190, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 190) to true
	!CBREQ	2, .S63, .S64
	be	 .S63	 	!if: branch true: '.S63' false: '.S64'
	nop
	ba	.S64 	!if: branch true: '.S63' false: '.S64'
	nop
 .S63:
 !#if-guard:
	!LOADI	1, 196
	set	 1, %l2	 	!int: reg 196 gets val 1
	!MOV	141, 197
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 197
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	197, 3, 195
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 194
	mov	 %g0, %l4	 
	!COMP	195, 196, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 195 (var null) to 196 (var null), store in cc-reg
	!MOVEQ	2, 3, 194
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	194, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 194) to true
	!CBREQ	2, .S66, .S67
	be	 .S66	 	!if: branch true: '.S66' false: '.S67'
	nop
	ba	.S67 	!if: branch true: '.S66' false: '.S67'
	nop
 .S66:
 !#if-guard:
	!LOADI	1, 200
	set	 1, %l2	 	!int: reg 200 gets val 1
	!MOV	141, 201
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 201
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	201, 3, 199
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 198
	mov	 %g0, %l4	 
	!COMP	199, 200, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 199 (var null) to 200 (var null), store in cc-reg
	!MOVEQ	2, 3, 198
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	198, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 198) to true
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
	!LOADI	2, 204
	set	 2, %l2	 	!int: reg 204 gets val 2
	!MOV	141, 205
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 205
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	205, 3, 203
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 202
	mov	 %g0, %l4	 
	!COMP	203, 204, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 203 (var null) to 204 (var null), store in cc-reg
	!MOVEQ	2, 3, 202
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	202, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 202) to true
	!CBREQ	2, .S72, .S73
	be	 .S72	 	!if: branch true: '.S72' false: '.S73'
	nop
	ba	.S73 	!if: branch true: '.S72' false: '.S73'
	nop
 .S72:
 !#if-guard:
	!LOADI	2, 208
	set	 2, %l2	 	!int: reg 208 gets val 2
	!MOV	141, 209
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 209
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	209, 3, 207
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 206
	mov	 %g0, %l4	 
	!COMP	207, 208, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 207 (var null) to 208 (var null), store in cc-reg
	!MOVEQ	2, 3, 206
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	206, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 206) to true
	!CBREQ	2, .S75, .S76
	be	 .S75	 	!if: branch true: '.S75' false: '.S76'
	nop
	ba	.S76 	!if: branch true: '.S75' false: '.S76'
	nop
 .S75:
 !#if-guard:
	!LOADI	2, 212
	set	 2, %l2	 	!int: reg 212 gets val 2
	!MOV	141, 213
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 213
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	213, 3, 211
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 210
	mov	 %g0, %l4	 
	!COMP	211, 212, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 211 (var null) to 212 (var null), store in cc-reg
	!MOVEQ	2, 3, 210
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	210, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 210) to true
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
	!LOADI	1, 216
	set	 1, %l2	 	!int: reg 216 gets val 1
	!MOV	141, 217
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 217
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	217, 3, 215
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 214
	mov	 %g0, %l4	 
	!COMP	215, 216, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 215 (var null) to 216 (var null), store in cc-reg
	!MOVEQ	2, 3, 214
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	214, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 214) to true
	!CBREQ	2, .S81, .S82
	be	 .S81	 	!if: branch true: '.S81' false: '.S82'
	nop
	ba	.S82 	!if: branch true: '.S81' false: '.S82'
	nop
 .S81:
 !#if-guard:
	!LOADI	1, 220
	set	 1, %l2	 	!int: reg 220 gets val 1
	!MOV	141, 221
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 221
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	221, 3, 219
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 218
	mov	 %g0, %l4	 
	!COMP	219, 220, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 219 (var null) to 220 (var null), store in cc-reg
	!MOVEQ	2, 3, 218
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	218, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 218) to true
	!CBREQ	2, .S84, .S85
	be	 .S84	 	!if: branch true: '.S84' false: '.S85'
	nop
	ba	.S85 	!if: branch true: '.S84' false: '.S85'
	nop
 .S84:
 !#if-guard:
	!LOADI	1, 224
	set	 1, %l2	 	!int: reg 224 gets val 1
	!MOV	141, 225
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 225
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	225, 3, 223
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 222
	mov	 %g0, %l4	 
	!COMP	223, 224, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 223 (var null) to 224 (var null), store in cc-reg
	!MOVEQ	2, 3, 222
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	222, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 222) to true
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
	!LOADI	2, 228
	set	 2, %l2	 	!int: reg 228 gets val 2
	!MOV	141, 229
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 229
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	229, 3, 227
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 226
	mov	 %g0, %l4	 
	!COMP	227, 228, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 227 (var null) to 228 (var null), store in cc-reg
	!MOVEQ	2, 3, 226
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	226, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 226) to true
	!CBREQ	2, .S90, .S91
	be	 .S90	 	!if: branch true: '.S90' false: '.S91'
	nop
	ba	.S91 	!if: branch true: '.S90' false: '.S91'
	nop
 .S90:
 !#if-guard:
	!LOADI	2, 232
	set	 2, %l2	 	!int: reg 232 gets val 2
	!MOV	141, 233
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 233
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	233, 3, 231
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 230
	mov	 %g0, %l4	 
	!COMP	231, 232, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 231 (var null) to 232 (var null), store in cc-reg
	!MOVEQ	2, 3, 230
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	230, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 230) to true
	!CBREQ	2, .S93, .S94
	be	 .S93	 	!if: branch true: '.S93' false: '.S94'
	nop
	ba	.S94 	!if: branch true: '.S93' false: '.S94'
	nop
 .S93:
 !#if-guard:
	!LOADI	2, 236
	set	 2, %l2	 	!int: reg 236 gets val 2
	!MOV	141, 237
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 237
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	237, 3, 235
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 234
	mov	 %g0, %l4	 
	!COMP	235, 236, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 235 (var null) to 236 (var null), store in cc-reg
	!MOVEQ	2, 3, 234
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	234, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 234) to true
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
	!LOADI	1, 240
	set	 1, %l2	 	!int: reg 240 gets val 1
	!MOV	141, 241
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 241
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	241, 3, 239
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 238
	mov	 %g0, %l4	 
	!COMP	239, 240, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 239 (var null) to 240 (var null), store in cc-reg
	!MOVEQ	2, 3, 238
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	238, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 238) to true
	!CBREQ	2, .S99, .S100
	be	 .S99	 	!if: branch true: '.S99' false: '.S100'
	nop
	ba	.S100 	!if: branch true: '.S99' false: '.S100'
	nop
 .S99:
 !#if-guard:
	!LOADI	1, 244
	set	 1, %l2	 	!int: reg 244 gets val 1
	!MOV	141, 245
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 245
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	245, 3, 243
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 242
	mov	 %g0, %l4	 
	!COMP	243, 244, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 243 (var null) to 244 (var null), store in cc-reg
	!MOVEQ	2, 3, 242
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	242, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 242) to true
	!CBREQ	2, .S102, .S103
	be	 .S102	 	!if: branch true: '.S102' false: '.S103'
	nop
	ba	.S103 	!if: branch true: '.S102' false: '.S103'
	nop
 .S102:
 !#if-guard:
	!LOADI	1, 248
	set	 1, %l2	 	!int: reg 248 gets val 1
	!MOV	141, 249
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 249
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	249, 3, 247
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 246
	mov	 %g0, %l4	 
	!COMP	247, 248, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 247 (var null) to 248 (var null), store in cc-reg
	!MOVEQ	2, 3, 246
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	246, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 246) to true
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
	!LOADI	2, 252
	set	 2, %l2	 	!int: reg 252 gets val 2
	!MOV	141, 253
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 253
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	253, 3, 251
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 250
	mov	 %g0, %l4	 
	!COMP	251, 252, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 251 (var null) to 252 (var null), store in cc-reg
	!MOVEQ	2, 3, 250
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	250, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 250) to true
	!CBREQ	2, .S108, .S109
	be	 .S108	 	!if: branch true: '.S108' false: '.S109'
	nop
	ba	.S109 	!if: branch true: '.S108' false: '.S109'
	nop
 .S108:
 !#if-guard:
	!LOADI	2, 256
	set	 2, %l2	 	!int: reg 256 gets val 2
	!MOV	141, 257
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 257
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	257, 3, 255
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 254
	mov	 %g0, %l4	 
	!COMP	255, 256, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 255 (var null) to 256 (var null), store in cc-reg
	!MOVEQ	2, 3, 254
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	254, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 254) to true
	!CBREQ	2, .S111, .S112
	be	 .S111	 	!if: branch true: '.S111' false: '.S112'
	nop
	ba	.S112 	!if: branch true: '.S111' false: '.S112'
	nop
 .S111:
 !#if-guard:
	!LOADI	2, 260
	set	 2, %l2	 	!int: reg 260 gets val 2
	!MOV	141, 261
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 261
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	261, 3, 259
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 258
	mov	 %g0, %l4	 
	!COMP	259, 260, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 259 (var null) to 260 (var null), store in cc-reg
	!MOVEQ	2, 3, 258
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	258, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 258) to true
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
	!LOADI	1, 264
	set	 1, %l2	 	!int: reg 264 gets val 1
	!MOV	141, 265
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 265
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	265, 3, 263
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 262
	mov	 %g0, %l4	 
	!COMP	263, 264, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 263 (var null) to 264 (var null), store in cc-reg
	!MOVEQ	2, 3, 262
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	262, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 262) to true
	!CBREQ	2, .S117, .S118
	be	 .S117	 	!if: branch true: '.S117' false: '.S118'
	nop
	ba	.S118 	!if: branch true: '.S117' false: '.S118'
	nop
 .S117:
 !#if-guard:
	!LOADI	1, 268
	set	 1, %l2	 	!int: reg 268 gets val 1
	!MOV	141, 269
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 269
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	269, 3, 267
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 266
	mov	 %g0, %l4	 
	!COMP	267, 268, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 267 (var null) to 268 (var null), store in cc-reg
	!MOVEQ	2, 3, 266
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	266, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 266) to true
	!CBREQ	2, .S120, .S121
	be	 .S120	 	!if: branch true: '.S120' false: '.S121'
	nop
	ba	.S121 	!if: branch true: '.S120' false: '.S121'
	nop
 .S120:
 !#if-guard:
	!LOADI	1, 272
	set	 1, %l2	 	!int: reg 272 gets val 1
	!MOV	141, 273
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 273
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	273, 3, 271
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 270
	mov	 %g0, %l4	 
	!COMP	271, 272, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 271 (var null) to 272 (var null), store in cc-reg
	!MOVEQ	2, 3, 270
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	270, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 270) to true
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
	!LOADI	2, 276
	set	 2, %l2	 	!int: reg 276 gets val 2
	!MOV	141, 277
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 277
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	277, 3, 275
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 274
	mov	 %g0, %l4	 
	!COMP	275, 276, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 275 (var null) to 276 (var null), store in cc-reg
	!MOVEQ	2, 3, 274
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	274, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 274) to true
	!CBREQ	2, .S126, .S127
	be	 .S126	 	!if: branch true: '.S126' false: '.S127'
	nop
	ba	.S127 	!if: branch true: '.S126' false: '.S127'
	nop
 .S126:
 !#if-guard:
	!LOADI	2, 280
	set	 2, %l2	 	!int: reg 280 gets val 2
	!MOV	141, 281
	mov	 %l1, %l3	 	!id: move reg 141 (var checkWinnerboard) to reg 281
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	281, 3, 279
	ld	[%l3 + %g1], %l3
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 278
	mov	 %g0, %l4	 
	!COMP	279, 280, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 279 (var null) to 280 (var null), store in cc-reg
	!MOVEQ	2, 3, 278
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	278, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 278) to true
	!CBREQ	2, .S129, .S130
	be	 .S129	 	!if: branch true: '.S129' false: '.S130'
	nop
	ba	.S130 	!if: branch true: '.S129' false: '.S130'
	nop
 .S129:
 !#if-guard:
	!LOADI	2, 284
	set	 2, %l2	 	!int: reg 284 gets val 2
	!MOV	141, 285
	mov	 %l1, %l1	 	!id: move reg 141 (var checkWinnerboard) to reg 285
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	285, 3, 283
	ld	[%l1 + %g1], %l1
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 282
	mov	 %g0, %l0	 
	!COMP	283, 284, 2
	cmp	 %l1, %l2	 	!expression: compare: reg 283 (var null) to 284 (var null), store in cc-reg
	!MOVEQ	2, 3, 282
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	282, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 282) to true
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
	!LOADI	1, 286
	set	 1, %l0	 	!int: reg 286 gets val 1
	!LOADI	-1, 287
	mov	 -1, %l1	 
	!MULT	286, 287, 4
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
	!STOREINARGUMENT	10, 75
	mov	 %i0, %l3	 
	!STOREINARGUMENT	11, 76
	mov	 %i1, %l2	 
	!STOREINARGUMENT	12, 77
	mov	 %i2, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	1, 80
	set	 1, %l4	 	!int: reg 80 gets val 1
	!MOV	77, 79
	mov	 %l1, %l5	 	!id: move reg 77 (var placePieceplacement) to reg 79
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 78
	mov	 %g0, %l6	 
	!COMP	79, 80, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 79 (var null) to 80 (var null), store in cc-reg
	!MOVEQ	2, 3, 78
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	78, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 78) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	76, 81
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 81
	!MOV	75, 83
	mov	 %l3, %l0	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	83, 3, 82
	ld	[%l0 + %g1], %l2
	!MOV	81, 82
	mov	 %l1, %l2	 
	!STOREAI	82, 83, 3
	st	%l2, [%l0 + %g1]
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
 !#if-guard:
	!LOADI	2, 87
	set	 2, %l4	 	!int: reg 87 gets val 2
	!MOV	77, 86
	mov	 %l1, %l5	 	!id: move reg 77 (var placePieceplacement) to reg 86
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 85
	mov	 %g0, %l6	 
	!COMP	86, 87, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 86 (var null) to 87 (var null), store in cc-reg
	!MOVEQ	2, 3, 85
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	85, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 85) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	76, 88
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 88
	!MOV	75, 90
	mov	 %l3, %l0	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	90, 3, 89
	ld	[%l0 + %g1], %l2
	!MOV	88, 89
	mov	 %l1, %l2	 
	!STOREAI	89, 90, 3
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
	!LOADI	3, 94
	set	 3, %l4	 	!int: reg 94 gets val 3
	!MOV	77, 93
	mov	 %l1, %l5	 	!id: move reg 77 (var placePieceplacement) to reg 93
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 92
	mov	 %g0, %l6	 
	!COMP	93, 94, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 93 (var null) to 94 (var null), store in cc-reg
	!MOVEQ	2, 3, 92
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	92, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 92) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	76, 95
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 95
	!MOV	75, 97
	mov	 %l3, %l0	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	97, 3, 96
	ld	[%l0 + %g1], %l2
	!MOV	95, 96
	mov	 %l1, %l2	 
	!STOREAI	96, 97, 3
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
	!LOADI	4, 101
	set	 4, %l4	 	!int: reg 101 gets val 4
	!MOV	77, 100
	mov	 %l1, %l5	 	!id: move reg 77 (var placePieceplacement) to reg 100
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 99
	mov	 %g0, %l6	 
	!COMP	100, 101, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 100 (var null) to 101 (var null), store in cc-reg
	!MOVEQ	2, 3, 99
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	99, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 99) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!MOV	76, 102
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 102
	!MOV	75, 104
	mov	 %l3, %l0	 
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	104, 3, 103
	ld	[%l0 + %g1], %l2
	!MOV	102, 103
	mov	 %l1, %l2	 
	!STOREAI	103, 104, 3
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
	!LOADI	5, 108
	set	 5, %l4	 	!int: reg 108 gets val 5
	!MOV	77, 107
	mov	 %l1, %l5	 	!id: move reg 77 (var placePieceplacement) to reg 107
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 106
	mov	 %g0, %l6	 
	!COMP	107, 108, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 107 (var null) to 108 (var null), store in cc-reg
	!MOVEQ	2, 3, 106
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	106, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 106) to true
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!MOV	76, 109
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 109
	!MOV	75, 111
	mov	 %l3, %l0	 
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	111, 3, 110
	ld	[%l0 + %g1], %l2
	!MOV	109, 110
	mov	 %l1, %l2	 
	!STOREAI	110, 111, 3
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
	!LOADI	6, 115
	set	 6, %l4	 	!int: reg 115 gets val 6
	!MOV	77, 114
	mov	 %l1, %l5	 	!id: move reg 77 (var placePieceplacement) to reg 114
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 113
	mov	 %g0, %l6	 
	!COMP	114, 115, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 114 (var null) to 115 (var null), store in cc-reg
	!MOVEQ	2, 3, 113
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	113, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 113) to true
	!CBREQ	2, .S15, .S16
	be	 .S15	 	!if: branch true: '.S15' false: '.S16'
	nop
	ba	.S16 	!if: branch true: '.S15' false: '.S16'
	nop
 .S15:
	!MOV	76, 116
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 116
	!MOV	75, 118
	mov	 %l3, %l0	 
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	118, 3, 117
	ld	[%l0 + %g1], %l2
	!MOV	116, 117
	mov	 %l1, %l2	 
	!STOREAI	117, 118, 3
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
	!LOADI	7, 122
	set	 7, %l4	 	!int: reg 122 gets val 7
	!MOV	77, 121
	mov	 %l1, %l5	 	!id: move reg 77 (var placePieceplacement) to reg 121
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 120
	mov	 %g0, %l6	 
	!COMP	121, 122, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 121 (var null) to 122 (var null), store in cc-reg
	!MOVEQ	2, 3, 120
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	120, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 120) to true
	!CBREQ	2, .S18, .S19
	be	 .S18	 	!if: branch true: '.S18' false: '.S19'
	nop
	ba	.S19 	!if: branch true: '.S18' false: '.S19'
	nop
 .S18:
	!MOV	76, 123
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 123
	!MOV	75, 125
	mov	 %l3, %l0	 
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	125, 3, 124
	ld	[%l0 + %g1], %l2
	!MOV	123, 124
	mov	 %l1, %l2	 
	!STOREAI	124, 125, 3
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
	!LOADI	8, 129
	set	 8, %l4	 	!int: reg 129 gets val 8
	!MOV	77, 128
	mov	 %l1, %l5	 	!id: move reg 77 (var placePieceplacement) to reg 128
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 127
	mov	 %g0, %l6	 
	!COMP	128, 129, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 128 (var null) to 129 (var null), store in cc-reg
	!MOVEQ	2, 3, 127
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	127, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 127) to true
	!CBREQ	2, .S21, .S22
	be	 .S21	 	!if: branch true: '.S21' false: '.S22'
	nop
	ba	.S22 	!if: branch true: '.S21' false: '.S22'
	nop
 .S21:
	!MOV	76, 130
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 130
	!MOV	75, 132
	mov	 %l3, %l0	 
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	132, 3, 131
	ld	[%l0 + %g1], %l2
	!MOV	130, 131
	mov	 %l1, %l2	 
	!STOREAI	131, 132, 3
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
	!LOADI	9, 136
	set	 9, %l4	 	!int: reg 136 gets val 9
	!MOV	77, 135
	mov	 %l1, %l1	 	!id: move reg 77 (var placePieceplacement) to reg 135
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 134
	mov	 %g0, %l0	 
	!COMP	135, 136, 2
	cmp	 %l1, %l4	 	!expression: compare: reg 135 (var null) to 136 (var null), store in cc-reg
	!MOVEQ	2, 3, 134
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	134, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 134) to true
	!CBREQ	2, .S24, .S25
	be	 .S24	 	!if: branch true: '.S24' false: '.S25'
	nop
	ba	.S25 	!if: branch true: '.S24' false: '.S25'
	nop
 .S24:
	!MOV	76, 137
	mov	 %l2, %l1	 	!id: move reg 76 (var placePieceturn) to reg 137
	!MOV	75, 139
	mov	 %l3, %l0	 
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	139, 3, 138
	ld	[%l0 + %g1], %l2
	!MOV	137, 138
	mov	 %l1, %l2	 
	!STOREAI	138, 139, 3
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
	!LOADI	123, 72
	set	 123, %l0	 	!int: reg 72 gets val 123
	!PRINTLN	72
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	456, 73
	set	 456, %l0	 	!int: reg 73 gets val 456
	!PRINTLN	73
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	789, 74
	set	 789, %l0	 	!int: reg 74 gets val 789
	!PRINTLN	74
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
	!STOREINARGUMENT	10, 53
	mov	 %i0, %l0	 
 !#function-body:
	!MOV	53, 55
	mov	 %l0, %l1	 	!id: move reg 53 (var printBoardboard) to reg 55
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	55, 3, 54
	ld	[%l1 + %g1], %l1
	!PRINT	54
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 57
	mov	 %l0, %l1	 	!id: move reg 53 (var printBoardboard) to reg 57
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	57, 3, 56
	ld	[%l1 + %g1], %l1
	!PRINT	56
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 59
	mov	 %l0, %l1	 	!id: move reg 53 (var printBoardboard) to reg 59
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	59, 3, 58
	ld	[%l1 + %g1], %l1
	!PRINTLN	58
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 61
	mov	 %l0, %l1	 	!id: move reg 53 (var printBoardboard) to reg 61
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	61, 3, 60
	ld	[%l1 + %g1], %l1
	!PRINT	60
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 63
	mov	 %l0, %l1	 	!id: move reg 53 (var printBoardboard) to reg 63
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	63, 3, 62
	ld	[%l1 + %g1], %l1
	!PRINT	62
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 65
	mov	 %l0, %l1	 	!id: move reg 53 (var printBoardboard) to reg 65
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	65, 3, 64
	ld	[%l1 + %g1], %l1
	!PRINTLN	64
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 67
	mov	 %l0, %l1	 	!id: move reg 53 (var printBoardboard) to reg 67
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	67, 3, 66
	ld	[%l1 + %g1], %l1
	!PRINT	66
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 69
	mov	 %l0, %l1	 	!id: move reg 53 (var printBoardboard) to reg 69
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	69, 3, 68
	ld	[%l1 + %g1], %l1
	!PRINT	68
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	53, 71
	mov	 %l0, %l0	 	!id: move reg 53 (var printBoardboard) to reg 71
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	71, 3, 70
	ld	[%l0 + %g1], %l0
	!PRINTLN	70
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
	!MOV	16, 19
	mov	 %l0, %l2	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	19, 3, 18
	ld	[%l2 + %g1], %l3
	!MOV	17, 18
	mov	 %l1, %l3	 
	!STOREAI	18, 19, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 21
	set	 0, %l1	 	!int: reg 21 gets val 0
	!MOV	16, 23
	mov	 %l0, %l2	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	23, 3, 22
	ld	[%l2 + %g1], %l3
	!MOV	21, 22
	mov	 %l1, %l3	 
	!STOREAI	22, 23, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 25
	set	 0, %l1	 	!int: reg 25 gets val 0
	!MOV	16, 27
	mov	 %l0, %l2	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	27, 3, 26
	ld	[%l2 + %g1], %l3
	!MOV	25, 26
	mov	 %l1, %l3	 
	!STOREAI	26, 27, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 29
	set	 0, %l1	 	!int: reg 29 gets val 0
	!MOV	16, 31
	mov	 %l0, %l2	 
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	31, 3, 30
	ld	[%l2 + %g1], %l3
	!MOV	29, 30
	mov	 %l1, %l3	 
	!STOREAI	30, 31, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 33
	set	 0, %l1	 	!int: reg 33 gets val 0
	!MOV	16, 35
	mov	 %l0, %l2	 
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	35, 3, 34
	ld	[%l2 + %g1], %l3
	!MOV	33, 34
	mov	 %l1, %l3	 
	!STOREAI	34, 35, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 37
	set	 0, %l1	 	!int: reg 37 gets val 0
	!MOV	16, 39
	mov	 %l0, %l2	 
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	39, 3, 38
	ld	[%l2 + %g1], %l3
	!MOV	37, 38
	mov	 %l1, %l3	 
	!STOREAI	38, 39, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 41
	set	 0, %l1	 	!int: reg 41 gets val 0
	!MOV	16, 43
	mov	 %l0, %l2	 
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	43, 3, 42
	ld	[%l2 + %g1], %l3
	!MOV	41, 42
	mov	 %l1, %l3	 
	!STOREAI	42, 43, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 45
	set	 0, %l1	 	!int: reg 45 gets val 0
	!MOV	16, 47
	mov	 %l0, %l2	 
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	47, 3, 46
	ld	[%l2 + %g1], %l3
	!MOV	45, 46
	mov	 %l1, %l3	 
	!STOREAI	46, 47, 3
	st	%l3, [%l2 + %g1]
	!LOADI	0, 49
	set	 0, %l1	 	!int: reg 49 gets val 0
	!MOV	16, 51
	mov	 %l0, %l0	 
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	51, 3, 50
	ld	[%l0 + %g1], %l2
	!MOV	49, 50
	mov	 %l1, %l2	 
	!STOREAI	50, 51, 3
	st	%l2, [%l0 + %g1]
 !#function-exit:
 