	.file	"bert.ev"
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
	!MOV	0, 458
	mov	 %g0, %l5	 	!null: reg 458 gets false
	!MOV	454, 459
	mov	 %l7, %l6	 	!lvalue id: move reg 454 (var myList) to reg 459
	!MOV	458, 459
	mov	 %l5, %l6	 
	!MOV	459, 454
	mov	 %l6, %l7	 
	!LOADI	0, 461
	set	 0, %l5	 	!int: reg 461 gets val 0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	452, 462
	mov	 %l0, %l6	 	!lvalue id: move reg 452 (var i) to reg 462
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!MOV	461, 462
	mov	 %l5, %l6	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	462, 452
	mov	 %l6, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
 !#while-guard:
.S72:
	!LOADI	10, 466
	set	 10, %l5	 	!int: reg 466 gets val 10
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	452, 465
	mov	 %l0, %l6	 	!id: move reg 452 (var maini) to reg 465
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 464
	mov	 %g0, %g3	 
	!COMP	465, 466, 2
	cmp	 %l6, %l5	 	!expression: compare: reg 465 (var null) to 466 (var null), store in cc-reg
	!MOVLT	2, 3, 464
	movl	 %icc, %g1, %g3	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	464, 3, 2
	cmp	 %g3, %g1	 	!while: compare guard result (reg 464) to true
	!CBREQ	2, .S73, .S74
	be	 .S73	 	!while: branch true: '.S73' false: '.S74'
	nop
	ba	.S74 	!while: branch true: '.S73' false: '.S74'
	nop
 .S73:
	!MOV	453, 467
	mov	 %l4, %l4	 	!lvalue id: move reg 453 (var element) to reg 467
	!READ	467
	add	%sp, %g0, %l4
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l4

	!MOV	467, 453
	mov	 %l4, %l4	 
	!MOV	454, 471
	mov	 %l7, %l5	 	!id: move reg 454 (var mainmyList) to reg 471
	!STOREOUTARGUMENT	471, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 471to register outReg 1
	!MOV	453, 471
	mov	 %l4, %l5	 	!id: move reg 453 (var mainelement) to reg 471
	!STOREOUTARGUMENT	471, 6
	mov	 %l5, %o1	 	!argument: store out param from reg 471to register outReg 2
	!CALL	add
	call	 add	
	nop
	!MOV	1, 469
	mov	 %o0, %l5	 
	!MOV	454, 470
	mov	 %l7, %l6	 	!lvalue id: move reg 454 (var myList) to reg 470
	!MOV	469, 470
	mov	 %l5, %l6	 
	!MOV	470, 454
	mov	 %l6, %l7	 
	!MOV	454, 475
	mov	 %l7, %l5	 	!id: move reg 454 (var mainmyList) to reg 475
	!STOREOUTARGUMENT	475, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 475to register outReg 1
	!CALL	myCopy
	call	 myCopy	
	nop
	!MOV	1, 473
	mov	 %o0, %l5	 
	!MOV	455, 474
	mov	 %l3, %l3	 	!lvalue id: move reg 455 (var copyList1) to reg 474
	!MOV	473, 474
	mov	 %l5, %l3	 
	!MOV	474, 455
	mov	 %l3, %l3	 
	!MOV	454, 479
	mov	 %l7, %l5	 	!id: move reg 454 (var mainmyList) to reg 479
	!STOREOUTARGUMENT	479, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 479to register outReg 1
	!CALL	myCopy
	call	 myCopy	
	nop
	!MOV	1, 477
	mov	 %o0, %l5	 
	!MOV	456, 478
	mov	 %l2, %l2	 	!lvalue id: move reg 456 (var copyList2) to reg 478
	!MOV	477, 478
	mov	 %l5, %l2	 
	!MOV	478, 456
	mov	 %l2, %l2	 
	!MOV	455, 483
	mov	 %l3, %l5	 	!id: move reg 455 (var maincopyList1) to reg 483
	!STOREOUTARGUMENT	483, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 483to register outReg 1
	!CALL	quickSortMain
	call	 quickSortMain	
	nop
	!MOV	1, 481
	mov	 %o0, %l5	 
	!MOV	457, 482
	mov	 %l1, %l1	 	!lvalue id: move reg 457 (var sortedList) to reg 482
	!MOV	481, 482
	mov	 %l5, %l1	 
	!MOV	482, 457
	mov	 %l1, %l1	 
	!MOV	457, 485
	mov	 %l1, %l5	 	!id: move reg 457 (var mainsortedList) to reg 485
	!STOREOUTARGUMENT	485, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 485to register outReg 1
	!CALL	freeList
	call	 freeList	
	nop
	!MOV	456, 486
	mov	 %l2, %l5	 	!id: move reg 456 (var maincopyList2) to reg 486
	!STOREOUTARGUMENT	486, 5
	mov	 %l5, %o0	 	!argument: store out param from reg 486to register outReg 1
	!CALL	treeMain
	call	 treeMain	
	nop
	!LOADI	1, 490
	set	 1, %l5	 	!int: reg 490 gets val 1
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	452, 489
	mov	 %l0, %l6	 	!id: move reg 452 (var maini) to reg 489
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!ADD	489, 490, 487
	add	 %l6, %l5, %l5	 	!expression: reg 489 (var null) + 490 in reg 487 (var null)
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	452, 488
	mov	 %l0, %l6	 	!lvalue id: move reg 452 (var i) to reg 488
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!MOV	487, 488
	mov	 %l5, %l6	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	488, 452
	mov	 %l6, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!JUMPI	.S72
	ba	 .S72	 	!while: jump back to guard
	nop
 .S74:
	!MOV	454, 492
	mov	 %l7, %l0	 	!id: move reg 454 (var mainmyList) to reg 492
	!STOREOUTARGUMENT	492, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 492to register outReg 1
	!CALL	freeList
	call	 freeList	
	nop
	!MOV	455, 493
	mov	 %l3, %l0	 	!id: move reg 455 (var maincopyList1) to reg 493
	!STOREOUTARGUMENT	493, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 493to register outReg 1
	!CALL	freeList
	call	 freeList	
	nop
	!MOV	456, 494
	mov	 %l2, %l0	 	!id: move reg 456 (var maincopyList2) to reg 494
	!STOREOUTARGUMENT	494, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 494to register outReg 1
	!CALL	freeList
	call	 freeList	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	myCopy
	.type	myCopy, #function
	.proc	04
!#function-entry:
myCopy:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 443
	mov	 %i0, %l2	 
 !#function-body:
 !#if-guard:
	!MOV	0, 446
	mov	 %g0, %l1	 	!null: reg 446 gets false
	!MOV	443, 445
	mov	 %l2, %l3	 	!id: move reg 443 (var myCopysrc) to reg 445
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 444
	mov	 %g0, %l4	 
	!COMP	445, 446, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 445 (var null) to 446 (var null), store in cc-reg
	!MOVEQ	2, 3, 444
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	444, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 444) to true
	!CBREQ	2, .S69, .S70
	be	 .S69	 	!if: branch true: '.S69' false: '.S70'
	nop
	ba	.S70 	!if: branch true: '.S69' false: '.S70'
	nop
 .S69:
	!MOV	0, 4
	mov	 %g0, %i0	 	!null: reg 4 gets false
	!RET	
	ret
	restore
	!JUMPI	.S71
	ba	 .S71	 	!then: jump to #end-if '.S71'
	nop
 .S71:
.S70:
	!MOV	0, 448
	mov	 %g0, %l1	 	!null: reg 448 gets false
	!STOREOUTARGUMENT	448, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 448to register outReg 1
	!MOV	443, 449
	mov	 %l2, %l1	 	!id: move reg 443 (var myCopysrc) to reg 449
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	449, 3, 448
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	448, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 448to register outReg 2
	!CALL	add
	call	 add	
	nop
	!MOV	1, 447
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	447, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 447to register outReg 1
	!MOV	443, 451
	mov	 %l2, %l1	 	!id: move reg 443 (var myCopysrc) to reg 451
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	451, 3, 450
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	450, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 450to register outReg 1
	!CALL	myCopy
	call	 myCopy	
	nop
	!MOV	1, 447
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	447, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 447to register outReg 2
	!CALL	concatLists
	call	 concatLists	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	treeMain
	.type	treeMain, #function
	.proc	04
