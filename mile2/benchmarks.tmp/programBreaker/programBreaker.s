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
	!LOADI	0, 57
	set	 0, %l1	 	!int: reg 57 gets val 0
	!MOV	57, 56
	mov	 %l1, %l3	 
	!READ	59
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	59, 56
	mov	 %l1, %l3	 
 !#while-guard:
.S9:
	!LOADI	10000, 63
	set	 10000, %l1	 	!int: reg 63 gets val 10000
	!MOV	56, 62
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 61
	mov	 %g0, %l4	 
	!COMP	62, 63, 2
	cmp	 %l2, %l1	 
	!MOVLT	2, 3, 61
	movl	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	61, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 61) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!LOADI	3, 65
	set	 3, %l1	 	!int: reg 65 gets val 3
	!STOREOUTARGUMENT	65, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 65to register outReg 1
	!MOV	56, 65
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	65, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 65to register outReg 2
	!LOADI	5, 65
	set	 5, %l1	 	!int: reg 65 gets val 5
	!STOREOUTARGUMENT	65, 7
	mov	 %l1, %o2	 	!argument: store out param from reg 65to register outReg 3
	!CALL	fun1
	call	 fun1	
	nop
	!MOV	1, 64
	mov	 %o0, %l1	 
	!PRINTLN	64
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 68
	set	 1, %l1	 	!int: reg 68 gets val 1
	!MOV	56, 67
	mov	 %l3, %l2	 
	!ADD	67, 68, 66
	add	 %l2, %l1, %l1	 
	!MOV	66, 56
	mov	 %l1, %l3	 
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
	mov	 %i0, %l4	 
	!STOREINARGUMENT	11, 27
	mov	 %i1, %l3	 
	!STOREINARGUMENT	12, 28
	mov	 %i2, %l1	 
 !#function-body:
	!MOV	28, 32
	mov	 %l1, %l1	 
	!MOV	27, 42
	mov	 %l3, %l2	 
	!LOADI	4, 41
	set	 4, %l5	 	!int: reg 41 gets val 4
	!DIV	41, 42, 34
	sdiv	 %l5, %l2, %l2	 
	!LOADI	2, 40
	set	 2, %l5	 	!int: reg 40 gets val 2
	!MOV	26, 39
	mov	 %l4, %l6	 
	!MULT	39, 40, 36
	smul	 %l6, %l5, %l5	 
	!LOADI	6, 38
	set	 6, %l6	 	!int: reg 38 gets val 6
	!LOADI	5, 37
	set	 5, %l7	 	!int: reg 37 gets val 5
	!ADD	37, 38, 35
	add	 %l7, %l6, %l6	 
	!SUB	35, 36, 33
	sub	 %l6, %l5, %l5	 
	!ADD	33, 34, 31
	add	 %l5, %l2, %l2	 
	!ADD	31, 32, 30
	add	 %l2, %l1, %l1	 
	!MOV	30, 29
	mov	 %l1, %l2	 
 !#if-guard:
	!MOV	27, 46
	mov	 %l3, %l1	 
	!MOV	29, 45
	mov	 %l2, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 44
	mov	 %g0, %l6	 
	!COMP	45, 46, 2
	cmp	 %l5, %l1	 
	!MOVGT	2, 3, 44
	movg	 %icc, %g1, %l6	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	44, 3, 2
	cmp	 %l6, %g1	 	!if: compare guard result (reg 44) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	29, 47
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	47, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 47to register outReg 1
	!MOV	26, 47
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	47, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 47to register outReg 2
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
	!MOV	27, 54
	mov	 %l3, %l1	 
	!MOV	29, 53
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 50
	mov	 %g0, %l5	 
	!COMP	53, 54, 2
	cmp	 %l4, %l1	 
	!MOVLE	2, 3, 50
	movle	 %icc, %g1, %l5	 
	!LOADI	6, 52
	set	 6, %l1	 	!int: reg 52 gets val 6
	!LOADI	5, 51
	set	 5, %l4	 	!int: reg 51 gets val 5
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 49
	mov	 %g0, %l6	 
	!COMP	51, 52, 2
	cmp	 %l4, %l1	 
	!MOVLT	2, 3, 49
	movl	 %icc, %g1, %l6	 
	!AND	49, 50, 48
	and	 %l6, %l5, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	48, 3, 2
	cmp	 %l1, %g1	 	!if: compare guard result (reg 48) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	29, 55
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	55, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 55to register outReg 1
	!MOV	27, 55
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	55, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 55to register outReg 2
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
 