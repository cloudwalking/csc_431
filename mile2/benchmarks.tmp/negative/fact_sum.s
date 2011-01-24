	.file	"fact_sum.ev"
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
	!LOADI	0, 52
	mov	 0, %l1	 	!int: reg 52 gets val 0
	!MOV	51, 53
	mov	 %l3, %l2	 	!lvalue id: move reg 51 (var flag) to reg 53
	!MOV	52, 53
	mov	 %l1, %l2	 
	!MOV	53, 51
	mov	 %l2, %l3	 
 !#while-guard:
.S6:
	!LOADI	1, 58
	mov	 1, %l1	 	!int: reg 58 gets val 1
	!LOADI	-1, 59
	mov	 -1, %l2	 
	!MULT	58, 59, 57
	smul	 %l1, %l2, %l1	 
	!MOV	51, 56
	mov	 %l3, %l2	 	!id: move reg 51 (var mainflag) to reg 56
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 55
	mov	 %g0, %l6	 
	!COMP	56, 57, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 56 (var null) to 57 (var null), store in cc-reg
	!MOVNE	2, 3, 55
	movne	 %icc, %g1, %l6	 
	!LOADI	1, 3
	mov	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	55, 3, 2
	cmp	 %l6, %g1	 	!while: compare guard result (reg 55) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!MOV	49, 60
	mov	 %l5, %l1	 	!lvalue id: move reg 49 (var num1) to reg 60
	!READ	60
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	60, 49
	mov	 %l1, %l5	 
	!MOV	50, 62
	mov	 %l4, %l1	 	!lvalue id: move reg 50 (var num2) to reg 62
	!READ	62
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	62, 50
	mov	 %l1, %l4	 
	!MOV	49, 66
	mov	 %l5, %l1	 	!id: move reg 49 (var mainnum1) to reg 66
	!STOREOUTARGUMENT	66, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 66to register outReg 1
	!CALL	fact
	call	 fact	
	nop
	!MOV	1, 64
	mov	 %o0, %l1	 
	!MOV	49, 65
	mov	 %l5, %l2	 	!lvalue id: move reg 49 (var num1) to reg 65
	!MOV	64, 65
	mov	 %l1, %l2	 
	!MOV	65, 49
	mov	 %l2, %l5	 
	!MOV	50, 70
	mov	 %l4, %l1	 	!id: move reg 50 (var mainnum2) to reg 70
	!STOREOUTARGUMENT	70, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 70to register outReg 1
	!CALL	fact
	call	 fact	
	nop
	!MOV	1, 68
	mov	 %o0, %l1	 
	!MOV	50, 69
	mov	 %l4, %l2	 	!lvalue id: move reg 50 (var num2) to reg 69
	!MOV	68, 69
	mov	 %l1, %l2	 
	!MOV	69, 50
	mov	 %l2, %l4	 
	!MOV	49, 73
	mov	 %l5, %l1	 	!id: move reg 49 (var mainnum1) to reg 73
	!STOREOUTARGUMENT	73, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 73to register outReg 1
	!MOV	50, 73
	mov	 %l4, %l1	 	!id: move reg 50 (var mainnum2) to reg 73
	!STOREOUTARGUMENT	73, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 73to register outReg 2
	!CALL	sum
	call	 sum	
	nop
	!MOV	1, 72
	mov	 %o0, %l1	 
	!PRINTLN	72
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	51, 74
	mov	 %l3, %l1	 	!lvalue id: move reg 51 (var flag) to reg 74
	!READ	74
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	74, 51
	mov	 %l1, %l3	 
	!JUMPI	.S6
	ba	 .S6	 	!while: jump back to guard
	nop
 .S8:
	!LOADI	0, 4
	mov	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	fact
	.type	fact, #function
	.proc	04