!#function-entry:
treeMain:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 338
	mov	 %i0, %l4	 
 !#function-body:
	!MOV	338, 344
	mov	 %l4, %l4	 	!id: move reg 338 (var treeMainlist) to reg 344
	!STOREOUTARGUMENT	344, 5
	mov	 %l4, %o0	 	!argument: store out param from reg 344to register outReg 1
	!CALL	buildTree
	call	 buildTree	
	nop
	!MOV	1, 342
	mov	 %o0, %l4	 
	!MOV	339, 343
	mov	 %l3, %l3	 	!lvalue id: move reg 339 (var root) to reg 343
	!MOV	342, 343
	mov	 %l4, %l3	 
	!MOV	343, 339
	mov	 %l3, %l3	 
	!MOV	339, 346
	mov	 %l3, %l4	 	!id: move reg 339 (var treeMainroot) to reg 346
	!STOREOUTARGUMENT	346, 5
	mov	 %l4, %o0	 	!argument: store out param from reg 346to register outReg 1
	!CALL	treeprint
	call	 treeprint	
	nop
	!LOADI	999, 348
	set	 999, %l4	 	!int: reg 348 gets val 999
	!LOADI	-1, 349
	mov	 -1, %l5	 
	!MULT	348, 349, 347
	smul	 %l4, %l5, %l4	 
	!PRINTLN	347
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l4, %o1
	call	printf, 0
	nop
	!MOV	339, 352
	mov	 %l3, %l4	 	!id: move reg 339 (var treeMainroot) to reg 352
	!STOREOUTARGUMENT	352, 5
	mov	 %l4, %o0	 	!argument: store out param from reg 352to register outReg 1
	!CALL	inOrder
	call	 inOrder	
	nop
	!MOV	1, 350
	mov	 %o0, %l4	 
	!MOV	340, 351
	mov	 %l2, %l2	 	!lvalue id: move reg 340 (var inList) to reg 351
	!MOV	350, 351
	mov	 %l4, %l2	 
	!MOV	351, 340
	mov	 %l2, %l2	 
	!MOV	340, 354
	mov	 %l2, %l4	 	!id: move reg 340 (var treeMaininList) to reg 354
	!STOREOUTARGUMENT	354, 5
	mov	 %l4, %o0	 	!argument: store out param from reg 354to register outReg 1
	!CALL	printList
	call	 printList	
	nop
	!LOADI	999, 356
	set	 999, %l4	 	!int: reg 356 gets val 999
	!LOADI	-1, 357
	mov	 -1, %l5	 
	!MULT	356, 357, 355
	smul	 %l4, %l5, %l4	 
	!PRINTLN	355
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l4, %o1
	call	printf, 0
	nop
	!MOV	340, 358
	mov	 %l2, %l2	 	!id: move reg 340 (var treeMaininList) to reg 358
	!STOREOUTARGUMENT	358, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 358to register outReg 1
	!CALL	freeList
	call	 freeList	
	nop
	!MOV	339, 361
	mov	 %l3, %l2	 	!id: move reg 339 (var treeMainroot) to reg 361
	!STOREOUTARGUMENT	361, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 361to register outReg 1
	!CALL	postOrder
	call	 postOrder	
	nop
	!MOV	1, 359
	mov	 %o0, %l2	 
	!MOV	341, 360
	mov	 %l1, %l1	 	!lvalue id: move reg 341 (var postList) to reg 360
	!MOV	359, 360
	mov	 %l2, %l1	 
	!MOV	360, 341
	mov	 %l1, %l1	 
	!MOV	341, 363
	mov	 %l1, %l2	 	!id: move reg 341 (var treeMainpostList) to reg 363
	!STOREOUTARGUMENT	363, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 363to register outReg 1
	!CALL	printList
	call	 printList	
	nop
	!LOADI	999, 365
	set	 999, %l2	 	!int: reg 365 gets val 999
	!LOADI	-1, 366
	mov	 -1, %l4	 
	!MULT	365, 366, 364
	smul	 %l2, %l4, %l2	 
	!PRINTLN	364
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l2, %o1
	call	printf, 0
	nop
	!MOV	341, 367
	mov	 %l1, %l1	 	!id: move reg 341 (var treeMainpostList) to reg 367
	!STOREOUTARGUMENT	367, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 367to register outReg 1
	!CALL	freeList
	call	 freeList	
	nop
	!MOV	339, 369
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 369
	!STOREOUTARGUMENT	369, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 369to register outReg 1
	!LOADI	0, 369
	set	 0, %l1	 	!int: reg 369 gets val 0
	!STOREOUTARGUMENT	369, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 369to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 368
	mov	 %o0, %l1	 
	!PRINTLN	368
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 371
	set	 999, %l1	 	!int: reg 371 gets val 999
	!LOADI	-1, 372
	mov	 -1, %l2	 
	!MULT	371, 372, 370
	smul	 %l1, %l2, %l1	 
	!PRINTLN	370
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 374
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 374
	!STOREOUTARGUMENT	374, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 374to register outReg 1
	!LOADI	10, 374
	set	 10, %l1	 	!int: reg 374 gets val 10
	!STOREOUTARGUMENT	374, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 374to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 373
	mov	 %o0, %l1	 
	!PRINTLN	373
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 376
	set	 999, %l1	 	!int: reg 376 gets val 999
	!LOADI	-1, 377
	mov	 -1, %l2	 
	!MULT	376, 377, 375
	smul	 %l1, %l2, %l1	 
	!PRINTLN	375
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 379
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 379
	!STOREOUTARGUMENT	379, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 379to register outReg 1
	!LOADI	2, 380
	set	 2, %l1	 	!int: reg 380 gets val 2
	!LOADI	-1, 381
	mov	 -1, %l2	 
	!MULT	380, 381, 379
	smul	 %l1, %l2, %l1	 
	!STOREOUTARGUMENT	379, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 379to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 378
	mov	 %o0, %l1	 
	!PRINTLN	378
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 383
	set	 999, %l1	 	!int: reg 383 gets val 999
	!LOADI	-1, 384
	mov	 -1, %l2	 
	!MULT	383, 384, 382
	smul	 %l1, %l2, %l1	 
	!PRINTLN	382
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 386
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 386
	!STOREOUTARGUMENT	386, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 386to register outReg 1
	!LOADI	2, 386
	set	 2, %l1	 	!int: reg 386 gets val 2
	!STOREOUTARGUMENT	386, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 386to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 385
	mov	 %o0, %l1	 
	!PRINTLN	385
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 388
	set	 999, %l1	 	!int: reg 388 gets val 999
	!LOADI	-1, 389
	mov	 -1, %l2	 
	!MULT	388, 389, 387
	smul	 %l1, %l2, %l1	 
	!PRINTLN	387
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 391
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 391
	!STOREOUTARGUMENT	391, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 391to register outReg 1
	!LOADI	3, 391
	set	 3, %l1	 	!int: reg 391 gets val 3
	!STOREOUTARGUMENT	391, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 391to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 390
	mov	 %o0, %l1	 
	!PRINTLN	390
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 393
	set	 999, %l1	 	!int: reg 393 gets val 999
	!LOADI	-1, 394
	mov	 -1, %l2	 
	!MULT	393, 394, 392
	smul	 %l1, %l2, %l1	 
	!PRINTLN	392
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 396
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 396
	!STOREOUTARGUMENT	396, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 396to register outReg 1
	!LOADI	9, 396
	set	 9, %l1	 	!int: reg 396 gets val 9
	!STOREOUTARGUMENT	396, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 396to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 395
	mov	 %o0, %l1	 
	!PRINTLN	395
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 398
	set	 999, %l1	 	!int: reg 398 gets val 999
	!LOADI	-1, 399
	mov	 -1, %l2	 
	!MULT	398, 399, 397
	smul	 %l1, %l2, %l1	 
	!PRINTLN	397
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 401
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 401
	!STOREOUTARGUMENT	401, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 401to register outReg 1
	!LOADI	1, 401
	set	 1, %l1	 	!int: reg 401 gets val 1
	!STOREOUTARGUMENT	401, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 401to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 400
	mov	 %o0, %l1	 
	!PRINTLN	400
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 403
	set	 999, %l1	 	!int: reg 403 gets val 999
	!LOADI	-1, 404
	mov	 -1, %l2	 
	!MULT	403, 404, 402
	smul	 %l1, %l2, %l1	 
	!PRINTLN	402
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 406
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 406
	!STOREOUTARGUMENT	406, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 406to register outReg 1
	!LOADI	0, 406
	set	 0, %l1	 	!int: reg 406 gets val 0
	!STOREOUTARGUMENT	406, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 406to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 405
	mov	 %o0, %l1	 
	!PRINTLN	405
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 408
	set	 999, %l1	 	!int: reg 408 gets val 999
	!LOADI	-1, 409
	mov	 -1, %l2	 
	!MULT	408, 409, 407
	smul	 %l1, %l2, %l1	 
	!PRINTLN	407
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 411
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 411
	!STOREOUTARGUMENT	411, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 411to register outReg 1
	!LOADI	10, 411
	set	 10, %l1	 	!int: reg 411 gets val 10
	!STOREOUTARGUMENT	411, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 411to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 410
	mov	 %o0, %l1	 
	!PRINTLN	410
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 413
	set	 999, %l1	 	!int: reg 413 gets val 999
	!LOADI	-1, 414
	mov	 -1, %l2	 
	!MULT	413, 414, 412
	smul	 %l1, %l2, %l1	 
	!PRINTLN	412
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 416
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 416
	!STOREOUTARGUMENT	416, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 416to register outReg 1
	!LOADI	2, 417
	set	 2, %l1	 	!int: reg 417 gets val 2
	!LOADI	-1, 418
	mov	 -1, %l2	 
	!MULT	417, 418, 416
	smul	 %l1, %l2, %l1	 
	!STOREOUTARGUMENT	416, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 416to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 415
	mov	 %o0, %l1	 
	!PRINTLN	415
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 420
	set	 999, %l1	 	!int: reg 420 gets val 999
	!LOADI	-1, 421
	mov	 -1, %l2	 
	!MULT	420, 421, 419
	smul	 %l1, %l2, %l1	 
	!PRINTLN	419
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 423
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 423
	!STOREOUTARGUMENT	423, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 423to register outReg 1
	!LOADI	2, 423
	set	 2, %l1	 	!int: reg 423 gets val 2
	!STOREOUTARGUMENT	423, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 423to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 422
	mov	 %o0, %l1	 
	!PRINTLN	422
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 425
	set	 999, %l1	 	!int: reg 425 gets val 999
	!LOADI	-1, 426
	mov	 -1, %l2	 
	!MULT	425, 426, 424
	smul	 %l1, %l2, %l1	 
	!PRINTLN	424
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 428
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 428
	!STOREOUTARGUMENT	428, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 428to register outReg 1
	!LOADI	3, 428
	set	 3, %l1	 	!int: reg 428 gets val 3
	!STOREOUTARGUMENT	428, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 428to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 427
	mov	 %o0, %l1	 
	!PRINTLN	427
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 430
	set	 999, %l1	 	!int: reg 430 gets val 999
	!LOADI	-1, 431
	mov	 -1, %l2	 
	!MULT	430, 431, 429
	smul	 %l1, %l2, %l1	 
	!PRINTLN	429
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 433
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 433
	!STOREOUTARGUMENT	433, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 433to register outReg 1
	!LOADI	9, 433
	set	 9, %l1	 	!int: reg 433 gets val 9
	!STOREOUTARGUMENT	433, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 433to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 432
	mov	 %o0, %l1	 
	!PRINTLN	432
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	999, 435
	set	 999, %l1	 	!int: reg 435 gets val 999
	!LOADI	-1, 436
	mov	 -1, %l2	 
	!MULT	435, 436, 434
	smul	 %l1, %l2, %l1	 
	!PRINTLN	434
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	339, 438
	mov	 %l3, %l1	 	!id: move reg 339 (var treeMainroot) to reg 438
	!STOREOUTARGUMENT	438, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 438to register outReg 1
	!LOADI	1, 438
	set	 1, %l1	 	!int: reg 438 gets val 1
	!STOREOUTARGUMENT	438, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 438to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 437
	mov	 %o0, %l0	 
	!PRINTLN	437
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	999, 440
	set	 999, %l0	 	!int: reg 440 gets val 999
	!LOADI	-1, 441
	mov	 -1, %l1	 
	!MULT	440, 441, 439
	smul	 %l0, %l1, %l0	 
	!PRINTLN	439
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!MOV	339, 442
	mov	 %l3, %l0	 	!id: move reg 339 (var treeMainroot) to reg 442
	!STOREOUTARGUMENT	442, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 442to register outReg 1
	!CALL	freeTree
	call	 freeTree	
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	buildTree
	.type	buildTree, #function
	.proc	04
