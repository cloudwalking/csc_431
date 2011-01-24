	.file	"binaryConverter.ev"
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
	!READ	86
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	86, 84
	mov	 %l1, %l3	 
	!MOV	84, 89
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	89, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 89to register outReg 1
	!CALL	convertToDecimal
	call	 convertToDecimal	
	nop
	!MOV	1, 88
	mov	 %o0, %l1	 
	!MOV	88, 84
	mov	 %l1, %l3	 
	!MOV	84, 93
	mov	 %l3, %l1	 
	!MOV	84, 92
	mov	 %l3, %l2	 
	!MULT	92, 93, 91
	smul	 %l2, %l1, %l1	 
	!MOV	91, 85
	mov	 %l1, %l4	 
 !#while-guard:
.S12:
	!LOADI	0, 97
	set	 0, %l1	 	!int: reg 97 gets val 0
	!MOV	85, 96
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 95
	mov	 %g0, %l5	 
	!COMP	96, 97, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 95
	movg	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	95, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 95) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
	!MOV	85, 98
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	98, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 98to register outReg 1
	!CALL	wait
	call	 wait	
	nop
	!LOADI	1, 101
	set	 1, %l1	 	!int: reg 101 gets val 1
	!MOV	85, 100
	mov	 %l4, %l2	 
	!SUB	100, 101, 99
	sub	 %l2, %l1, %l1	 
	!MOV	99, 85
	mov	 %l1, %l4	 
	!JUMPI	.S12
	ba	 .S12	 	!while: jump back to guard
	nop
 .S14:
	!MOV	84, 103
	mov	 %l3, %l1	 
	!PRINTLN	103
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
 !#function-exit:
 	.section	".text"
	.align	4
	.global	convertToDecimal
	.type	convertToDecimal, #function
	.proc	04
!#function-entry:
convertToDecimal:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 76
	mov	 %i0, %l1	 
 !#function-body:
	!LOADI	0, 79
	set	 0, %l2	 	!int: reg 79 gets val 0
	!MOV	79, 77
	mov	 %l2, %l2	 
	!LOADI	0, 81
	set	 0, %l3	 	!int: reg 81 gets val 0
	!MOV	81, 78
	mov	 %l3, %l3	 
	!MOV	76, 83
	mov	 %l1, %l1	 
	!STOREOUTARGUMENT	83, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 83to register outReg 1
	!MOV	78, 83
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	83, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 83to register outReg 2
	!MOV	77, 83
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	83, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 83to register outReg 3
	!CALL	recursiveDecimalSum
	call	 recursiveDecimalSum	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	recursiveDecimalSum
	.type	recursiveDecimalSum, #function
	.proc	04
