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
	!MOV	95, 97
	mov	 %l4, %l1	 	!lvalue id: move reg 95 (var number) to reg 97
	!READ	97
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	97, 95
	mov	 %l1, %l4	 
	!MOV	95, 101
	mov	 %l4, %l1	 	!id: move reg 95 (var mainnumber) to reg 101
	!STOREOUTARGUMENT	101, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 101to register outReg 1
	!CALL	convertToDecimal
	call	 convertToDecimal	
	nop
	!MOV	1, 99
	mov	 %o0, %l1	 
	!MOV	95, 100
	mov	 %l4, %l2	 	!lvalue id: move reg 95 (var number) to reg 100
	!MOV	99, 100
	mov	 %l1, %l2	 
	!MOV	100, 95
	mov	 %l2, %l4	 
	!MOV	95, 106
	mov	 %l4, %l1	 	!id: move reg 95 (var mainnumber) to reg 106
	!MOV	95, 105
	mov	 %l4, %l2	 	!id: move reg 95 (var mainnumber) to reg 105
	!MULT	105, 106, 103
	smul	 %l2, %l1, %l1	 	!expression: reg 105 (var null) * 106 in reg 103 (var null)
	!MOV	96, 104
	mov	 %l3, %l2	 	!lvalue id: move reg 96 (var waitTime) to reg 104
	!MOV	103, 104
	mov	 %l1, %l2	 
	!MOV	104, 96
	mov	 %l2, %l3	 
 !#while-guard:
.S12:
	!LOADI	0, 110
	mov	 0, %l1	 	!int: reg 110 gets val 0
	!MOV	96, 109
	mov	 %l3, %l2	 	!id: move reg 96 (var mainwaitTime) to reg 109
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 108
	mov	 %g0, %l5	 
	!COMP	109, 110, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 109 (var null) to 110 (var null), store in cc-reg
	!MOVGT	2, 3, 108
	movg	 %icc, %g1, %l5	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	108, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 108) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
	!MOV	96, 111
	mov	 %l3, %l1	 	!id: move reg 96 (var mainwaitTime) to reg 111
	!STOREOUTARGUMENT	111, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 111to register outReg 1
	!CALL	wait
	call	 wait	
	nop
	!LOADI	1, 115
	mov	 1, %l1	 	!int: reg 115 gets val 1
	!MOV	96, 114
	mov	 %l3, %l2	 	!id: move reg 96 (var mainwaitTime) to reg 114
	!SUB	114, 115, 112
	sub	 %l2, %l1, %l1	 	!expression: reg 114 (var null) - 115 in reg 112 (var null)
	!MOV	96, 113
	mov	 %l3, %l2	 	!lvalue id: move reg 96 (var waitTime) to reg 113
	!MOV	112, 113
	mov	 %l1, %l2	 
	!MOV	113, 96
	mov	 %l2, %l3	 
	!JUMPI	.S12
	ba	 .S12	 	!while: jump back to guard
	nop
 .S14:
	!MOV	95, 117
	mov	 %l4, %l0	 	!id: move reg 95 (var mainnumber) to reg 117
	!PRINTLN	117
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
	.global	convertToDecimal
	.type	convertToDecimal, #function
	.proc	04
