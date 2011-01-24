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
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 51
	mov	 %o0, %l1	 
	!STOREAI	0, 51, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 51, 4
	st	%g0, [%l1 + 4]
	!CALL	getIntList
	call	 getIntList	
	nop
	!MOV	1, 52
	mov	 %o0, %l0	 
	!MOV	52, 51
	mov	 %l0, %l1	 
	!MOV	51, 56
	mov	 %l1, %l0	 
	!STOREOUTARGUMENT	56, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 56to register outReg 1
	!CALL	biggestInList
	call	 biggestInList	
	nop
	!MOV	1, 55
	mov	 %o0, %l0	 
	!PRINTLN	55
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
	!STOREINARGUMENT	10, 39
	mov	 %i0, %l2	 
 !#function-body:
	!MOV	39, 41
	mov	 %l2, %l1	 
	!LOADAI	41, 0, 41
	ld	[%l1 + 0], %l1
	!MOV	41, 40
	mov	 %l1, %l3	 
 !#while-guard:
.S6:
	!MOV	0, 45
	mov	 %g0, %l1	 	!null: reg 45 gets false
	!MOV	39, 44
	mov	 %l2, %l4	 
	!LOADAI	44, 4, 44
	ld	[%l4 + 4], %l4
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 43
	mov	 %g0, %l5	 
	!COMP	44, 45, 2
	cmp	 %l4, %l1	 
	!MOVNE	2, 3, 43
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	43, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 43) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!MOV	40, 47
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	47, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 47to register outReg 1
	!MOV	39, 47
	mov	 %l2, %l1	 
	!LOADAI	47, 0, 47
	ld	[%l1 + 0], %l1
	!STOREOUTARGUMENT	47, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 47to register outReg 2
	!CALL	biggest
	call	 biggest	
	nop
	!MOV	1, 46
	mov	 %o0, %l1	 
	!MOV	46, 40
	mov	 %l1, %l3	 
	!MOV	39, 49
	mov	 %l2, %l1	 
	!LOADAI	49, 4, 49
	ld	[%l1 + 4], %l1
	!MOV	49, 39
	mov	 %l1, %l2	 
	!JUMPI	.S6
	ba	 .S6	 	!while: jump back to guard
	nop
 .S8:
	!MOV	40, 4
	mov	 %l3, %i0	 
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
	!STOREINARGUMENT	10, 34
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 35
	mov	 %i1, %l1	 
 !#function-body:
 !#if-guard:
	!MOV	35, 38
	mov	 %l1, %l3	 
	!MOV	34, 37
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 36
	mov	 %g0, %l0	 
	!COMP	37, 38, 2
	cmp	 %l4, %l3	 
	!MOVGT	2, 3, 36
	movg	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	36, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 36) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	34, 4
	mov	 %l2, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
 .S4:
	!MOV	35, 4
	mov	 %l1, %i0	 
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
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 16
	mov	 %o0, %l3	 
	!STOREAI	0, 16, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 16, 4
	st	%g0, [%l3 + 4]
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 18
	mov	 %o0, %l1	 
	!STOREAI	0, 18, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 18, 4
	st	%g0, [%l1 + 4]
	!MOV	18, 16
	mov	 %l1, %l3	 
	!READ	20
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	20, 17
	mov	 %l1, %l1	 
 !#if-guard:
	!LOADI	1, 25
	set	 1, %l2	 	!int: reg 25 gets val 1
	!LOADI	-1, 26
	mov	 -1, %l4	 
	!MULT	25, 26, 24
	smul	 %l2, %l4, %l2	 
	!MOV	17, 23
	mov	 %l1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 22
	mov	 %g0, %l5	 
	!COMP	23, 24, 2
	cmp	 %l4, %l2	 
	!MOVEQ	2, 3, 22
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	22, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 22) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	16, 4
	mov	 %l3, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
	!MOV	17, 27
	mov	 %l1, %l0	 
	!MOV	16, 28
	mov	 %l3, %l1	 
	!STOREAI	27, 28, 0
	st	%l0, [%l1 + 0]
	!CALL	getIntList
	call	 getIntList	
	nop
	!MOV	1, 30
	mov	 %o0, %l0	 
	!MOV	16, 32
	mov	 %l3, %l1	 
	!STOREAI	30, 32, 4
	st	%l0, [%l1 + 4]
	!MOV	16, 4
	mov	 %l3, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!if: jump to #end-if '.S2'
	nop
 !#function-exit:
 