!#function-entry:
recursiveDecimalSum:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 40
	mov	 %i0, %l4	 
	!STOREINARGUMENT	11, 41
	mov	 %i1, %l6	 
	!STOREINARGUMENT	12, 42
	mov	 %i2, %l3	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 48
	set	 0, %l1	 	!int: reg 48 gets val 0
	!MOV	40, 47
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 46
	mov	 %g0, %l5	 
	!COMP	47, 48, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 46
	movg	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	46, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 46) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!LOADI	2, 49
	set	 2, %l1	 	!int: reg 49 gets val 2
	!MOV	49, 44
	mov	 %l1, %l1	 
	!LOADI	10, 53
	set	 10, %l2	 	!int: reg 53 gets val 10
	!MOV	40, 52
	mov	 %l4, %l5	 
	!DIV	52, 53, 51
	sdiv	 %l5, %l2, %l2	 
	!MOV	51, 43
	mov	 %l2, %l5	 
	!LOADI	10, 57
	set	 10, %l2	 	!int: reg 57 gets val 10
	!MOV	43, 56
	mov	 %l5, %l5	 
	!MULT	56, 57, 55
	smul	 %l5, %l2, %l2	 
	!MOV	55, 43
	mov	 %l2, %l5	 
	!MOV	43, 61
	mov	 %l5, %l2	 
	!MOV	40, 60
	mov	 %l4, %l5	 
	!SUB	60, 61, 59
	sub	 %l5, %l2, %l2	 
	!MOV	59, 43
	mov	 %l2, %l5	 
 !#if-guard:
	!LOADI	1, 65
	set	 1, %l2	 	!int: reg 65 gets val 1
	!MOV	43, 64
	mov	 %l5, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 63
	mov	 %g0, %l7	 
	!COMP	64, 65, 2
	cmp	 %l5, %l2	 
	!MOVEQ	2, 3, 63
	move	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	63, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 63) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!MOV	44, 69
	mov	 %l1, %l1	 
	!STOREOUTARGUMENT	69, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 69to register outReg 1
	!MOV	42, 69
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	69, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 69to register outReg 2
	!CALL	power
	call	 power	
	nop
	!MOV	1, 68
	mov	 %o0, %l1	 
	!MOV	41, 67
	mov	 %l6, %l2	 
	!ADD	67, 68, 66
	add	 %l2, %l1, %l1	 
	!MOV	66, 41
	mov	 %l1, %l6	 
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
.S10:
	!LOADI	10, 73
	set	 10, %l1	 	!int: reg 73 gets val 10
	!MOV	40, 72
	mov	 %l4, %l2	 
	!DIV	72, 73, 71
	sdiv	 %l2, %l1, %l1	 
	!STOREOUTARGUMENT	71, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 71to register outReg 1
	!MOV	41, 71
	mov	 %l6, %l1	 
	!STOREOUTARGUMENT	71, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 71to register outReg 2
	!LOADI	1, 75
	set	 1, %l1	 	!int: reg 75 gets val 1
	!MOV	42, 74
	mov	 %l3, %l2	 
	!ADD	74, 75, 71
	add	 %l2, %l1, %l1	 
	!STOREOUTARGUMENT	71, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 71to register outReg 3
	!CALL	recursiveDecimalSum
	call	 recursiveDecimalSum	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!MOV	41, 4
	mov	 %l6, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	power
	.type	power, #function
	.proc	04
!#function-entry:
power:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 24
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 25
	mov	 %i1, %l4	 
 !#function-body:
	!LOADI	1, 27
	set	 1, %l2	 	!int: reg 27 gets val 1
	!MOV	27, 26
	mov	 %l2, %l5	 
 !#while-guard:
.S3:
	!LOADI	0, 31
	set	 0, %l2	 	!int: reg 31 gets val 0
	!MOV	25, 30
	mov	 %l4, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 29
	mov	 %g0, %l6	 
	!COMP	30, 31, 2
	cmp	 %l3, %l2	 
	!MOVGT	2, 3, 29
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	29, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 29) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
	!MOV	24, 34
	mov	 %l1, %l2	 
	!MOV	26, 33
	mov	 %l5, %l3	 
	!MULT	33, 34, 32
	smul	 %l3, %l2, %l2	 
	!MOV	32, 26
	mov	 %l2, %l5	 
	!LOADI	1, 38
	set	 1, %l2	 	!int: reg 38 gets val 1
	!MOV	25, 37
	mov	 %l4, %l3	 
	!SUB	37, 38, 36
	sub	 %l3, %l2, %l2	 
	!MOV	36, 25
	mov	 %l2, %l4	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
	!MOV	26, 4
	mov	 %l5, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	wait
	.type	wait, #function
	.proc	04
!#function-entry:
wait:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l3	 
 !#function-body:
 !#while-guard:
.S0:
	!LOADI	0, 19
	set	 0, %l1	 	!int: reg 19 gets val 0
	!MOV	16, 18
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 17
	mov	 %g0, %l4	 
	!COMP	18, 19, 2
	cmp	 %l2, %l1	 
	!MOVGT	2, 3, 17
	movg	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	17, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 17) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!LOADI	1, 22
	set	 1, %l1	 	!int: reg 22 gets val 1
	!MOV	16, 21
	mov	 %l3, %l2	 
	!SUB	21, 22, 20
	sub	 %l2, %l1, %l1	 
	!MOV	20, 16
	mov	 %l1, %l3	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 