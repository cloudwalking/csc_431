	.file	"programBreaker.ev"
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
	!LOADI	0, 58
	set	 0, %l1	 	!int: reg 58 gets val 0
	!MOV	57, 59
	mov	 %l3, %l2	 	!lvalue id: move reg 57 (var i) to reg 59
	!MOV	58, 59
	mov	 %l1, %l2	 
	!MOV	59, 57
	mov	 %l2, %l3	 
	!MOV	57, 61
	mov	 %l3, %l1	 	!lvalue id: move reg 57 (var i) to reg 61
	!READ	61
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	61, 57
	mov	 %l1, %l3	 
 !#while-guard:
.S9:
	!LOADI	10000, 65
	set	 10000, %l1	 	!int: reg 65 gets val 10000
	!MOV	57, 64
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 63
	mov	 %g0, %l4	 
	!COMP	64, 65, 2
	cmp	 %l2, %l1	 
	!MOVLT	2, 3, 63
	movl	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	63, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 63) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!LOADI	3, 67
	set	 3, %l1	 	!int: reg 67 gets val 3
	!STOREOUTARGUMENT	67, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 67to register outReg 1
	!MOV	57, 67
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	67, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 67to register outReg 2
	!LOADI	5, 67
	set	 5, %l1	 	!int: reg 67 gets val 5
	!STOREOUTARGUMENT	67, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 67to register outReg 3
	!CALL	fun1
	call	 fun1	
	nop
	!MOV	1, 66
	mov	 %o0, %l1	 
	!PRINTLN	66
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 71
	set	 1, %l1	 	!int: reg 71 gets val 1
	!MOV	57, 70
	mov	 %l3, %l2	 
	!ADD	70, 71, 68
	add	 %l2, %l1, %l1	 
	!MOV	57, 69
	mov	 %l3, %l2	 	!lvalue id: move reg 57 (var i) to reg 69
	!MOV	68, 69
	mov	 %l1, %l2	 
	!MOV	69, 57
	mov	 %l2, %l3	 
	!JUMPI	.S9
	ba	 .S9	 	!while: jump back to guard
	nop
 .S11:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	fun1
	.type	fun1, #function
	.proc	04
!#function-entry:
fun1:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 26
	mov	 %i0, %l3	 
	!STOREINARGUMENT	11, 27
	mov	 %i1, %l4	 
	!STOREINARGUMENT	12, 28
	mov	 %i2, %l1	 
 !#function-body:
	!MOV	28, 33
	mov	 %l1, %l1	 
	!MOV	27, 43
	mov	 %l4, %l5	 
	!LOADI	4, 42
	set	 4, %l6	 	!int: reg 42 gets val 4
	!DIV	42, 43, 35
	sdiv	 %l6, %l5, %l5	 
	!LOADI	2, 41
	set	 2, %l6	 	!int: reg 41 gets val 2
	!MOV	26, 40
	mov	 %l3, %l7	 
	!MULT	40, 41, 37
	smul	 %l7, %l6, %l6	 
	!LOADI	6, 39
	set	 6, %l7	 	!int: reg 39 gets val 6
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!LOADI	5, 38
	set	 5, %l0	 	!int: reg 38 gets val 5
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!ADD	38, 39, 36
	add	 %l0, %l7, %l7	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!SUB	36, 37, 34
	sub	 %l7, %l6, %l6	 
	!ADD	34, 35, 32
	add	 %l6, %l5, %l5	 
	!ADD	32, 33, 30
	add	 %l5, %l1, %l1	 
	!MOV	29, 31
	mov	 %l2, %l2	 	!lvalue id: move reg 29 (var retVal) to reg 31
	!MOV	30, 31
	mov	 %l1, %l2	 
	!MOV	31, 29
	mov	 %l2, %l2	 
 !#if-guard:
	!MOV	27, 47
	mov	 %l4, %l1	 
	!MOV	29, 46
	mov	 %l2, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 45
	mov	 %g0, %l6	 
	!COMP	46, 47, 2
	cmp	 %l5, %l1	 
	!MOVGT	2, 3, 45
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	45, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 45) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	29, 48
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	48, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 48to register outReg 1
	!MOV	26, 48
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	48, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 48to register outReg 2
	!CALL	fun2
	call	 fun2	
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
	!MOV	29, 4
	mov	 %l2, %i0	 
	!RET	
	ret
	restore
 .S4:
 !#if-guard:
	!MOV	27, 55
	mov	 %l4, %l1	 
	!MOV	29, 54
	mov	 %l2, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 51
	mov	 %g0, %l5	 
	!COMP	54, 55, 2
	cmp	 %l3, %l1	 
	!MOVLE	2, 3, 51
	movle	 %icc, %g1, %l5	 
	!LOADI	6, 53
	set	 6, %l1	 	!int: reg 53 gets val 6
	!LOADI	5, 52
	set	 5, %l3	 	!int: reg 52 gets val 5
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 50
	mov	 %g0, %l6	 
	!COMP	52, 53, 2
	cmp	 %l3, %l1	 
	!MOVLT	2, 3, 50
	movl	 %icc, %g1, %l6	 
	!AND	50, 51, 49
	and	 %l6, %l5, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	49, 3, 2
	cmp	 %l1, %g1	 	!if: compare guard result (reg 49) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	29, 56
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	56, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 56to register outReg 1
	!MOV	27, 56
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	56, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 56to register outReg 2
	!CALL	fun2
	call	 fun2	
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
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	fun2
	.type	fun2, #function
	.proc	04
!#function-entry:
fun2:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 18
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 19
	mov	 %i1, %l3	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 22
	set	 0, %l1	 	!int: reg 22 gets val 0
	!MOV	18, 21
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 20
	mov	 %g0, %l5	 
	!COMP	21, 22, 2
	cmp	 %l4, %l1	 
	!MOVEQ	2, 3, 20
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	20, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 20) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	19, 4
	mov	 %l3, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
	!LOADI	1, 25
	set	 1, %l1	 	!int: reg 25 gets val 1
	!MOV	18, 24
	mov	 %l2, %l2	 
	!SUB	24, 25, 23
	sub	 %l2, %l1, %l1	 
	!STOREOUTARGUMENT	23, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 23to register outReg 1
	!MOV	19, 23
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	23, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 23to register outReg 2
	!CALL	fun2
	call	 fun2	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!if: jump to #end-if '.S2'
	nop
 !#function-exit:
 