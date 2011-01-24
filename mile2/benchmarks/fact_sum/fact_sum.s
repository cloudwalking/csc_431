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
	!LOADI	0, 47
	set	 0, %l1	 	!int: reg 47 gets val 0
	!MOV	47, 46
	mov	 %l1, %l3	 
 !#while-guard:
.S6:
	!LOADI	1, 52
	set	 1, %l1	 	!int: reg 52 gets val 1
	!LOADI	-1, 53
	mov	 -1, %l2	 
	!MULT	52, 53, 51
	smul	 %l1, %l2, %l1	 
	!MOV	46, 50
	mov	 %l3, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 49
	mov	 %g0, %l4	 
	!COMP	50, 51, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 49
	movne	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	49, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 49) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!READ	54
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	54, 44
	mov	 %l1, %l2	 
	!READ	56
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	56, 45
	mov	 %l1, %l3	 
	!MOV	44, 59
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	59, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 59to register outReg 1
	!CALL	fact
	call	 fact	
	nop
	!MOV	1, 58
	mov	 %o0, %l1	 
	!MOV	58, 44
	mov	 %l1, %l2	 
	!MOV	45, 62
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	62, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 62to register outReg 1
	!CALL	fact
	call	 fact	
	nop
	!MOV	1, 61
	mov	 %o0, %l1	 
	!MOV	61, 45
	mov	 %l1, %l3	 
	!MOV	44, 65
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	65, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 65to register outReg 1
	!MOV	45, 65
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	65, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 65to register outReg 2
	!CALL	sum
	call	 sum	
	nop
	!MOV	1, 64
	mov	 %o0, %l1	 
	!PRINTLN	64
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!READ	66
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	66, 46
	mov	 %l1, %l3	 
	!JUMPI	.S6
	ba	 .S6	 	!while: jump back to guard
	nop
 .S8:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
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
	!STOREINARGUMENT	10, 20
	mov	 %i0, %l2	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 28
	set	 0, %l1	 	!int: reg 28 gets val 0
	!MOV	20, 27
	mov	 %l2, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 24
	mov	 %g0, %l4	 
	!COMP	27, 28, 2
	cmp	 %l3, %l1	 
	!MOVEQ	2, 3, 24
	move	 %icc, %g1, %l4	 
	!LOADI	1, 26
	set	 1, %l1	 	!int: reg 26 gets val 1
	!MOV	20, 25
	mov	 %l2, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 23
	mov	 %g0, %l5	 
	!COMP	25, 26, 2
	cmp	 %l3, %l1	 
	!MOVEQ	2, 3, 23
	move	 %icc, %g1, %l5	 
	!OR	23, 24, 22
	or	 %l5, %l4, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	22, 3, 2
	cmp	 %l1, %g1	 	!if: compare guard result (reg 22) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
.S1:
 !#if-guard:
	!LOADI	1, 31
	set	 1, %l1	 	!int: reg 31 gets val 1
	!MOV	20, 30
	mov	 %l2, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 29
	mov	 %g0, %l4	 
	!COMP	30, 31, 2
	cmp	 %l3, %l1	 
	!MOVLE	2, 3, 29
	movle	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	29, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 29) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!MOV	20, 34
	mov	 %l2, %l1	 
	!LOADI	1, 35
	set	 1, %l3	 	!int: reg 35 gets val 1
	!LOADI	-1, 36
	mov	 -1, %l4	 
	!MULT	35, 36, 33
	smul	 %l3, %l4, %l3	 
	!MULT	33, 34, 32
	smul	 %l3, %l1, %l1	 
	!STOREOUTARGUMENT	32, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 32to register outReg 1
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
	!LOADI	1, 42
	set	 1, %l1	 	!int: reg 42 gets val 1
	!MOV	20, 41
	mov	 %l2, %l3	 
	!SUB	41, 42, 40
	sub	 %l3, %l1, %l1	 
	!STOREOUTARGUMENT	40, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 40to register outReg 1
	!CALL	fact
	call	 fact	
	nop
	!MOV	1, 39
	mov	 %o0, %l0	 
	!MOV	20, 38
	mov	 %l2, %l1	 
	!MULT	38, 39, 37
	smul	 %l1, %l0, %l0	 
	!MOV	37, 21
	mov	 %l0, %l0	 
	!MOV	21, 4
	mov	 %l0, %i0	 
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
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 17
	mov	 %i1, %l0	 
 !#function-body:
	!MOV	17, 19
	mov	 %l0, %l0	 
	!MOV	16, 18
	mov	 %l1, %l1	 
	!ADD	18, 19, 4
	add	 %l1, %l0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 