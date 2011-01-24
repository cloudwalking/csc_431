	.file	"biggest.ev"
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
	!CALL	getIntList
	call	 getIntList	
	nop
	!MOV	1, 62
	mov	 %o0, %l2	 
	!MOV	61, 63
	mov	 %l1, %l1	 	!lvalue id: move reg 61 (var list) to reg 63
	!MOV	62, 63
	mov	 %l2, %l1	 
	!MOV	63, 61
	mov	 %l1, %l1	 
	!MOV	61, 67
	mov	 %l1, %l1	 	!id: move reg 61 (var mainlist) to reg 67
	!STOREOUTARGUMENT	67, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 67to register outReg 1
	!CALL	biggestInList
	call	 biggestInList	
	nop
	!MOV	1, 66
	mov	 %o0, %l0	 
	!PRINTLN	66
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
	.global	biggestInList
	.type	biggestInList, #function
	.proc	04
!#function-entry:
biggestInList:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 42
	mov	 %i0, %l4	 
 !#function-body:
	!MOV	42, 46
	mov	 %l4, %l1	 	!id: move reg 42 (var biggestInListlist) to reg 46
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	46, 3, 44
	ld	[%l1 + %g1], %l1
	!MOV	43, 45
	mov	 %l3, %l2	 	!lvalue id: move reg 43 (var big) to reg 45
	!MOV	44, 45
	mov	 %l1, %l2	 
	!MOV	45, 43
	mov	 %l2, %l3	 
 !#while-guard:
.S6:
	!MOV	0, 50
	mov	 %g0, %l1	 	!null: reg 50 gets false
	!MOV	42, 51
	mov	 %l4, %l2	 	!id: move reg 42 (var biggestInListlist) to reg 51
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	51, 3, 49
	ld	[%l2 + %g1], %l2
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 48
	mov	 %g0, %l5	 
	!COMP	49, 50, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 49 (var null) to 50 (var null), store in cc-reg
	!MOVNE	2, 3, 48
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	48, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 48) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!MOV	43, 54
	mov	 %l3, %l1	 	!id: move reg 43 (var biggestInListbig) to reg 54
	!STOREOUTARGUMENT	54, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 54to register outReg 1
	!MOV	42, 55
	mov	 %l4, %l1	 	!id: move reg 42 (var biggestInListlist) to reg 55
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	55, 3, 54
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	54, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 54to register outReg 2
	!CALL	biggest
	call	 biggest	
	nop
	!MOV	1, 52
	mov	 %o0, %l1	 
	!MOV	43, 53
	mov	 %l3, %l2	 	!lvalue id: move reg 43 (var big) to reg 53
	!MOV	52, 53
	mov	 %l1, %l2	 
	!MOV	53, 43
	mov	 %l2, %l3	 
	!MOV	42, 59
	mov	 %l4, %l1	 	!id: move reg 42 (var biggestInListlist) to reg 59
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	59, 3, 57
	ld	[%l1 + %g1], %l1
	!MOV	42, 58
	mov	 %l4, %l2	 	!lvalue id: move reg 42 (var list) to reg 58
	!MOV	57, 58
	mov	 %l1, %l2	 
	!MOV	58, 42
	mov	 %l2, %l4	 
	!JUMPI	.S6
	ba	 .S6	 	!while: jump back to guard
	nop
 .S8:
	!MOV	43, 4
	mov	 %l3, %i0	 	!id: move reg 43 (var biggestInListbig) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	biggest
	.type	biggest, #function
	.proc	04
!#function-entry:
biggest:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 37
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 38
	mov	 %i1, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	38, 41
	mov	 %l1, %l3	 	!id: move reg 38 (var biggestnum2) to reg 41
	!MOV	37, 40
	mov	 %l2, %l4	 	!id: move reg 37 (var biggestnum1) to reg 40
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 39
	mov	 %g0, %l0	 
	!COMP	40, 41, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 40 (var null) to 41 (var null), store in cc-reg
	!MOVGT	2, 3, 39
	movg	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	39, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 39) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	37, 4
	mov	 %l2, %i0	 	!id: move reg 37 (var biggestnum1) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
 .S4:
	!MOV	38, 4
	mov	 %l1, %i0	 	!id: move reg 38 (var biggestnum2) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	getIntList
	.type	getIntList, #function
	.proc	04
!#function-entry:
getIntList:
	!SAVE	
	save	%sp, -800, %sp 
 !#function-body:
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 18
	mov	 %o0, %l3	 
	!MOV	16, 19
	mov	 %l2, %l2	 	!lvalue id: move reg 16 (var list) to reg 19
	!MOV	18, 19
	mov	 %l3, %l2	 
	!MOV	19, 16
	mov	 %l2, %l2	 
	!MOV	17, 21
	mov	 %l1, %l1	 	!lvalue id: move reg 17 (var next) to reg 21
	!READ	21
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	21, 17
	mov	 %l1, %l1	 
 !#if-guard:
	!LOADI	1, 26
	set	 1, %l3	 	!int: reg 26 gets val 1
	!LOADI	-1, 27
	mov	 -1, %l4	 
	!MULT	26, 27, 25
	smul	 %l3, %l4, %l3	 
	!MOV	17, 24
	mov	 %l1, %l4	 	!id: move reg 17 (var getIntListnext) to reg 24
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 23
	mov	 %g0, %l5	 
	!COMP	24, 25, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 24 (var null) to 25 (var null), store in cc-reg
	!MOVEQ	2, 3, 23
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	23, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 23) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	16, 4
	mov	 %l2, %i0	 	!id: move reg 16 (var getIntListlist) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
	!MOV	17, 28
	mov	 %l1, %l0	 	!id: move reg 17 (var getIntListnext) to reg 28
	!MOV	16, 30
	mov	 %l2, %l1	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	30, 3, 29
	ld	[%l1 + %g1], %l3
	!MOV	28, 29
	mov	 %l0, %l3	 
	!STOREAI	29, 30, 3
	st	%l3, [%l1 + null]
	!CALL	getIntList
	call	 getIntList	
	nop
	!MOV	1, 32
	mov	 %o0, %l0	 
	!MOV	16, 35
	mov	 %l2, %l1	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	35, 3, 33
	ld	[%l1 + %g1], %l3
	!MOV	32, 33
	mov	 %l0, %l3	 
	!STOREAI	33, 35, 3
	st	%l3, [%l1 + null]
	!MOV	16, 4
	mov	 %l2, %i0	 	!id: move reg 16 (var getIntListlist) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!if: jump to #end-if '.S2'
	nop
 !#function-exit:
 