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
	!MOV	1, 66
	mov	 %o0, %l2	 
	!MOV	65, 67
	mov	 %l1, %l1	 	!lvalue id: move reg 65 (var list) to reg 67
	!MOV	66, 67
	mov	 %l2, %l1	 
	!MOV	67, 65
	mov	 %l1, %l1	 
	!MOV	65, 71
	mov	 %l1, %l1	 	!id: move reg 65 (var mainlist) to reg 71
	!STOREOUTARGUMENT	71, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 71to register outReg 1
	!CALL	biggestInList
	call	 biggestInList	
	nop
	!MOV	1, 70
	mov	 %o0, %l0	 
	!PRINTLN	70
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
	.global	biggestInList
	.type	biggestInList, #function
	.proc	04
!#function-entry:
biggestInList:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 46
	mov	 %i0, %l4	 
 !#function-body:
	!MOV	46, 50
	mov	 %l4, %l1	 	!id: move reg 46 (var biggestInListlist) to reg 50
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	50, 3, 48
	ld	[%l1 + %g1], %l1
	!MOV	47, 49
	mov	 %l3, %l2	 	!lvalue id: move reg 47 (var big) to reg 49
	!MOV	48, 49
	mov	 %l1, %l2	 
	!MOV	49, 47
	mov	 %l2, %l3	 
 !#while-guard:
.S6:
	!MOV	0, 54
	mov	 %g0, %l1	 	!null: reg 54 gets false
	!MOV	46, 55
	mov	 %l4, %l2	 	!id: move reg 46 (var biggestInListlist) to reg 55
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	55, 3, 53
	ld	[%l2 + %g1], %l2
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 52
	mov	 %g0, %l5	 
	!COMP	53, 54, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 53 (var null) to 54 (var null), store in cc-reg
	!MOVNE	2, 3, 52
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	52, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 52) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!MOV	47, 58
	mov	 %l3, %l1	 	!id: move reg 47 (var biggestInListbig) to reg 58
	!STOREOUTARGUMENT	58, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 58to register outReg 1
	!MOV	46, 59
	mov	 %l4, %l1	 	!id: move reg 46 (var biggestInListlist) to reg 59
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	59, 3, 58
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	58, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 58to register outReg 2
	!CALL	biggest
	call	 biggest	
	nop
	!MOV	1, 56
	mov	 %o0, %l1	 
	!MOV	47, 57
	mov	 %l3, %l2	 	!lvalue id: move reg 47 (var big) to reg 57
	!MOV	56, 57
	mov	 %l1, %l2	 
	!MOV	57, 47
	mov	 %l2, %l3	 
	!MOV	46, 63
	mov	 %l4, %l1	 	!id: move reg 46 (var biggestInListlist) to reg 63
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	63, 3, 61
	ld	[%l1 + %g1], %l1
	!MOV	46, 62
	mov	 %l4, %l2	 	!lvalue id: move reg 46 (var list) to reg 62
	!MOV	61, 62
	mov	 %l1, %l2	 
	!MOV	62, 46
	mov	 %l2, %l4	 
	!JUMPI	.S6
	ba	 .S6	 	!while: jump back to guard
	nop
 .S8:
	!MOV	47, 4
	mov	 %l3, %i0	 	!id: move reg 47 (var biggestInListbig) to reg 4
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
	!STOREINARGUMENT	10, 41
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 42
	mov	 %i1, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	42, 45
	mov	 %l1, %l3	 	!id: move reg 42 (var biggestnum2) to reg 45
	!MOV	41, 44
	mov	 %l2, %l4	 	!id: move reg 41 (var biggestnum1) to reg 44
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 43
	mov	 %g0, %l0	 
	!COMP	44, 45, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 44 (var null) to 45 (var null), store in cc-reg
	!MOVGT	2, 3, 43
	movg	 %icc, %g1, %l0	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	43, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 43) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	41, 4
	mov	 %l2, %i0	 	!id: move reg 41 (var biggestnum1) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
 .S4:
	!MOV	42, 4
	mov	 %l1, %i0	 	!id: move reg 42 (var biggestnum2) to reg 4
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
	mov	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 22
	mov	 %o0, %l3	 
	!MOV	20, 23
	mov	 %l2, %l2	 	!lvalue id: move reg 20 (var list) to reg 23
	!MOV	22, 23
	mov	 %l3, %l2	 
	!MOV	23, 20
	mov	 %l2, %l2	 
	!MOV	21, 25
	mov	 %l1, %l1	 	!lvalue id: move reg 21 (var next) to reg 25
	!READ	25
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	25, 21
	mov	 %l1, %l1	 
 !#if-guard:
	!LOADI	1, 30
	mov	 1, %l3	 	!int: reg 30 gets val 1
	!LOADI	-1, 31
	mov	 -1, %l4	 
	!MULT	30, 31, 29
	smul	 %l3, %l4, %l3	 
	!MOV	21, 28
	mov	 %l1, %l4	 	!id: move reg 21 (var getIntListnext) to reg 28
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 27
	mov	 %g0, %l5	 
	!COMP	28, 29, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 28 (var null) to 29 (var null), store in cc-reg
	!MOVEQ	2, 3, 27
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	27, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 27) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	20, 4
	mov	 %l2, %i0	 	!id: move reg 20 (var getIntListlist) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
	!MOV	21, 32
	mov	 %l1, %l0	 	!id: move reg 21 (var getIntListnext) to reg 32
	!MOV	20, 34
	mov	 %l2, %l1	 
	!LOADI	0, 3
	mov	 0, %g1	 
	!LOADAI	34, 3, 33
	ld	[%l1 + %g1], %l3
	!MOV	32, 33
	mov	 %l0, %l3	 
	!STOREAI	33, 34, 3
	st	%l3, [%l1 + %g1]
	!CALL	getIntList
	call	 getIntList	
	nop
	!MOV	1, 36
	mov	 %o0, %l0	 
	!MOV	20, 39
	mov	 %l2, %l1	 
	!LOADI	4, 3
	mov	 4, %g1	 
	!LOADAI	39, 3, 37
	ld	[%l1 + %g1], %l3
	!MOV	36, 37
	mov	 %l0, %l3	 
	!STOREAI	37, 39, 3
	st	%l3, [%l1 + %g1]
	!MOV	20, 4
	mov	 %l2, %i0	 	!id: move reg 20 (var getIntListlist) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!if: jump to #end-if '.S2'
	nop
 !#function-exit:
 