!#function-entry:
fact:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 24
	mov	 %i0, %l2	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 32
	mov	 0, %l1	 	!int: reg 32 gets val 0
	!MOV	24, 31
	mov	 %l2, %l3	 	!id: move reg 24 (var factn) to reg 31
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 28
	mov	 %g0, %l4	 
	!COMP	31, 32, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 31 (var null) to 32 (var null), store in cc-reg
	!MOVEQ	2, 3, 28
	move	 %icc, %g1, %l4	 
	!LOADI	1, 30
	mov	 1, %l1	 	!int: reg 30 gets val 1
	!MOV	24, 29
	mov	 %l2, %l3	 	!id: move reg 24 (var factn) to reg 29
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 27
	mov	 %g0, %l5	 
	!COMP	29, 30, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 29 (var null) to 30 (var null), store in cc-reg
	!MOVEQ	2, 3, 27
	move	 %icc, %g1, %l5	 
	!OR	27, 28, 26
	or	 %l5, %l4, %l1	 	!expression: reg 27 (var null) || 28 in reg 26 (var null)
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	26, 3, 2
	cmp	 %l1, %g1	 	!if: compare guard result (reg 26) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!LOADI	1, 4
	mov	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
.S1:
 !#if-guard:
	!LOADI	1, 35
	mov	 1, %l1	 	!int: reg 35 gets val 1
	!MOV	24, 34
	mov	 %l2, %l3	 	!id: move reg 24 (var factn) to reg 34
	!LOADI	1, 3
	mov	 1, %g1	 
	!MOV	0, 33
	mov	 %g0, %l4	 
	!COMP	34, 35, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 34 (var null) to 35 (var null), store in cc-reg
	!MOVLE	2, 3, 33
	movle	 %icc, %g1, %l4	 
	!LOADI	1, 3
	mov	 1, %g1	 
	!COMP	33, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 33) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	24, 38
	mov	 %l2, %l1	 	!id: move reg 24 (var factn) to reg 38
	!LOADI	1, 39
	mov	 1, %l3	 	!int: reg 39 gets val 1
	!LOADI	-1, 40
	mov	 -1, %l4	 
	!MULT	39, 40, 37
	smul	 %l3, %l4, %l3	 
	!MULT	37, 38, 36
	smul	 %l3, %l1, %l1	 	!expression: reg 37 (var null) * 38 in reg 36 (var null)
	!STOREOUTARGUMENT	36, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 36to register outReg 1
	!CALL	fact
	call	 fact	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
.S4:
	!LOADI	1, 47
	mov	 1, %l1	 	!int: reg 47 gets val 1
	!MOV	24, 46
	mov	 %l2, %l3	 	!id: move reg 24 (var factn) to reg 46
	!SUB	46, 47, 45
	sub	 %l3, %l1, %l1	 	!expression: reg 46 (var null) - 47 in reg 45 (var null)
	!STOREOUTARGUMENT	45, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 45to register outReg 1
	!CALL	fact
	call	 fact	
	nop
	!MOV	1, 44
	mov	 %o0, %l1	 
	!MOV	24, 43
	mov	 %l2, %l2	 	!id: move reg 24 (var factn) to reg 43
	!MULT	43, 44, 41
	smul	 %l2, %l1, %l1	 	!expression: reg 43 (var null) * 44 in reg 41 (var null)
	!MOV	25, 42
	mov	 %l0, %l0	 	!lvalue id: move reg 25 (var t) to reg 42
	!MOV	41, 42
	mov	 %l1, %l0	 
	!MOV	42, 25
	mov	 %l0, %l0	 
	!MOV	25, 4
	mov	 %l0, %i0	 	!id: move reg 25 (var factt) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	sum
	.type	sum, #function
	.proc	04
!#function-entry:
sum:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 20
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 21
	mov	 %i1, %l0	 
 !#function-body:
	!MOV	21, 23
	mov	 %l0, %l0	 	!id: move reg 21 (var sumb) to reg 23
	!MOV	20, 22
	mov	 %l1, %l1	 	!id: move reg 20 (var suma) to reg 22
	!ADD	22, 23, 4
	add	 %l1, %l0, %i0	 	!expression: reg 22 (var null) + 23 in reg 4 (var null)
	!RET	
	ret
	restore
 !#function-exit:
 