!#function-entry:
buildTree:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 315
	mov	 %i0, %l1	 
 !#function-body:
	!MOV	0, 318
	mov	 %g0, %l2	 	!null: reg 318 gets false
	!MOV	317, 319
	mov	 %l4, %l3	 	!lvalue id: move reg 317 (var root) to reg 319
	!MOV	318, 319
	mov	 %l2, %l3	 
	!MOV	319, 317
	mov	 %l3, %l4	 
	!LOADI	0, 321
	set	 0, %l2	 	!int: reg 321 gets val 0
	!MOV	316, 322
	mov	 %l5, %l3	 	!lvalue id: move reg 316 (var i) to reg 322
	!MOV	321, 322
	mov	 %l2, %l3	 
	!MOV	322, 316
	mov	 %l3, %l5	 
 !#while-guard:
.S66:
	!MOV	315, 327
	mov	 %l1, %l2	 	!id: move reg 315 (var buildTreelist) to reg 327
	!STOREOUTARGUMENT	327, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 327to register outReg 1
	!CALL	size
	call	 size	
	nop
	!MOV	1, 326
	mov	 %o0, %l2	 
	!MOV	316, 325
	mov	 %l5, %l3	 	!id: move reg 316 (var buildTreei) to reg 325
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 324
	mov	 %g0, %l6	 
	!COMP	325, 326, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 325 (var null) to 326 (var null), store in cc-reg
	!MOVLT	2, 3, 324
	movl	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	324, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 324) to true
	!CBREQ	2, .S67, .S68
	be	 .S67	 	!while: branch true: '.S67' false: '.S68'
	nop
	ba	.S68 	!while: branch true: '.S67' false: '.S68'
	nop
 .S67:
	!MOV	317, 330
	mov	 %l4, %l2	 	!id: move reg 317 (var buildTreeroot) to reg 330
	!STOREOUTARGUMENT	330, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 330to register outReg 1
	!MOV	315, 331
	mov	 %l1, %l2	 	!id: move reg 315 (var buildTreelist) to reg 331
	!STOREOUTARGUMENT	331, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 331to register outReg 1
	!MOV	316, 331
	mov	 %l5, %l2	 	!id: move reg 316 (var buildTreei) to reg 331
	!STOREOUTARGUMENT	331, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 331to register outReg 2
	!CALL	get
	call	 get	
	nop
	!MOV	1, 330
	mov	 %o0, %l2	 
	!STOREOUTARGUMENT	330, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 330to register outReg 2
	!CALL	treeadd
	call	 treeadd	
	nop
	!MOV	1, 328
	mov	 %o0, %l2	 
	!MOV	317, 329
	mov	 %l4, %l3	 	!lvalue id: move reg 317 (var root) to reg 329
	!MOV	328, 329
	mov	 %l2, %l3	 
	!MOV	329, 317
	mov	 %l3, %l4	 
	!LOADI	1, 336
	set	 1, %l2	 	!int: reg 336 gets val 1
	!MOV	316, 335
	mov	 %l5, %l3	 	!id: move reg 316 (var buildTreei) to reg 335
	!ADD	335, 336, 333
	add	 %l3, %l2, %l2	 	!expression: reg 335 (var null) + 336 in reg 333 (var null)
	!MOV	316, 334
	mov	 %l5, %l3	 	!lvalue id: move reg 316 (var i) to reg 334
	!MOV	333, 334
	mov	 %l2, %l3	 
	!MOV	334, 316
	mov	 %l3, %l5	 
	!JUMPI	.S66
	ba	 .S66	 	!while: jump back to guard
	nop
 .S68:
	!MOV	317, 4
	mov	 %l4, %i0	 	!id: move reg 317 (var buildTreeroot) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	bintreesearch
	.type	bintreesearch, #function
	.proc	04
!#function-entry:
bintreesearch:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 295
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 296
	mov	 %i1, %l2	 
 !#function-body:
	!LOADI	1, 298
	set	 1, %l3	 	!int: reg 298 gets val 1
	!LOADI	-1, 299
	mov	 -1, %l4	 
	!MULT	298, 299, 297
	smul	 %l3, %l4, %l3	 
	!PRINTLN	297
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
 !#if-guard:
	!MOV	0, 302
	mov	 %g0, %l3	 	!null: reg 302 gets false
	!MOV	295, 301
	mov	 %l1, %l4	 	!id: move reg 295 (var bintreesearchroot) to reg 301
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 300
	mov	 %g0, %l5	 
	!COMP	301, 302, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 301 (var null) to 302 (var null), store in cc-reg
	!MOVNE	2, 3, 300
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	300, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 300) to true
	!CBREQ	2, .S57, .S58
	be	 .S57	 	!if: branch true: '.S57' false: '.S58'
	nop
	ba	.S58 	!if: branch true: '.S57' false: '.S58'
	nop
 .S57:
 !#if-guard:
	!MOV	296, 305
	mov	 %l2, %l3	 	!id: move reg 296 (var bintreesearchtarget) to reg 305
	!MOV	295, 306
	mov	 %l1, %l4	 	!id: move reg 295 (var bintreesearchroot) to reg 306
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	306, 3, 304
	ld	[%l4 + %g1], %l4
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 303
	mov	 %g0, %l5	 
	!COMP	304, 305, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 304 (var null) to 305 (var null), store in cc-reg
	!MOVEQ	2, 3, 303
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	303, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 303) to true
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
 !#if-guard:
	!MOV	295, 310
	mov	 %l1, %l3	 	!id: move reg 295 (var bintreesearchroot) to reg 310
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	310, 3, 309
	ld	[%l3 + %g1], %l3
	!MOV	296, 308
	mov	 %l2, %l4	 	!id: move reg 296 (var bintreesearchtarget) to reg 308
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 307
	mov	 %g0, %l5	 
	!COMP	308, 309, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 308 (var null) to 309 (var null), store in cc-reg
	!MOVLT	2, 3, 307
	movl	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	307, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 307) to true
	!CBREQ	2, .S63, .S64
	be	 .S63	 	!if: branch true: '.S63' false: '.S64'
	nop
	ba	.S64 	!if: branch true: '.S63' false: '.S64'
	nop
 .S63:
	!MOV	295, 312
	mov	 %l1, %l1	 	!id: move reg 295 (var bintreesearchroot) to reg 312
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	312, 3, 311
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	311, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 311to register outReg 1
	!MOV	296, 311
	mov	 %l2, %l1	 	!id: move reg 296 (var bintreesearchtarget) to reg 311
	!STOREOUTARGUMENT	311, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 311to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S65
	ba	 .S65	 	!then: jump to #end-if '.S65'
	nop
 .S65:
	!JUMPI	.S59
	ba	 .S59	 	!then: jump to #end-if '.S59'
	nop
 .S59:
.S58:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 .S64:
	!MOV	295, 314
	mov	 %l1, %l1	 	!id: move reg 295 (var bintreesearchroot) to reg 314
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	314, 3, 313
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	313, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 313to register outReg 1
	!MOV	296, 313
	mov	 %l2, %l1	 	!id: move reg 296 (var bintreesearchtarget) to reg 313
	!STOREOUTARGUMENT	313, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 313to register outReg 2
	!CALL	bintreesearch
	call	 bintreesearch	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S65
	ba	 .S65	 	!if: jump to #end-if '.S65'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	inOrder
	.type	inOrder, #function
	.proc	04
!#function-entry:
inOrder:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 272
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 276
	mov	 %g0, %l2	 	!null: reg 276 gets false
	!MOV	272, 275
	mov	 %l1, %l4	 	!id: move reg 272 (var inOrderroot) to reg 275
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 274
	mov	 %g0, %l5	 
	!COMP	275, 276, 2
	cmp	 %l4, %l2	 	!expression: compare: reg 275 (var null) to 276 (var null), store in cc-reg
	!MOVNE	2, 3, 274
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	274, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 274) to true
	!CBREQ	2, .S54, .S55
	be	 .S54	 	!if: branch true: '.S54' false: '.S55'
	nop
	ba	.S55 	!if: branch true: '.S54' false: '.S55'
	nop
 .S54:
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 277
	mov	 %o0, %l2	 
	!MOV	273, 278
	mov	 %l3, %l3	 	!lvalue id: move reg 273 (var temp) to reg 278
	!MOV	277, 278
	mov	 %l2, %l3	 
	!MOV	278, 273
	mov	 %l3, %l3	 
	!MOV	272, 282
	mov	 %l1, %l2	 	!id: move reg 272 (var inOrderroot) to reg 282
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	282, 3, 280
	ld	[%l2 + %g1], %l2
	!MOV	273, 283
	mov	 %l3, %l4	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	283, 3, 281
	ld	[%l4 + %g1], %l5
	!MOV	280, 281
	mov	 %l2, %l5	 
	!STOREAI	281, 283, 3
	st	%l5, [%l4 + %g1]
	!MOV	0, 285
	mov	 %g0, %l0	 	!null: reg 285 gets false
	!MOV	273, 287
	mov	 %l3, %l2	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	287, 3, 286
	ld	[%l2 + %g1], %l4
	!MOV	285, 286
	mov	 %l0, %l4	 
	!STOREAI	286, 287, 3
	st	%l4, [%l2 + %g1]
	!MOV	272, 291
	mov	 %l1, %l0	 	!id: move reg 272 (var inOrderroot) to reg 291
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	291, 3, 290
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	290, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 290to register outReg 1
	!CALL	inOrder
	call	 inOrder	
	nop
	!MOV	1, 289
	mov	 %o0, %l2	 
	!STOREOUTARGUMENT	289, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 289to register outReg 1
	!MOV	273, 292
	mov	 %l3, %l2	 	!id: move reg 273 (var inOrdertemp) to reg 292
	!STOREOUTARGUMENT	292, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 292to register outReg 1
	!MOV	272, 294
	mov	 %l1, %l0	 	!id: move reg 272 (var inOrderroot) to reg 294
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	294, 3, 293
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	293, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 293to register outReg 1
	!CALL	inOrder
	call	 inOrder	
	nop
	!MOV	1, 292
	mov	 %o0, %l2	 
	!STOREOUTARGUMENT	292, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 292to register outReg 2
	!CALL	concatLists
	call	 concatLists	
	nop
	!MOV	1, 289
	mov	 %o0, %l2	 
	!STOREOUTARGUMENT	289, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 289to register outReg 2
	!CALL	concatLists
	call	 concatLists	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S56
	ba	 .S56	 	!then: jump to #end-if '.S56'
	nop
 .S56:
 .S55:
	!MOV	0, 4
	mov	 %g0, %i0	 	!null: reg 4 gets false
	!RET	
	ret
	restore
	!JUMPI	.S56
	ba	 .S56	 	!if: jump to #end-if '.S56'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	treesearch
	.type	treesearch, #function
	.proc	04
!#function-entry:
treesearch:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 250
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 251
	mov	 %i1, %l1	 
 !#function-body:
	!LOADI	1, 253
	set	 1, %l3	 	!int: reg 253 gets val 1
	!LOADI	-1, 254
	mov	 -1, %l4	 
	!MULT	253, 254, 252
	smul	 %l3, %l4, %l3	 
	!PRINTLN	252
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l3, %o1
	call	printf, 0
	nop
 !#if-guard:
	!MOV	0, 257
	mov	 %g0, %l3	 	!null: reg 257 gets false
	!MOV	250, 256
	mov	 %l2, %l4	 	!id: move reg 250 (var treesearchroot) to reg 256
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 255
	mov	 %g0, %l5	 
	!COMP	256, 257, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 256 (var null) to 257 (var null), store in cc-reg
	!MOVNE	2, 3, 255
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	255, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 255) to true
	!CBREQ	2, .S42, .S43
	be	 .S42	 	!if: branch true: '.S42' false: '.S43'
	nop
	ba	.S43 	!if: branch true: '.S42' false: '.S43'
	nop
 .S42:
 !#if-guard:
	!MOV	251, 260
	mov	 %l1, %l3	 	!id: move reg 251 (var treesearchtarget) to reg 260
	!MOV	250, 261
	mov	 %l2, %l4	 	!id: move reg 250 (var treesearchroot) to reg 261
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	261, 3, 259
	ld	[%l4 + %g1], %l4
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 258
	mov	 %g0, %l5	 
	!COMP	259, 260, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 259 (var null) to 260 (var null), store in cc-reg
	!MOVEQ	2, 3, 258
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	258, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 258) to true
	!CBREQ	2, .S45, .S46
	be	 .S45	 	!if: branch true: '.S45' false: '.S46'
	nop
	ba	.S46 	!if: branch true: '.S45' false: '.S46'
	nop
 .S45:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S47
	ba	 .S47	 	!then: jump to #end-if '.S47'
	nop
 .S47:
.S46:
 !#if-guard:
	!LOADI	1, 264
	set	 1, %l3	 	!int: reg 264 gets val 1
	!MOV	250, 266
	mov	 %l2, %l4	 	!id: move reg 250 (var treesearchroot) to reg 266
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	266, 3, 265
	ld	[%l4 + %g1], %l4
	!STOREOUTARGUMENT	265, 5
	mov	 %l4, %o0	 	!argument: store out param from reg 265to register outReg 1
	!MOV	251, 265
	mov	 %l1, %l4	 	!id: move reg 251 (var treesearchtarget) to reg 265
	!STOREOUTARGUMENT	265, 6
	mov	 %l4, %o1	 	!argument: store out param from reg 265to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 263
	mov	 %o0, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 262
	mov	 %g0, %l5	 
	!COMP	263, 264, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 263 (var null) to 264 (var null), store in cc-reg
	!MOVEQ	2, 3, 262
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	262, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 262) to true
	!CBREQ	2, .S48, .S49
	be	 .S48	 	!if: branch true: '.S48' false: '.S49'
	nop
	ba	.S49 	!if: branch true: '.S48' false: '.S49'
	nop
 .S48:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S50
	ba	 .S50	 	!then: jump to #end-if '.S50'
	nop
 .S50:
.S49:
 !#if-guard:
	!LOADI	1, 269
	set	 1, %l3	 	!int: reg 269 gets val 1
	!MOV	250, 271
	mov	 %l2, %l2	 	!id: move reg 250 (var treesearchroot) to reg 271
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	271, 3, 270
	ld	[%l2 + %g1], %l2
	!STOREOUTARGUMENT	270, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 270to register outReg 1
	!MOV	251, 270
	mov	 %l1, %l2	 	!id: move reg 251 (var treesearchtarget) to reg 270
	!STOREOUTARGUMENT	270, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 270to register outReg 2
	!CALL	treesearch
	call	 treesearch	
	nop
	!MOV	1, 268
	mov	 %o0, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 267
	mov	 %g0, %l0	 
	!COMP	268, 269, 2
	cmp	 %l1, %l3	 	!expression: compare: reg 268 (var null) to 269 (var null), store in cc-reg
	!MOVEQ	2, 3, 267
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	267, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 267) to true
	!CBREQ	2, .S51, .S52
	be	 .S51	 	!if: branch true: '.S51' false: '.S52'
	nop
	ba	.S52 	!if: branch true: '.S51' false: '.S52'
	nop
 .S51:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S53
	ba	 .S53	 	!then: jump to #end-if '.S53'
	nop
 .S53:
	!JUMPI	.S44
	ba	 .S44	 	!then: jump to #end-if '.S44'
	nop
 .S44:
.S43:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 .S52:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S53
	ba	 .S53	 	!if: jump to #end-if '.S53'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	quickSortMain
	.type	quickSortMain, #function
	.proc	04
!#function-entry:
quickSortMain:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 237
	mov	 %i0, %l0	 
 !#function-body:
	!MOV	237, 238
	mov	 %l0, %l1	 	!id: move reg 237 (var quickSortMainlist) to reg 238
	!STOREOUTARGUMENT	238, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 238to register outReg 1
	!CALL	printList
	call	 printList	
	nop
	!LOADI	999, 240
	set	 999, %l1	 	!int: reg 240 gets val 999
	!LOADI	-1, 241
	mov	 -1, %l2	 
	!MULT	240, 241, 239
	smul	 %l1, %l2, %l1	 
	!PRINTLN	239
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	237, 242
	mov	 %l0, %l1	 	!id: move reg 237 (var quickSortMainlist) to reg 242
	!STOREOUTARGUMENT	242, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 242to register outReg 1
	!CALL	printList
	call	 printList	
	nop
	!LOADI	999, 244
	set	 999, %l1	 	!int: reg 244 gets val 999
	!LOADI	-1, 245
	mov	 -1, %l2	 
	!MULT	244, 245, 243
	smul	 %l1, %l2, %l1	 
	!PRINTLN	243
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	237, 246
	mov	 %l0, %l1	 	!id: move reg 237 (var quickSortMainlist) to reg 246
	!STOREOUTARGUMENT	246, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 246to register outReg 1
	!CALL	printList
	call	 printList	
	nop
	!LOADI	999, 248
	set	 999, %l1	 	!int: reg 248 gets val 999
	!LOADI	-1, 249
	mov	 -1, %l2	 
	!MULT	248, 249, 247
	smul	 %l1, %l2, %l1	 
	!PRINTLN	247
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	237, 4
	mov	 %l0, %i0	 	!id: move reg 237 (var quickSortMainlist) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	quickSort
	.type	quickSort, #function
	.proc	04
!#function-entry:
quickSort:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 173
	mov	 %i0, %l3	 
 !#function-body:
	!MOV	0, 179
	mov	 %g0, %l4	 	!null: reg 179 gets false
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	176, 180
	mov	 %l0, %l6	 	!lvalue id: move reg 176 (var less) to reg 180
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!MOV	179, 180
	mov	 %l4, %l6	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	180, 176
	mov	 %l6, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	0, 182
	mov	 %g0, %l4	 	!null: reg 182 gets false
	!MOV	177, 183
	mov	 %l7, %l6	 	!lvalue id: move reg 177 (var greater) to reg 183
	!MOV	182, 183
	mov	 %l4, %l6	 
	!MOV	183, 177
	mov	 %l6, %l7	 
 !#if-guard:
	!LOADI	1, 187
	set	 1, %l4	 	!int: reg 187 gets val 1
	!MOV	173, 188
	mov	 %l3, %l6	 	!id: move reg 173 (var quickSortlist) to reg 188
	!STOREOUTARGUMENT	188, 5
	mov	 %l6, %o0	 	!argument: store out param from reg 188to register outReg 1
	!CALL	size
	call	 size	
	nop
	!MOV	1, 186
	mov	 %o0, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 185
	mov	 %g0, %g3	 
	!COMP	186, 187, 2
	cmp	 %l6, %l4	 	!expression: compare: reg 186 (var null) to 187 (var null), store in cc-reg
	!MOVLE	2, 3, 185
	movle	 %icc, %g1, %g3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	185, 3, 2
	cmp	 %g3, %g1	 	!if: compare guard result (reg 185) to true
	!CBREQ	2, .S33, .S34
	be	 .S33	 	!if: branch true: '.S33' false: '.S34'
	nop
	ba	.S34 	!if: branch true: '.S33' false: '.S34'
	nop
 .S33:
	!MOV	173, 4
	mov	 %l3, %i0	 	!id: move reg 173 (var quickSortlist) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S35
	ba	 .S35	 	!then: jump to #end-if '.S35'
	nop
 .S35:
.S34:
	!LOADI	2, 192
	set	 2, %l4	 	!int: reg 192 gets val 2
	!MOV	173, 196
	mov	 %l3, %l6	 	!id: move reg 173 (var quickSortlist) to reg 196
	!STOREOUTARGUMENT	196, 5
	mov	 %l6, %o0	 	!argument: store out param from reg 196to register outReg 1
	!LOADI	1, 198
	set	 1, %l6	 	!int: reg 198 gets val 1
	!MOV	173, 199
	mov	 %l3, %g3	 	!id: move reg 173 (var quickSortlist) to reg 199
	!STOREOUTARGUMENT	199, 5
	mov	 %g3, %o0	 	!argument: store out param from reg 199to register outReg 1
	!CALL	size
	call	 size	
	nop
	!MOV	1, 197
	mov	 %o0, %g3	 
	!SUB	197, 198, 196
	sub	 %g3, %l6, %l6	 	!expression: reg 197 (var null) - 198 in reg 196 (var null)
	!STOREOUTARGUMENT	196, 6
	mov	 %l6, %o1	 	!argument: store out param from reg 196to register outReg 2
	!CALL	get
	call	 get	
	nop
	!MOV	1, 194
	mov	 %o0, %l6	 
	!MOV	173, 195
	mov	 %l3, %g3	 	!id: move reg 173 (var quickSortlist) to reg 195
	!STOREOUTARGUMENT	195, 5
	mov	 %g3, %o0	 	!argument: store out param from reg 195to register outReg 1
	!LOADI	0, 195
	set	 0, %g3	 	!int: reg 195 gets val 0
	!STOREOUTARGUMENT	195, 6
	mov	 %g3, %o1	 	!argument: store out param from reg 195to register outReg 2
	!CALL	get
	call	 get	
	nop
	!MOV	1, 193
	mov	 %o0, %g3	 
	!ADD	193, 194, 191
	add	 %g3, %l6, %l6	 	!expression: reg 193 (var null) + 194 in reg 191 (var null)
	!DIV	191, 192, 189
	sdiv	 %l6, %l4, %l4	 	!expression: reg 191 (var null) / 192 in reg 189 (var null)
	!MOV	174, 190
	mov	 %l1, %l1	 	!lvalue id: move reg 174 (var pivot) to reg 190
	!MOV	189, 190
	mov	 %l4, %l1	 
	!MOV	190, 174
	mov	 %l1, %l1	 
	!MOV	173, 201
	mov	 %l3, %l4	 	!id: move reg 173 (var quickSortlist) to reg 201
	!MOV	178, 202
	mov	 %l5, %l5	 	!lvalue id: move reg 178 (var temp) to reg 202
	!MOV	201, 202
	mov	 %l4, %l5	 
	!MOV	202, 178
	mov	 %l5, %l5	 
	!LOADI	0, 204
	set	 0, %l4	 	!int: reg 204 gets val 0
	!MOV	175, 205
	mov	 %l2, %l2	 	!lvalue id: move reg 175 (var i) to reg 205
	!MOV	204, 205
	mov	 %l4, %l2	 
	!MOV	205, 175
	mov	 %l2, %l2	 
 !#while-guard:
