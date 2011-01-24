	.file	"primes.ev"
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
	!MOV	78, 80
	mov	 %l1, %l1	 	!lvalue id: move reg 78 (var limit) to reg 80
	!READ	80
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	80, 78
	mov	 %l1, %l1	 
	!LOADI	0, 82
	set	 0, %l3	 	!int: reg 82 gets val 0
	!MOV	79, 83
	mov	 %l2, %l2	 	!lvalue id: move reg 79 (var a) to reg 83
	!MOV	82, 83
	mov	 %l3, %l2	 
	!MOV	83, 79
	mov	 %l2, %l2	 
 !#while-guard:
.S12:
	!MOV	78, 87
	mov	 %l1, %l3	 
	!MOV	79, 86
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 85
	mov	 %g0, %l5	 
	!COMP	86, 87, 2
	cmp	 %l4, %l3	 
	!MOVLE	2, 3, 85
	movle	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	85, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 85) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
 !#if-guard:
	!MOV	79, 89
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	89, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 89to register outReg 1
	!CALL	prime
	call	 prime	
	nop
	!MOV	1, 88
	mov	 %o0, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	88, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 88) to true
	!CBREQ	2, .S15, .S16
	be	 .S15	 	!if: branch true: '.S15' false: '.S16'
	nop
	ba	.S16 	!if: branch true: '.S15' false: '.S16'
	nop
 .S15:
	!MOV	79, 90
	mov	 %l2, %l0	 
	!PRINTLN	90
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!JUMPI	.S17
	ba	 .S17	 	!then: jump to #end-if '.S17'
	nop
 .S17:
.S16:
	!LOADI	1, 94
	set	 1, %l0	 	!int: reg 94 gets val 1
	!MOV	79, 93
	mov	 %l2, %l1	 
	!ADD	93, 94, 91
	add	 %l1, %l0, %l1	 
	!MOV	79, 92
	mov	 %l2, %l0	 	!lvalue id: move reg 79 (var a) to reg 92
	!MOV	91, 92
	mov	 %l1, %l0	 
	!MOV	92, 79
	mov	 %l0, %l2	 
	!JUMPI	.S12
	ba	 .S12	 	!while: jump back to guard
	nop
 .S14:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	prime
	.type	prime, #function
	.proc	04
!#function-entry:
prime:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 42
	mov	 %i0, %l5	 
 !#function-body:
 !#if-guard:
	!LOADI	2, 48
	set	 2, %l4	 	!int: reg 48 gets val 2
	!MOV	42, 47
	mov	 %l5, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 46
	mov	 %g0, %l7	 
	!COMP	47, 48, 2
	cmp	 %l6, %l4	 
	!MOVLT	2, 3, 46
	movl	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	46, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 46) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	0, 4
	mov	 %g0, %i0	 	!bool: reg 4 gets false
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
 .S4:
	!MOV	42, 51
	mov	 %l5, %l4	 
	!STOREOUTARGUMENT	51, 5
	mov	 %l4, %o0	 	!argument: store out param from reg 51to register outReg 1
	!CALL	isqrt
	call	 isqrt	
	nop
	!MOV	1, 49
	mov	 %o0, %l4	 
	!MOV	43, 50
	mov	 %l1, %l1	 	!lvalue id: move reg 43 (var max) to reg 50
	!MOV	49, 50
	mov	 %l4, %l1	 
	!MOV	50, 43
	mov	 %l1, %l1	 
	!LOADI	2, 53
	set	 2, %l4	 	!int: reg 53 gets val 2
	!MOV	44, 54
	mov	 %l3, %l3	 	!lvalue id: move reg 44 (var divisor) to reg 54
	!MOV	53, 54
	mov	 %l4, %l3	 
	!MOV	54, 44
	mov	 %l3, %l3	 
 !#while-guard:
.S6:
	!MOV	43, 58
	mov	 %l1, %l4	 
	!MOV	44, 57
	mov	 %l3, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 56
	mov	 %g0, %l7	 
	!COMP	57, 58, 2
	cmp	 %l6, %l4	 
	!MOVLE	2, 3, 56
	movle	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	56, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 56) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!MOV	45, 59
	mov	 %l2, %l4	 
	!PRINTLN	59
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l4, %o1
	call	printf, 0
	nop
	!MOV	44, 65
	mov	 %l3, %l4	 
	!MOV	44, 67
	mov	 %l3, %l6	 
	!MOV	42, 66
	mov	 %l5, %l7	 
	!DIV	66, 67, 64
	sdiv	 %l7, %l6, %l6	 
	!MULT	64, 65, 63
	smul	 %l6, %l4, %l4	 
	!MOV	42, 62
	mov	 %l5, %l6	 
	!SUB	62, 63, 60
	sub	 %l6, %l4, %l4	 
	!MOV	45, 61
	mov	 %l2, %l2	 	!lvalue id: move reg 45 (var remainder) to reg 61
	!MOV	60, 61
	mov	 %l4, %l2	 
	!MOV	61, 45
	mov	 %l2, %l2	 
	!MOV	45, 69
	mov	 %l2, %l4	 
	!PRINTLN	69
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l4, %o1
	call	printf, 0
	nop
 !#if-guard:
	!LOADI	0, 72
	set	 0, %l1	 	!int: reg 72 gets val 0
	!MOV	45, 71
	mov	 %l2, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 70
	mov	 %g0, %l4	 
	!COMP	71, 72, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 70
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	70, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 70) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!MOV	0, 4
	mov	 %g0, %i0	 	!bool: reg 4 gets false
	!RET	
	ret
	restore
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
.S10:
	!LOADI	1, 76
	set	 1, %l0	 	!int: reg 76 gets val 1
	!MOV	44, 75
	mov	 %l3, %l1	 
	!ADD	75, 76, 73
	add	 %l1, %l0, %l1	 
	!MOV	44, 74
	mov	 %l3, %l0	 	!lvalue id: move reg 44 (var divisor) to reg 74
	!MOV	73, 74
	mov	 %l1, %l0	 
	!MOV	74, 44
	mov	 %l0, %l3	 
	!JUMPI	.S6
	ba	 .S6	 	!while: jump back to guard
	nop
 .S8:
	!LOADI	1, 4
	set	 1, %i0	 	!bool: reg 4 gets true
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	isqrt
	.type	isqrt, #function
	.proc	04
!#function-entry:
isqrt:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l1	 
 !#function-body:
	!LOADI	1, 19
	set	 1, %l2	 	!int: reg 19 gets val 1
	!MOV	17, 20
	mov	 %l5, %l3	 	!lvalue id: move reg 17 (var square) to reg 20
	!MOV	19, 20
	mov	 %l2, %l3	 
	!MOV	20, 17
	mov	 %l3, %l5	 
	!LOADI	3, 22
	set	 3, %l2	 	!int: reg 22 gets val 3
	!MOV	18, 23
	mov	 %l4, %l3	 	!lvalue id: move reg 18 (var delta) to reg 23
	!MOV	22, 23
	mov	 %l2, %l3	 
	!MOV	23, 18
	mov	 %l3, %l4	 
 !#while-guard:
.S0:
	!MOV	16, 27
	mov	 %l1, %l2	 
	!MOV	17, 26
	mov	 %l5, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 25
	mov	 %g0, %l6	 
	!COMP	26, 27, 2
	cmp	 %l3, %l2	 
	!MOVLE	2, 3, 25
	movle	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	25, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 25) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!MOV	18, 31
	mov	 %l4, %l2	 
	!MOV	17, 30
	mov	 %l5, %l3	 
	!ADD	30, 31, 28
	add	 %l3, %l2, %l2	 
	!MOV	17, 29
	mov	 %l5, %l3	 	!lvalue id: move reg 17 (var square) to reg 29
	!MOV	28, 29
	mov	 %l2, %l3	 
	!MOV	29, 17
	mov	 %l3, %l5	 
	!LOADI	2, 36
	set	 2, %l2	 	!int: reg 36 gets val 2
	!MOV	18, 35
	mov	 %l4, %l3	 
	!ADD	35, 36, 33
	add	 %l3, %l2, %l2	 
	!MOV	18, 34
	mov	 %l4, %l3	 	!lvalue id: move reg 18 (var delta) to reg 34
	!MOV	33, 34
	mov	 %l2, %l3	 
	!MOV	34, 18
	mov	 %l3, %l4	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!LOADI	1, 39
	set	 1, %l0	 	!int: reg 39 gets val 1
	!LOADI	2, 41
	set	 2, %l1	 	!int: reg 41 gets val 2
	!MOV	18, 40
	mov	 %l4, %l2	 
	!DIV	40, 41, 38
	sdiv	 %l2, %l1, %l1	 
	!SUB	38, 39, 4
	sub	 %l1, %l0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 