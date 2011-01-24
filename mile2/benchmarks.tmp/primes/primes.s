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
	!READ	70
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	70, 68
	mov	 %l1, %l1	 
	!LOADI	0, 72
	set	 0, %l2	 	!int: reg 72 gets val 0
	!MOV	72, 69
	mov	 %l2, %l4	 
 !#while-guard:
.S12:
	!MOV	68, 76
	mov	 %l1, %l2	 
	!MOV	69, 75
	mov	 %l4, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 74
	mov	 %g0, %l5	 
	!COMP	75, 76, 2
	cmp	 %l3, %l2	 
	!MOVLE	2, 3, 74
	movle	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	74, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 74) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
 !#if-guard:
	!MOV	69, 78
	mov	 %l4, %l2	 
	!STOREOUTARGUMENT	78, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 78to register outReg 1
	!CALL	prime
	call	 prime	
	nop
	!MOV	1, 77
	mov	 %o0, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	77, 3, 2
	cmp	 %l2, %g1	 	!if: compare guard result (reg 77) to true
	!CBREQ	2, .S15, .S16
	be	 .S15	 	!if: branch true: '.S15' false: '.S16'
	nop
	ba	.S16 	!if: branch true: '.S15' false: '.S16'
	nop
 .S15:
	!MOV	69, 79
	mov	 %l4, %l2	 
	!PRINTLN	79
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l2, %o1
	call	printf, 0
	nop
	!JUMPI	.S17
	ba	 .S17	 	!then: jump to #end-if '.S17'
	nop
 .S17:
.S16:
	!LOADI	1, 82
	set	 1, %l2	 	!int: reg 82 gets val 1
	!MOV	69, 81
	mov	 %l4, %l3	 
	!ADD	81, 82, 80
	add	 %l3, %l2, %l2	 
	!MOV	80, 69
	mov	 %l2, %l4	 
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
	!STOREINARGUMENT	10, 38
	mov	 %i0, %l2	 
 !#function-body:
 !#if-guard:
	!LOADI	2, 44
	set	 2, %l1	 	!int: reg 44 gets val 2
	!MOV	38, 43
	mov	 %l2, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 42
	mov	 %g0, %l4	 
	!COMP	43, 44, 2
	cmp	 %l3, %l1	 
	!MOVLT	2, 3, 42
	movl	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	42, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 42) to true
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
	!MOV	38, 46
	mov	 %l2, %l1	 
	!STOREOUTARGUMENT	46, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 46to register outReg 1
	!CALL	isqrt
	call	 isqrt	
	nop
	!MOV	1, 45
	mov	 %o0, %l1	 
	!MOV	45, 39
	mov	 %l1, %l1	 
	!LOADI	2, 48
	set	 2, %l3	 	!int: reg 48 gets val 2
	!MOV	48, 40
	mov	 %l3, %l6	 
 !#while-guard:
.S6:
	!MOV	39, 52
	mov	 %l1, %l3	 
	!MOV	40, 51
	mov	 %l6, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 50
	mov	 %g0, %l5	 
	!COMP	51, 52, 2
	cmp	 %l4, %l3	 
	!MOVLE	2, 3, 50
	movle	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	50, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 50) to true
	!CBREQ	2, .S7, .S8
	be	 .S7	 	!while: branch true: '.S7' false: '.S8'
	nop
	ba	.S8 	!while: branch true: '.S7' false: '.S8'
	nop
 .S7:
	!MOV	40, 57
	mov	 %l6, %l3	 
	!MOV	40, 59
	mov	 %l6, %l4	 
	!MOV	38, 58
	mov	 %l2, %l5	 
	!DIV	58, 59, 56
	sdiv	 %l5, %l4, %l4	 
	!MULT	56, 57, 55
	smul	 %l4, %l3, %l3	 
	!MOV	38, 54
	mov	 %l2, %l4	 
	!SUB	54, 55, 53
	sub	 %l4, %l3, %l3	 
	!MOV	53, 41
	mov	 %l3, %l3	 
 !#if-guard:
	!LOADI	0, 63
	set	 0, %l4	 	!int: reg 63 gets val 0
	!MOV	41, 62
	mov	 %l3, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 61
	mov	 %g0, %l5	 
	!COMP	62, 63, 2
	cmp	 %l3, %l4	 
	!MOVEQ	2, 3, 61
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	61, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 61) to true
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
	!LOADI	1, 66
	set	 1, %l3	 	!int: reg 66 gets val 1
	!MOV	40, 65
	mov	 %l6, %l4	 
	!ADD	65, 66, 64
	add	 %l4, %l3, %l3	 
	!MOV	64, 40
	mov	 %l3, %l6	 
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
	!MOV	19, 17
	mov	 %l2, %l5	 
	!LOADI	3, 21
	set	 3, %l2	 	!int: reg 21 gets val 3
	!MOV	21, 18
	mov	 %l2, %l6	 
 !#while-guard:
.S0:
	!MOV	16, 25
	mov	 %l1, %l2	 
	!MOV	17, 24
	mov	 %l5, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 23
	mov	 %g0, %l4	 
	!COMP	24, 25, 2
	cmp	 %l3, %l2	 
	!MOVLE	2, 3, 23
	movle	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	23, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 23) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!MOV	18, 28
	mov	 %l6, %l2	 
	!MOV	17, 27
	mov	 %l5, %l3	 
	!ADD	27, 28, 26
	add	 %l3, %l2, %l2	 
	!MOV	26, 17
	mov	 %l2, %l5	 
	!LOADI	2, 32
	set	 2, %l2	 	!int: reg 32 gets val 2
	!MOV	18, 31
	mov	 %l6, %l3	 
	!ADD	31, 32, 30
	add	 %l3, %l2, %l2	 
	!MOV	30, 18
	mov	 %l2, %l6	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!LOADI	1, 35
	set	 1, %l2	 	!int: reg 35 gets val 1
	!LOADI	2, 37
	set	 2, %l3	 	!int: reg 37 gets val 2
	!MOV	18, 36
	mov	 %l6, %l4	 
	!DIV	36, 37, 34
	sdiv	 %l4, %l3, %l3	 
	!SUB	34, 35, 4
	sub	 %l3, %l2, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 