.S36:
	!MOV	0, 209
	mov	 %g0, %l4	 	!null: reg 209 gets false
	!MOV	178, 208
	mov	 %l5, %l6	 	!id: move reg 178 (var quickSorttemp) to reg 208
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 207
	mov	 %g0, %g3	 
	!COMP	208, 209, 2
	cmp	 %l6, %l4	 	!expression: compare: reg 208 (var null) to 209 (var null), store in cc-reg
	!MOVNE	2, 3, 207
	movne	 %icc, %g1, %g3	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	207, 3, 2
	cmp	 %g3, %g1	 	!while: compare guard result (reg 207) to true
	!CBREQ	2, .S37, .S38
	be	 .S37	 	!while: branch true: '.S37' false: '.S38'
	nop
	ba	.S38 	!while: branch true: '.S37' false: '.S38'
	nop
 .S37:
 !#if-guard:
	!MOV	174, 212
	mov	 %l1, %l1	 	!id: move reg 174 (var quickSortpivot) to reg 212
	!MOV	173, 213
	mov	 %l3, %l4	 	!id: move reg 173 (var quickSortlist) to reg 213
	!STOREOUTARGUMENT	213, 5
	mov	 %l4, %o0	 	!argument: store out param from reg 213to register outReg 1
	!MOV	175, 213
	mov	 %l2, %l4	 	!id: move reg 175 (var quickSorti) to reg 213
	!STOREOUTARGUMENT	213, 6
	mov	 %l4, %o1	 	!argument: store out param from reg 213to register outReg 2
	!CALL	get
	call	 get	
	nop
	!MOV	1, 211
	mov	 %o0, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 210
	mov	 %g0, %l6	 
	!COMP	211, 212, 2
	cmp	 %l4, %l1	 	!expression: compare: reg 211 (var null) to 212 (var null), store in cc-reg
	!MOVGT	2, 3, 210
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	210, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 210) to true
	!CBREQ	2, .S39, .S40
	be	 .S39	 	!if: branch true: '.S39' false: '.S40'
	nop
	ba	.S40 	!if: branch true: '.S39' false: '.S40'
	nop
 .S39:
	!MOV	177, 216
	mov	 %l7, %l1	 	!id: move reg 177 (var quickSortgreater) to reg 216
	!STOREOUTARGUMENT	216, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 216to register outReg 1
	!MOV	173, 217
	mov	 %l3, %l1	 	!id: move reg 173 (var quickSortlist) to reg 217
	!STOREOUTARGUMENT	217, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 217to register outReg 1
	!MOV	175, 217
	mov	 %l2, %l1	 	!id: move reg 175 (var quickSorti) to reg 217
	!STOREOUTARGUMENT	217, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 217to register outReg 2
	!CALL	get
	call	 get	
	nop
	!MOV	1, 216
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	216, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 216to register outReg 2
	!CALL	add
	call	 add	
	nop
	!MOV	1, 214
	mov	 %o0, %l0	 
	!MOV	177, 215
	mov	 %l7, %l1	 	!lvalue id: move reg 177 (var greater) to reg 215
	!MOV	214, 215
	mov	 %l0, %l1	 
	!MOV	215, 177
	mov	 %l1, %l7	 
	!JUMPI	.S41
	ba	 .S41	 	!then: jump to #end-if '.S41'
	nop
 .S41:
	!MOV	178, 226
	mov	 %l5, %l0	 	!id: move reg 178 (var quickSorttemp) to reg 226
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	226, 3, 224
	ld	[%l0 + %g1], %l0
	!MOV	178, 225
	mov	 %l5, %l1	 	!lvalue id: move reg 178 (var temp) to reg 225
	!MOV	224, 225
	mov	 %l0, %l1	 
	!MOV	225, 178
	mov	 %l1, %l5	 
	!LOADI	1, 231
	set	 1, %l0	 	!int: reg 231 gets val 1
	!MOV	175, 230
	mov	 %l2, %l1	 	!id: move reg 175 (var quickSorti) to reg 230
	!ADD	230, 231, 228
	add	 %l1, %l0, %l1	 	!expression: reg 230 (var null) + 231 in reg 228 (var null)
	!MOV	175, 229
	mov	 %l2, %l0	 	!lvalue id: move reg 175 (var i) to reg 229
	!MOV	228, 229
	mov	 %l1, %l0	 
	!MOV	229, 175
	mov	 %l0, %l2	 
	!JUMPI	.S36
	ba	 .S36	 	!while: jump back to guard
	nop
 .S40:
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	176, 221
	mov	 %l0, %l1	 	!id: move reg 176 (var quickSortless) to reg 221
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREOUTARGUMENT	221, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 221to register outReg 1
	!MOV	173, 222
	mov	 %l3, %l1	 	!id: move reg 173 (var quickSortlist) to reg 222
	!STOREOUTARGUMENT	222, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 222to register outReg 1
	!MOV	175, 222
	mov	 %l2, %l1	 	!id: move reg 175 (var quickSorti) to reg 222
	!STOREOUTARGUMENT	222, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 222to register outReg 2
	!CALL	get
	call	 get	
	nop
	!MOV	1, 221
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	221, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 221to register outReg 2
	!CALL	add
	call	 add	
	nop
	!MOV	1, 219
	mov	 %o0, %l0	 
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	176, 220
	mov	 %l0, %l1	 	!lvalue id: move reg 176 (var less) to reg 220
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!MOV	219, 220
	mov	 %l0, %l1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	220, 176
	mov	 %l1, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!JUMPI	.S41
	ba	 .S41	 	!if: jump to #end-if '.S41'
	nop
 .S38:
	!MOV	173, 233
	mov	 %l3, %l1	 	!id: move reg 173 (var quickSortlist) to reg 233
	!STOREOUTARGUMENT	233, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 233to register outReg 1
	!CALL	freeList
	call	 freeList	
	nop
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	176, 235
	mov	 %l0, %l1	 	!id: move reg 176 (var quickSortless) to reg 235
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!STOREOUTARGUMENT	235, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 235to register outReg 1
	!CALL	quickSort
	call	 quickSort	
	nop
	!MOV	1, 234
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	234, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 234to register outReg 1
	!MOV	177, 236
	mov	 %l7, %l1	 	!id: move reg 177 (var quickSortgreater) to reg 236
	!STOREOUTARGUMENT	236, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 236to register outReg 1
	!CALL	quickSort
	call	 quickSort	
	nop
	!MOV	1, 234
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	234, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 234to register outReg 2
	!CALL	concatLists
	call	 concatLists	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	treeadd
	.type	treeadd, #function
	.proc	04
!#function-entry:
treeadd:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 136
	mov	 %i0, %l3	 
	!STOREINARGUMENT	11, 137
	mov	 %i1, %l2	 
 !#function-body:
 !#if-guard:
	!MOV	0, 141
	mov	 %g0, %l4	 	!null: reg 141 gets false
	!MOV	136, 140
	mov	 %l3, %l5	 	!id: move reg 136 (var treeaddroot) to reg 140
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 139
	mov	 %g0, %l6	 
	!COMP	140, 141, 2
	cmp	 %l5, %l4	 	!expression: compare: reg 140 (var null) to 141 (var null), store in cc-reg
	!MOVEQ	2, 3, 139
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	139, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 139) to true
	!CBREQ	2, .S27, .S28
	be	 .S27	 	!if: branch true: '.S27' false: '.S28'
	nop
	ba	.S28 	!if: branch true: '.S27' false: '.S28'
	nop
 .S27:
	!LOADI	12, 1
	set	 12, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 142
	mov	 %o0, %l4	 
	!MOV	138, 143
	mov	 %l1, %l1	 	!lvalue id: move reg 138 (var temp) to reg 143
	!MOV	142, 143
	mov	 %l4, %l1	 
	!MOV	143, 138
	mov	 %l1, %l1	 
	!MOV	137, 145
	mov	 %l2, %l4	 	!id: move reg 137 (var treeaddtoAdd) to reg 145
	!MOV	138, 147
	mov	 %l1, %l5	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	147, 3, 146
	ld	[%l5 + %g1], %l6
	!MOV	145, 146
	mov	 %l4, %l6	 
	!STOREAI	146, 147, 3
	st	%l6, [%l5 + %g1]
	!MOV	0, 149
	mov	 %g0, %l4	 	!null: reg 149 gets false
	!MOV	138, 151
	mov	 %l1, %l5	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	151, 3, 150
	ld	[%l5 + %g1], %l6
	!MOV	149, 150
	mov	 %l4, %l6	 
	!STOREAI	150, 151, 3
	st	%l6, [%l5 + %g1]
	!MOV	0, 153
	mov	 %g0, %l4	 	!null: reg 153 gets false
	!MOV	138, 155
	mov	 %l1, %l5	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	155, 3, 154
	ld	[%l5 + %g1], %l6
	!MOV	153, 154
	mov	 %l4, %l6	 
	!STOREAI	154, 155, 3
	st	%l6, [%l5 + %g1]
	!MOV	138, 4
	mov	 %l1, %i0	 	!id: move reg 138 (var treeaddtemp) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S29
	ba	 .S29	 	!then: jump to #end-if '.S29'
	nop
 .S29:
.S28:
 !#if-guard:
	!MOV	136, 160
	mov	 %l3, %l1	 	!id: move reg 136 (var treeaddroot) to reg 160
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	160, 3, 159
	ld	[%l1 + %g1], %l1
	!MOV	137, 158
	mov	 %l2, %l4	 	!id: move reg 137 (var treeaddtoAdd) to reg 158
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 157
	mov	 %g0, %l5	 
	!COMP	158, 159, 2
	cmp	 %l4, %l1	 	!expression: compare: reg 158 (var null) to 159 (var null), store in cc-reg
	!MOVLT	2, 3, 157
	movl	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	157, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 157) to true
	!CBREQ	2, .S30, .S31
	be	 .S30	 	!if: branch true: '.S30' false: '.S31'
	nop
	ba	.S31 	!if: branch true: '.S30' false: '.S31'
	nop
 .S30:
	!MOV	136, 164
	mov	 %l3, %l0	 	!id: move reg 136 (var treeaddroot) to reg 164
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	164, 3, 163
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	163, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 163to register outReg 1
	!MOV	137, 163
	mov	 %l2, %l1	 	!id: move reg 137 (var treeaddtoAdd) to reg 163
	!STOREOUTARGUMENT	163, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 163to register outReg 2
	!CALL	treeadd
	call	 treeadd	
	nop
	!MOV	1, 161
	mov	 %o0, %l0	 
	!MOV	136, 165
	mov	 %l3, %l1	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	165, 3, 162
	ld	[%l1 + %g1], %l2
	!MOV	161, 162
	mov	 %l0, %l2	 
	!STOREAI	162, 165, 3
	st	%l2, [%l1 + %g1]
	!JUMPI	.S32
	ba	 .S32	 	!then: jump to #end-if '.S32'
	nop
 .S32:
	!MOV	136, 4
	mov	 %l3, %i0	 	!id: move reg 136 (var treeaddroot) to reg 4
	!RET	
	ret
	restore
 .S31:
	!MOV	136, 170
	mov	 %l3, %l0	 	!id: move reg 136 (var treeaddroot) to reg 170
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	170, 3, 169
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	169, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 169to register outReg 1
	!MOV	137, 169
	mov	 %l2, %l1	 	!id: move reg 137 (var treeaddtoAdd) to reg 169
	!STOREOUTARGUMENT	169, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 169to register outReg 2
	!CALL	treeadd
	call	 treeadd	
	nop
	!MOV	1, 167
	mov	 %o0, %l0	 
	!MOV	136, 171
	mov	 %l3, %l1	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	171, 3, 168
	ld	[%l1 + %g1], %l2
	!MOV	167, 168
	mov	 %l0, %l2	 
	!STOREAI	168, 171, 3
	st	%l2, [%l1 + %g1]
	!JUMPI	.S32
	ba	 .S32	 	!if: jump to #end-if '.S32'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	postOrder
	.type	postOrder, #function
	.proc	04
!#function-entry:
postOrder:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 113
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 117
	mov	 %g0, %l2	 	!null: reg 117 gets false
	!MOV	113, 116
	mov	 %l1, %l4	 	!id: move reg 113 (var postOrderroot) to reg 116
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 115
	mov	 %g0, %l5	 
	!COMP	116, 117, 2
	cmp	 %l4, %l2	 	!expression: compare: reg 116 (var null) to 117 (var null), store in cc-reg
	!MOVNE	2, 3, 115
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	115, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 115) to true
	!CBREQ	2, .S24, .S25
	be	 .S24	 	!if: branch true: '.S24' false: '.S25'
	nop
	ba	.S25 	!if: branch true: '.S24' false: '.S25'
	nop
 .S24:
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 118
	mov	 %o0, %l2	 
	!MOV	114, 119
	mov	 %l3, %l3	 	!lvalue id: move reg 114 (var temp) to reg 119
	!MOV	118, 119
	mov	 %l2, %l3	 
	!MOV	119, 114
	mov	 %l3, %l3	 
	!MOV	113, 123
	mov	 %l1, %l2	 	!id: move reg 113 (var postOrderroot) to reg 123
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	123, 3, 121
	ld	[%l2 + %g1], %l2
	!MOV	114, 124
	mov	 %l3, %l4	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	124, 3, 122
	ld	[%l4 + %g1], %l5
	!MOV	121, 122
	mov	 %l2, %l5	 
	!STOREAI	122, 124, 3
	st	%l5, [%l4 + %g1]
	!MOV	0, 126
	mov	 %g0, %l2	 	!null: reg 126 gets false
	!MOV	114, 128
	mov	 %l3, %l4	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	128, 3, 127
	ld	[%l4 + %g1], %l5
	!MOV	126, 127
	mov	 %l2, %l5	 
	!STOREAI	127, 128, 3
	st	%l5, [%l4 + %g1]
	!MOV	113, 133
	mov	 %l1, %l2	 	!id: move reg 113 (var postOrderroot) to reg 133
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	133, 3, 132
	ld	[%l2 + %g1], %l2
	!STOREOUTARGUMENT	132, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 132to register outReg 1
	!CALL	postOrder
	call	 postOrder	
	nop
	!MOV	1, 131
	mov	 %o0, %l2	 
	!STOREOUTARGUMENT	131, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 131to register outReg 1
	!MOV	113, 135
	mov	 %l1, %l1	 	!id: move reg 113 (var postOrderroot) to reg 135
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	135, 3, 134
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	134, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 134to register outReg 1
	!CALL	postOrder
	call	 postOrder	
	nop
	!MOV	1, 131
	mov	 %o0, %l2	 
	!STOREOUTARGUMENT	131, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 131to register outReg 2
	!CALL	concatLists
	call	 concatLists	
	nop
	!MOV	1, 130
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	130, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 130to register outReg 1
	!MOV	114, 130
	mov	 %l3, %l1	 	!id: move reg 114 (var postOrdertemp) to reg 130
	!STOREOUTARGUMENT	130, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 130to register outReg 2
	!CALL	concatLists
	call	 concatLists	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S26
	ba	 .S26	 	!then: jump to #end-if '.S26'
	nop
 .S26:
.S25:
	!MOV	0, 4
	mov	 %g0, %i0	 	!null: reg 4 gets false
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	freeTree
	.type	freeTree, #function
	.proc	04
!#function-entry:
freeTree:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 102
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	1, 105
	set	 1, %l2	 
	!XORI	104, 105, 103
	xor	 %l0, %l2, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	103, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 103) to true
	!CBREQ	2, .S21, .S22
	be	 .S21	 	!if: branch true: '.S21' false: '.S22'
	nop
	ba	.S22 	!if: branch true: '.S21' false: '.S22'
	nop
 .S21:
	!MOV	102, 109
	mov	 %l1, %l0	 	!id: move reg 102 (var freeTreeroot) to reg 109
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	109, 3, 108
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	108, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 108to register outReg 1
	!CALL	freeTree
	call	 freeTree	
	nop
	!MOV	102, 111
	mov	 %l1, %l0	 	!id: move reg 102 (var freeTreeroot) to reg 111
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	111, 3, 110
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	110, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 110to register outReg 1
	!CALL	freeTree
	call	 freeTree	
	nop
	!MOV	102, 112
	mov	 %l1, %l0	 	!id: move reg 102 (var freeTreeroot) to reg 112
	!DEL	112
	call	free, 0
	nop 
	!JUMPI	.S23
	ba	 .S23	 	!then: jump to #end-if '.S23'
	nop
 .S23:
.S22:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	freeList
	.type	freeList, #function
	.proc	04
!#function-entry:
freeList:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 95
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 98
	mov	 %g0, %l2	 	!null: reg 98 gets false
	!MOV	95, 97
	mov	 %l1, %l3	 	!id: move reg 95 (var freeListlist) to reg 97
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 96
	mov	 %g0, %l0	 
	!COMP	97, 98, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 97 (var null) to 98 (var null), store in cc-reg
	!MOVNE	2, 3, 96
	movne	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	96, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 96) to true
	!CBREQ	2, .S18, .S19
	be	 .S18	 	!if: branch true: '.S18' false: '.S19'
	nop
	ba	.S19 	!if: branch true: '.S18' false: '.S19'
	nop
 .S18:
	!MOV	95, 100
	mov	 %l1, %l0	 	!id: move reg 95 (var freeListlist) to reg 100
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	100, 3, 99
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	99, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 99to register outReg 1
	!CALL	freeList
	call	 freeList	
	nop
	!MOV	95, 101
	mov	 %l1, %l0	 	!id: move reg 95 (var freeListlist) to reg 101
	!DEL	101
	call	free, 0
	nop 
	!JUMPI	.S20
	ba	 .S20	 	!then: jump to #end-if '.S20'
	nop
 .S20:
.S19:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	treeprint
	.type	treeprint, #function
	.proc	04
!#function-entry:
treeprint:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 85
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 88
	mov	 %g0, %l2	 	!null: reg 88 gets false
	!MOV	85, 87
	mov	 %l1, %l3	 	!id: move reg 85 (var treeprintroot) to reg 87
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 86
	mov	 %g0, %l0	 
	!COMP	87, 88, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 87 (var null) to 88 (var null), store in cc-reg
	!MOVNE	2, 3, 86
	movne	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	86, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 86) to true
	!CBREQ	2, .S15, .S16
	be	 .S15	 	!if: branch true: '.S15' false: '.S16'
	nop
	ba	.S16 	!if: branch true: '.S15' false: '.S16'
	nop
 .S15:
	!MOV	85, 90
	mov	 %l1, %l0	 	!id: move reg 85 (var treeprintroot) to reg 90
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	90, 3, 89
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	89, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 89to register outReg 1
	!CALL	treeprint
	call	 treeprint	
	nop
	!MOV	85, 92
	mov	 %l1, %l0	 	!id: move reg 85 (var treeprintroot) to reg 92
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	92, 3, 91
	ld	[%l0 + %g1], %l0
	!PRINTLN	91
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!MOV	85, 94
	mov	 %l1, %l0	 	!id: move reg 85 (var treeprintroot) to reg 94
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	94, 3, 93
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	93, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 93to register outReg 1
	!CALL	treeprint
	call	 treeprint	
	nop
	!JUMPI	.S17
	ba	 .S17	 	!then: jump to #end-if '.S17'
	nop
 .S17:
.S16:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	printList
	.type	printList, #function
	.proc	04
!#function-entry:
printList:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 77
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 80
	mov	 %g0, %l2	 	!null: reg 80 gets false
	!MOV	77, 79
	mov	 %l1, %l3	 	!id: move reg 77 (var printListlist) to reg 79
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 78
	mov	 %g0, %l0	 
	!COMP	79, 80, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 79 (var null) to 80 (var null), store in cc-reg
	!MOVNE	2, 3, 78
	movne	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	78, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 78) to true
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!MOV	77, 82
	mov	 %l1, %l0	 	!id: move reg 77 (var printListlist) to reg 82
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	82, 3, 81
	ld	[%l0 + %g1], %l0
	!PRINTLN	81
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!MOV	77, 84
	mov	 %l1, %l0	 	!id: move reg 77 (var printListlist) to reg 84
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	84, 3, 83
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	83, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 83to register outReg 1
	!CALL	printList
	call	 printList	
	nop
	!JUMPI	.S14
	ba	 .S14	 	!then: jump to #end-if '.S14'
	nop
 .S14:
.S13:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	pop
	.type	pop, #function
	.proc	04
!#function-entry:
pop:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 72
	mov	 %i0, %l2	 
 !#function-body:
	!MOV	72, 75
	mov	 %l2, %l0	 	!id: move reg 72 (var poplist) to reg 75
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	75, 3, 73
	ld	[%l0 + %g1], %l1
	!MOV	72, 74
	mov	 %l2, %l0	 	!lvalue id: move reg 72 (var list) to reg 74
	!MOV	73, 74
	mov	 %l1, %l0	 
	!MOV	74, 72
	mov	 %l0, %l2	 
	!MOV	72, 4
	mov	 %l2, %i0	 	!id: move reg 72 (var poplist) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	get
	.type	get, #function
	.proc	04
!#function-entry:
get:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 62
	mov	 %i0, %l3	 
	!STOREINARGUMENT	11, 63
	mov	 %i1, %l2	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 66
	set	 0, %l1	 	!int: reg 66 gets val 0
	!MOV	63, 65
	mov	 %l2, %l4	 	!id: move reg 63 (var getindex) to reg 65
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 64
	mov	 %g0, %l5	 
	!COMP	65, 66, 2
	cmp	 %l4, %l1	 	!expression: compare: reg 65 (var null) to 66 (var null), store in cc-reg
	!MOVEQ	2, 3, 64
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	64, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 64) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!MOV	62, 67
	mov	 %l3, %l1	 	!id: move reg 62 (var getlist) to reg 67
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	67, 3, 4
	ld	[%l1 + %g1], %i0
	!RET	
	ret
	restore
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
.S10:
	!MOV	62, 69
	mov	 %l3, %l1	 	!id: move reg 62 (var getlist) to reg 69
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	69, 3, 68
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	68, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 68to register outReg 1
	!LOADI	1, 71
	set	 1, %l1	 	!int: reg 71 gets val 1
	!MOV	63, 70
	mov	 %l2, %l2	 	!id: move reg 63 (var getindex) to reg 70
	!SUB	70, 71, 68
	sub	 %l2, %l1, %l1	 	!expression: reg 70 (var null) - 71 in reg 68 (var null)
	!STOREOUTARGUMENT	68, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 68to register outReg 2
	!CALL	get
	call	 get	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	size
	.type	size, #function
	.proc	04
!#function-entry:
size:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 54
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	0, 57
	mov	 %g0, %l2	 	!null: reg 57 gets false
	!MOV	54, 56
	mov	 %l1, %l3	 	!id: move reg 54 (var sizelist) to reg 56
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 55
	mov	 %g0, %l4	 
	!COMP	56, 57, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 56 (var null) to 57 (var null), store in cc-reg
	!MOVEQ	2, 3, 55
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	55, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 55) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!MOV	54, 61
	mov	 %l1, %l1	 	!id: move reg 54 (var sizelist) to reg 61
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	61, 3, 60
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	60, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 60to register outReg 1
	!CALL	size
	call	 size	
	nop
	!MOV	1, 59
	mov	 %o0, %l0	 
	!LOADI	1, 58
	set	 1, %l1	 	!int: reg 58 gets val 1
	!ADD	58, 59, 4
	add	 %l1, %l0, %i0	 	!expression: reg 58 (var null) + 59 in reg 4 (var null)
	!RET	
	ret
	restore
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
	!STOREINARGUMENT	10, 40
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 41
	mov	 %i1, %l0	 
 !#function-body:
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 43
	mov	 %o0, %l3	 
	!MOV	42, 44
	mov	 %l2, %l2	 	!lvalue id: move reg 42 (var newNode) to reg 44
	!MOV	43, 44
	mov	 %l3, %l2	 
	!MOV	44, 42
	mov	 %l2, %l2	 
	!MOV	41, 46
	mov	 %l0, %l0	 	!id: move reg 41 (var addtoAdd) to reg 46
	!MOV	42, 48
	mov	 %l2, %l3	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	48, 3, 47
	ld	[%l3 + %g1], %l4
	!MOV	46, 47
	mov	 %l0, %l4	 
	!STOREAI	47, 48, 3
	st	%l4, [%l3 + %g1]
	!MOV	40, 50
	mov	 %l1, %l0	 	!id: move reg 40 (var addlist) to reg 50
	!MOV	42, 52
	mov	 %l2, %l1	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	52, 3, 51
	ld	[%l1 + %g1], %l3
	!MOV	50, 51
	mov	 %l0, %l3	 
	!STOREAI	51, 52, 3
	st	%l3, [%l1 + %g1]
	!MOV	42, 4
	mov	 %l2, %i0	 	!id: move reg 42 (var addnewNode) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	concatLists
	.type	concatLists, #function
	.proc	04
!#function-entry:
concatLists:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 19
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 20
	mov	 %i1, %l1	 
 !#function-body:
	!MOV	19, 22
	mov	 %l2, %l3	 	!id: move reg 19 (var concatListsfirst) to reg 22
	!MOV	21, 23
	mov	 %l5, %l4	 	!lvalue id: move reg 21 (var temp) to reg 23
	!MOV	22, 23
	mov	 %l3, %l4	 
	!MOV	23, 21
	mov	 %l4, %l5	 
 !#if-guard:
	!MOV	0, 27
	mov	 %g0, %l3	 	!null: reg 27 gets false
	!MOV	19, 26
	mov	 %l2, %l4	 	!id: move reg 19 (var concatListsfirst) to reg 26
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 25
	mov	 %g0, %l6	 
	!COMP	26, 27, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 26 (var null) to 27 (var null), store in cc-reg
	!MOVEQ	2, 3, 25
	move	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	25, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 25) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	20, 4
	mov	 %l1, %i0	 	!id: move reg 20 (var concatListssecond) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
.S1:
 !#while-guard:
.S3:
	!MOV	0, 30
	mov	 %g0, %l3	 	!null: reg 30 gets false
	!MOV	21, 31
	mov	 %l5, %l4	 	!id: move reg 21 (var concatListstemp) to reg 31
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	31, 3, 29
	ld	[%l4 + %g1], %l4
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 28
	mov	 %g0, %l6	 
	!COMP	29, 30, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 29 (var null) to 30 (var null), store in cc-reg
	!MOVNE	2, 3, 28
	movne	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	28, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 28) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
	!MOV	21, 34
	mov	 %l5, %l3	 	!id: move reg 21 (var concatListstemp) to reg 34
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	34, 3, 32
	ld	[%l3 + %g1], %l3
	!MOV	21, 33
	mov	 %l5, %l4	 	!lvalue id: move reg 21 (var temp) to reg 33
	!MOV	32, 33
	mov	 %l3, %l4	 
	!MOV	33, 21
	mov	 %l4, %l5	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
	!MOV	20, 36
	mov	 %l1, %l1	 	!id: move reg 20 (var concatListssecond) to reg 36
	!MOV	21, 38
	mov	 %l5, %l0	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	38, 3, 37
	ld	[%l0 + %g1], %l3
	!MOV	36, 37
	mov	 %l1, %l3	 
	!STOREAI	37, 38, 3
	st	%l3, [%l0 + %g1]
	!MOV	19, 4
	mov	 %l2, %i0	 	!id: move reg 19 (var concatListsfirst) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 