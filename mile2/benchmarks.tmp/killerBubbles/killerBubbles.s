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
	!NEW	12, 1
	mov	12, %o0
	call	malloc
	nop
	!MOV	1, 72
	mov	 %o0, %l4	 
	!STOREAI	0, 72, 0
	st	%g0, [%l4 + 0]
	!STOREAI	0, 72, 4
	st	%g0, [%l4 + 4]
	!STOREAI	0, 72, 8
	st	%g0, [%l4 + 8]
	!NEW	12, 1
	mov	12, %o0
	call	malloc
	nop
	!MOV	1, 73
	mov	 %o0, %l3	 
	!STOREAI	0, 73, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 73, 4
	st	%g0, [%l3 + 4]
	!STOREAI	0, 73, 8
	st	%g0, [%l3 + 8]
	!NEW	12, 1
	mov	12, %o0
	call	malloc
	nop
	!MOV	1, 74
	mov	 %o0, %l6	 
	!STOREAI	0, 74, 0
	st	%g0, [%l6 + 0]
	!STOREAI	0, 74, 4
	st	%g0, [%l6 + 4]
	!STOREAI	0, 74, 8
	st	%g0, [%l6 + 8]
	!LOADI	666, 75
	set	 666, %l1	 	!int: reg 75 gets val 666
	!MOV	75, 16
	mov	 %l1, %l1	 
	!READ	77
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	77, 70
	mov	 %l1, %l3	 
 !#if-guard:
	!LOADI	0, 81
	set	 0, %l1	 	!int: reg 81 gets val 0
	!MOV	70, 80
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 79
	mov	 %g0, %l4	 
	!COMP	80, 81, 2
	cmp	 %l2, %l1	 
	!MOVLE	2, 3, 79
	movle	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	79, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 79) to true
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!LOADI	1, 83
	set	 1, %l1	 	!int: reg 83 gets val 1
	!LOADI	-1, 84
	mov	 -1, %l2	 
	!MULT	83, 84, 82
	smul	 %l1, %l2, %l1	 
	!PRINTLN	82
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 85
	set	 1, %l1	 	!int: reg 85 gets val 1
	!LOADI	-1, 86
	mov	 -1, %l2	 
	!MULT	85, 86, 4
	smul	 %l1, %l2, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S14
	ba	 .S14	 	!then: jump to #end-if '.S14'
	nop
 .S14:
.S13:
	!LOADI	1000, 89
	set	 1000, %l1	 	!int: reg 89 gets val 1000
	!MOV	70, 88
	mov	 %l3, %l2	 
	!MULT	88, 89, 87
	smul	 %l2, %l1, %l1	 
	!MOV	87, 70
	mov	 %l1, %l3	 
	!MOV	70, 91
	mov	 %l3, %l1	 
	!MOV	91, 71
	mov	 %l1, %l5	 
	!NEW	12, 1
	mov	12, %o0
	call	malloc
	nop
	!MOV	1, 93
	mov	 %o0, %l1	 
	!STOREAI	0, 93, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 93, 4
	st	%g0, [%l1 + 4]
	!STOREAI	0, 93, 8
	st	%g0, [%l1 + 8]
	!MOV	93, 73
	mov	 %l1, %l3	 
	!MOV	71, 95
	mov	 %l5, %l1	 
	!MOV	73, 96
	mov	 %l3, %l2	 
	!STOREAI	95, 96, 0
	st	%l1, [%l2 + 0]
	!MOV	73, 98
	mov	 %l3, %l1	 
	!MOV	73, 99
	mov	 %l3, %l2	 
	!STOREAI	98, 99, 4
	st	%l1, [%l2 + 4]
	!MOV	73, 101
	mov	 %l3, %l1	 
	!MOV	73, 102
	mov	 %l3, %l2	 
	!STOREAI	101, 102, 8
	st	%l1, [%l2 + 8]
	!LOADI	1, 106
	set	 1, %l1	 	!int: reg 106 gets val 1
	!MOV	71, 105
	mov	 %l5, %l2	 
	!SUB	105, 106, 104
	sub	 %l2, %l1, %l1	 
	!MOV	104, 71
	mov	 %l1, %l5	 
	!MOV	73, 108
	mov	 %l3, %l1	 
	!MOV	108, 74
	mov	 %l1, %l6	 
 !#while-guard:
.S15:
	!LOADI	0, 112
	set	 0, %l1	 	!int: reg 112 gets val 0
	!MOV	71, 111
	mov	 %l5, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 110
	mov	 %g0, %l4	 
	!COMP	111, 112, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 110
	movg	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	110, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 110) to true
	!CBREQ	2, .S16, .S17
	be	 .S16	 	!while: branch true: '.S16' false: '.S17'
	nop
	ba	.S17 	!while: branch true: '.S16' false: '.S17'
	nop
 .S16:
	!NEW	12, 1
	mov	12, %o0
	call	malloc
	nop
	!MOV	1, 113
	mov	 %o0, %l1	 
	!STOREAI	0, 113, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 113, 4
	st	%g0, [%l1 + 4]
	!STOREAI	0, 113, 8
	st	%g0, [%l1 + 8]
	!MOV	113, 72
	mov	 %l1, %l4	 
	!MOV	71, 115
	mov	 %l5, %l1	 
	!MOV	72, 116
	mov	 %l4, %l2	 
	!STOREAI	115, 116, 0
	st	%l1, [%l2 + 0]
	!MOV	74, 118
	mov	 %l6, %l1	 
	!MOV	72, 119
	mov	 %l4, %l2	 
	!STOREAI	118, 119, 4
	st	%l1, [%l2 + 4]
	!MOV	73, 121
	mov	 %l3, %l1	 
	!MOV	72, 122
	mov	 %l4, %l2	 
	!STOREAI	121, 122, 8
	st	%l1, [%l2 + 8]
	!MOV	72, 124
	mov	 %l4, %l2	 
	!MOV	74, 125
	mov	 %l6, %l1	 
	!STOREAI	124, 125, 8
	st	%l2, [%l1 + 8]
	!MOV	72, 127
	mov	 %l4, %l1	 
	!MOV	127, 74
	mov	 %l1, %l6	 
	!LOADI	1, 131
	set	 1, %l1	 	!int: reg 131 gets val 1
	!MOV	71, 130
	mov	 %l5, %l2	 
	!SUB	130, 131, 129
	sub	 %l2, %l1, %l1	 
	!MOV	129, 71
	mov	 %l1, %l5	 
	!JUMPI	.S15
	ba	 .S15	 	!while: jump back to guard
	nop
 .S17:
	!MOV	73, 133
	mov	 %l3, %l0	 
	!STOREOUTARGUMENT	133, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 133to register outReg 1
	!CALL	deathSort
	call	 deathSort	
	nop
	!MOV	73, 134
	mov	 %l3, %l0	 
	!STOREOUTARGUMENT	134, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 134to register outReg 1
	!CALL	printEVILList
	call	 printEVILList	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
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
	!STOREINARGUMENT	10, 54
	mov	 %i0, %l1	 
 !#function-body:
	!NEW	12, 1
	mov	12, %o0
	call	malloc
	nop
	!MOV	1, 55
	mov	 %o0, %l4	 
	!STOREAI	0, 55, 0
	st	%g0, [%l4 + 0]
	!STOREAI	0, 55, 4
	st	%g0, [%l4 + 4]
	!STOREAI	0, 55, 8
	st	%g0, [%l4 + 8]
	!NEW	12, 1
	mov	12, %o0
	call	malloc
	nop
	!MOV	1, 56
	mov	 %o0, %l2	 
	!STOREAI	0, 56, 0
	st	%g0, [%l2 + 0]
	!STOREAI	0, 56, 4
	st	%g0, [%l2 + 4]
	!STOREAI	0, 56, 8
	st	%g0, [%l2 + 8]
	!MOV	54, 57
	mov	 %l1, %l2	 
	!LOADAI	57, 8, 57
	ld	[%l2 + 8], %l2
	!MOV	57, 55
	mov	 %l2, %l4	 
	!MOV	54, 59
	mov	 %l1, %l2	 
	!LOADAI	59, 0, 59
	ld	[%l2 + 0], %l2
	!PRINTLN	59
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l2, %o1
	call	printf, 0
	nop
 !#while-guard:
.S9:
	!MOV	54, 63
	mov	 %l1, %l2	 
	!MOV	55, 62
	mov	 %l4, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 61
	mov	 %g0, %l5	 
	!COMP	62, 63, 2
	cmp	 %l3, %l2	 
	!MOVNE	2, 3, 61
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	61, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 61) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!MOV	55, 64
	mov	 %l4, %l2	 
	!MOV	64, 56
	mov	 %l2, %l2	 
	!MOV	55, 66
	mov	 %l4, %l2	 
	!LOADAI	66, 0, 66
	ld	[%l2 + 0], %l2
	!PRINTLN	66
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l2, %o1
	call	printf, 0
	nop
	!MOV	55, 67
	mov	 %l4, %l2	 
	!LOADAI	67, 8, 67
	ld	[%l2 + 8], %l2
	!MOV	67, 55
	mov	 %l2, %l4	 
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
	!STOREINARGUMENT	10, 21
	mov	 %i0, %l1	 
 !#function-body:
	!NEW	12, 1
	mov	12, %o0
	call	malloc
	nop
	!MOV	1, 24
	mov	 %o0, %l3	 
	!STOREAI	0, 24, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 24, 4
	st	%g0, [%l3 + 4]
	!STOREAI	0, 24, 8
	st	%g0, [%l3 + 8]
	!LOADI	1, 25
	set	 1, %l2	 	!int: reg 25 gets val 1
	!MOV	25, 22
	mov	 %l2, %l4	 
 !#while-guard:
.S0:
	!LOADI	1, 29
	set	 1, %l2	 	!int: reg 29 gets val 1
	!MOV	22, 28
	mov	 %l4, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 27
	mov	 %g0, %l4	 
	!COMP	28, 29, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 27
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	27, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 27) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!LOADI	0, 30
	set	 0, %l2	 	!int: reg 30 gets val 0
	!MOV	30, 22
	mov	 %l2, %l4	 
	!MOV	21, 32
	mov	 %l1, %l2	 
	!MOV	32, 24
	mov	 %l2, %l3	 
 !#while-guard:
.S3:
	!MOV	21, 36
	mov	 %l1, %l2	 
	!MOV	24, 35
	mov	 %l3, %l4	 
	!LOADAI	35, 8, 35
	ld	[%l4 + 8], %l4
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 34
	mov	 %g0, %l5	 
	!COMP	35, 36, 2
	cmp	 %l4, %l2	 
	!MOVNE	2, 3, 34
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	34, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 34) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
 !#if-guard:
	!LOADI	0, 39
	set	 0, %l1	 	!int: reg 39 gets val 0
	!MOV	24, 40
	mov	 %l3, %l2	 
	!STOREOUTARGUMENT	40, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 40to register outReg 1
	!MOV	24, 40
	mov	 %l3, %l2	 
	!LOADAI	40, 8, 40
	ld	[%l2 + 8], %l2
	!STOREOUTARGUMENT	40, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 40to register outReg 2
	!CALL	compare
	call	 compare	
	nop
	!MOV	1, 38
	mov	 %o0, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 37
	mov	 %g0, %l0	 
	!COMP	38, 39, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 37
	movg	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	37, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 37) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	24, 41
	mov	 %l3, %l0	 
	!LOADAI	41, 0, 41
	ld	[%l0 + 0], %l0
	!MOV	41, 23
	mov	 %l0, %l0	 
	!MOV	24, 43
	mov	 %l3, %l2	 
	!LOADAI	43, 8, 43
	ld	[%l2 + 8], %l2
	!LOADAI	43, 0, 43
	ld	[%l2 + 0], %l2
	!MOV	24, 44
	mov	 %l3, %l1	 
	!STOREAI	43, 44, 0
	st	%l2, [%l1 + 0]
	!MOV	23, 46
	mov	 %l0, %l0	 
	!MOV	24, 47
	mov	 %l3, %l1	 
	!LOADAI	47, 8, 47
	ld	[%l1 + 8], %l1
	!STOREAI	46, 47, 0
	st	%l0, [%l1 + 0]
	!LOADI	1, 50
	set	 1, %l0	 	!int: reg 50 gets val 1
	!MOV	50, 22
	mov	 %l0, %l4	 
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!MOV	24, 52
	mov	 %l3, %l0	 
	!LOADAI	52, 8, 52
	ld	[%l0 + 8], %l0
	!MOV	52, 24
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
	!STOREINARGUMENT	10, 17
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 18
	mov	 %i1, %l0	 
 !#function-body:
	!MOV	18, 20
	mov	 %l0, %l0	 
	!LOADAI	20, 0, 20
	ld	[%l0 + 0], %l0
	!MOV	17, 19
	mov	 %l1, %l1	 
	!LOADAI	19, 0, 19
	ld	[%l1 + 0], %l1
	!SUB	19, 20, 4
	sub	 %l1, %l0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 