!#function-entry:
convertToDecimal:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 85
	mov	 %i0, %l3	 
 !#function-body:
	!LOADI	0, 88
	mov	 0, %l4	 	!int: reg 88 gets val 0
	!MOV	86, 89
	mov	 %l2, %l2	 	!lvalue id: move reg 86 (var recursiveDepth) to reg 89
	!MOV	88, 89
	mov	 %l4, %l2	 
	!MOV	89, 86
	mov	 %l2, %l2	 
	!LOADI	0, 91
	mov	 0, %l4	 	!int: reg 91 gets val 0
	!MOV	87, 92
	mov	 %l1, %l1	 	!lvalue id: move reg 87 (var decimalSum) to reg 92
	!MOV	91, 92
	mov	 %l4, %l1	 
	!MOV	92, 87
	mov	 %l1, %l1	 
	!MOV	85, 94
	mov	 %l3, %l3	 	!id: move reg 85 (var convertToDecimalbinaryNum) to reg 94
	!STOREOUTARGUMENT	94, 5
	mov	 %l3, %o0	 	!argument: store out param from reg 94to register outReg 1
	!MOV	87, 94
	mov	 %l1, %l3	 	!id: move reg 87 (var convertToDecimaldecimalSum) to reg 94
	!STOREOUTARGUMENT	94, 6
	mov	 %l3, %o1	 	!argument: store out param from reg 94to register outReg 2
	!MOV	86, 94
	mov	 %l2, %l3	 	!id: move reg 86 (var convertToDecimalrecursiveDepth) to reg 94
	!STOREOUTARGUMENT	94, 7
	mov	 %l3, %o2	 	!argument: store out param from reg 94to register outReg 3
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
	!STOREINARGUMENT	10, 44
	mov	 %i0, %l4	 
	!STOREINARGUMENT	11, 45
	mov	 %i1, %l6	 
	!STOREINARGUMENT	12, 46
	mov	 %i2, %l3	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 52
	mov	 0, %l2	 	!int: reg 52 gets val 0
	!MOV	44, 51
	mov	 %l4, %l5	 	!id: move reg 44 (var recursiveDecimalSumbinaryNum) to reg 51
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 50
	mov	 %g0, %l7	 
	!COMP	51, 52, 2
	cmp	 %l5, %l2	 	!expression: compare: reg 51 (var null) to 52 (var null), store in cc-reg
	!MOVGT	2, 3, 50
	movg	 %icc, %g1, %l7	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	50, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 50) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!LOADI	2, 53
	mov	 2, %l2	 	!int: reg 53 gets val 2
	!MOV	48, 54
	mov	 %l1, %l1	 	!lvalue id: move reg 48 (var base) to reg 54
	!MOV	53, 54
	mov	 %l2, %l1	 
	!MOV	54, 48
	mov	 %l1, %l1	 
	!LOADI	10, 59
	mov	 10, %l2	 	!int: reg 59 gets val 10
	!MOV	44, 58
	mov	 %l4, %l5	 	!id: move reg 44 (var recursiveDecimalSumbinaryNum) to reg 58
	!DIV	58, 59, 56
	sdiv	 %l5, %l2, %l2	 	!expression: reg 58 (var null) / 59 in reg 56 (var null)
	!MOV	47, 57
	mov	 %g2, %l5	 	!lvalue id: move reg 47 (var tempNum) to reg 57
	!MOV	56, 57
	mov	 %l2, %l5	 
	!MOV	57, 47
	mov	 %l5, %g2	 
	!LOADI	10, 64
	mov	 10, %l2	 	!int: reg 64 gets val 10
	!MOV	47, 63
	mov	 %g2, %l5	 	!id: move reg 47 (var recursiveDecimalSumtempNum) to reg 63
	!MULT	63, 64, 61
	smul	 %l5, %l2, %l2	 	!expression: reg 63 (var null) * 64 in reg 61 (var null)
	!MOV	47, 62
	mov	 %g2, %l5	 	!lvalue id: move reg 47 (var tempNum) to reg 62
	!MOV	61, 62
	mov	 %l2, %l5	 
	!MOV	62, 47
	mov	 %l5, %g2	 
	!MOV	47, 69
	mov	 %g2, %l2	 	!id: move reg 47 (var recursiveDecimalSumtempNum) to reg 69
	!MOV	44, 68
	mov	 %l4, %l5	 	!id: move reg 44 (var recursiveDecimalSumbinaryNum) to reg 68
	!SUB	68, 69, 66
	sub	 %l5, %l2, %l2	 	!expression: reg 68 (var null) - 69 in reg 66 (var null)
	!MOV	47, 67
	mov	 %g2, %l5	 	!lvalue id: move reg 47 (var tempNum) to reg 67
	!MOV	66, 67
	mov	 %l2, %l5	 
	!MOV	67, 47
	mov	 %l5, %g2	 
 !#if-guard:
	!LOADI	1, 73
	mov	 1, %l2	 	!int: reg 73 gets val 1
	!MOV	47, 72
	mov	 %g2, %l5	 	!id: move reg 47 (var recursiveDecimalSumtempNum) to reg 72
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 71
	mov	 %g0, %l7	 
	!COMP	72, 73, 2
	cmp	 %l5, %l2	 	!expression: compare: reg 72 (var null) to 73 (var null), store in cc-reg
	!MOVEQ	2, 3, 71
	move	 %icc, %g1, %l7	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	71, 3, 2
	cmp	 %l7, %g1	 	!if: compare guard result (reg 71) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!MOV	48, 78
	mov	 %l1, %l1	 	!id: move reg 48 (var recursiveDecimalSumbase) to reg 78
	!STOREOUTARGUMENT	78, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 78to register outReg 1
	!MOV	46, 78
	mov	 %l3, %l1	 	!id: move reg 46 (var recursiveDecimalSumrecursiveDepth) to reg 78
	!STOREOUTARGUMENT	78, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 78to register outReg 2
	!CALL	power
	call	 power	
	nop
	!MOV	1, 77
	mov	 %o0, %l1	 
	!MOV	45, 76
	mov	 %l6, %l2	 	!id: move reg 45 (var recursiveDecimalSumdecimalSum) to reg 76
	!ADD	76, 77, 74
	add	 %l2, %l1, %l1	 	!expression: reg 76 (var null) + 77 in reg 74 (var null)
	!MOV	45, 75
	mov	 %l6, %l2	 	!lvalue id: move reg 45 (var decimalSum) to reg 75
	!MOV	74, 75
	mov	 %l1, %l2	 
	!MOV	75, 45
	mov	 %l2, %l6	 
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
.S10:
	!LOADI	10, 82
	mov	 10, %l1	 	!int: reg 82 gets val 10
	!MOV	44, 81
	mov	 %l4, %l2	 	!id: move reg 44 (var recursiveDecimalSumbinaryNum) to reg 81
	!DIV	81, 82, 80
	sdiv	 %l2, %l1, %l1	 	!expression: reg 81 (var null) / 82 in reg 80 (var null)
	!STOREOUTARGUMENT	80, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 80to register outReg 1
	!MOV	45, 80
	mov	 %l6, %l1	 	!id: move reg 45 (var recursiveDecimalSumdecimalSum) to reg 80
	!STOREOUTARGUMENT	80, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 80to register outReg 2
	!LOADI	1, 84
	mov	 1, %l1	 	!int: reg 84 gets val 1
	!MOV	46, 83
	mov	 %l3, %l2	 	!id: move reg 46 (var recursiveDecimalSumrecursiveDepth) to reg 83
	!ADD	83, 84, 80
	add	 %l2, %l1, %l1	 	!expression: reg 83 (var null) + 84 in reg 80 (var null)
	!STOREOUTARGUMENT	80, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 80to register outReg 3
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
	!MOV	45, 4
	mov	 %l6, %i0	 	!id: move reg 45 (var recursiveDecimalSumdecimalSum) to reg 4
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
	!STOREINARGUMENT	10, 25
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 26
	mov	 %i1, %l5	 
 !#function-body:
	!LOADI	1, 28
	mov	 1, %l2	 	!int: reg 28 gets val 1
	!MOV	27, 29
	mov	 %l4, %l3	 	!lvalue id: move reg 27 (var product) to reg 29
	!MOV	28, 29
	mov	 %l2, %l3	 
	!MOV	29, 27
	mov	 %l3, %l4	 
 !#while-guard:
.S3:
	!LOADI	0, 33
	mov	 0, %l2	 	!int: reg 33 gets val 0
	!MOV	26, 32
	mov	 %l5, %l3	 	!id: move reg 26 (var powerexponent) to reg 32
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 31
	mov	 %g0, %l6	 
	!COMP	32, 33, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 32 (var null) to 33 (var null), store in cc-reg
	!MOVGT	2, 3, 31
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	31, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 31) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
	!MOV	25, 37
	mov	 %l1, %l2	 	!id: move reg 25 (var powerbase) to reg 37
	!MOV	27, 36
	mov	 %l4, %l3	 	!id: move reg 27 (var powerproduct) to reg 36
	!MULT	36, 37, 34
	smul	 %l3, %l2, %l2	 	!expression: reg 36 (var null) * 37 in reg 34 (var null)
	!MOV	27, 35
	mov	 %l4, %l3	 	!lvalue id: move reg 27 (var product) to reg 35
	!MOV	34, 35
	mov	 %l2, %l3	 
	!MOV	35, 27
	mov	 %l3, %l4	 
	!LOADI	1, 42
	mov	 1, %l2	 	!int: reg 42 gets val 1
	!MOV	26, 41
	mov	 %l5, %l3	 	!id: move reg 26 (var powerexponent) to reg 41
	!SUB	41, 42, 39
	sub	 %l3, %l2, %l2	 	!expression: reg 41 (var null) - 42 in reg 39 (var null)
	!MOV	26, 40
	mov	 %l5, %l3	 	!lvalue id: move reg 26 (var exponent) to reg 40
	!MOV	39, 40
	mov	 %l2, %l3	 
	!MOV	40, 26
	mov	 %l3, %l5	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
	!MOV	27, 4
	mov	 %l4, %i0	 	!id: move reg 27 (var powerproduct) to reg 4
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
	mov	 0, %l1	 	!int: reg 19 gets val 0
	!MOV	16, 18
	mov	 %l3, %l2	 	!id: move reg 16 (var waitwaitTime) to reg 18
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 17
	mov	 %g0, %l4	 
	!COMP	18, 19, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 18 (var null) to 19 (var null), store in cc-reg
	!MOVGT	2, 3, 17
	movg	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	17, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 17) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!LOADI	1, 23
	mov	 1, %l1	 	!int: reg 23 gets val 1
	!MOV	16, 22
	mov	 %l3, %l2	 	!id: move reg 16 (var waitwaitTime) to reg 22
	!SUB	22, 23, 20
	sub	 %l2, %l1, %l1	 	!expression: reg 22 (var null) - 23 in reg 20 (var null)
	!MOV	16, 21
	mov	 %l3, %l2	 	!lvalue id: move reg 16 (var waitTime) to reg 21
	!MOV	20, 21
	mov	 %l1, %l2	 
	!MOV	21, 16
	mov	 %l2, %l3	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 