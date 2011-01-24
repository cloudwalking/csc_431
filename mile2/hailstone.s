	.file	"hailstone.ev"
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
	!MOV	47, 48
	mov	 %l0, %l0	 	!lvalue id: move reg 47 (var num) to reg 48
	!READ	48
	add	%sp, %g0, %l0
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l0

	!MOV	48, 47
	mov	 %l0, %l0	 
	!MOV	47, 50
	mov	 %l0, %l0	 
	!STOREOUTARGUMENT	50, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 50to register outReg 1
	!CALL	hailstone
	call	 hailstone	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	hailstone
	.type	hailstone, #function
	.proc	04
!#function-entry:
hailstone:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 24
	mov	 %i0, %l4	 
 !#function-body:
 !#while-guard:
.S0:
	!LOADI	1, 25
	set	 1, %l1	 	!bool: reg 25 gets true
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	25, 3, 2
	cmp	 %l1, %g1	 	!while: compare guard result (reg 25) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!MOV	24, 26
	mov	 %l4, %l1	 
	!PRINT	26
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
 !#if-guard:
	!LOADI	1, 29
	set	 1, %l1	 	!int: reg 29 gets val 1
	!MOV	24, 30
	mov	 %l4, %l2	 
	!STOREOUTARGUMENT	30, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 30to register outReg 1
	!LOADI	2, 30
	set	 2, %l2	 	!int: reg 30 gets val 2
	!STOREOUTARGUMENT	30, 6
	mov	 %l2, %o1	 	!argument: store out param from reg 30to register outReg 2
	!CALL	mod
	call	 mod	
	nop
	!MOV	1, 28
	mov	 %o0, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 27
	mov	 %g0, %l3	 
	!COMP	28, 29, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 27
	move	 %icc, %g1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	27, 3, 2
	cmp	 %l3, %g1	 	!if: compare guard result (reg 27) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!LOADI	1, 34
	set	 1, %l1	 	!int: reg 34 gets val 1
	!MOV	24, 36
	mov	 %l4, %l2	 
	!LOADI	3, 35
	set	 3, %l3	 	!int: reg 35 gets val 3
	!MULT	35, 36, 33
	smul	 %l3, %l2, %l2	 
	!ADD	33, 34, 31
	add	 %l2, %l1, %l1	 
	!MOV	24, 32
	mov	 %l4, %l2	 	!lvalue id: move reg 24 (var n) to reg 32
	!MOV	31, 32
	mov	 %l1, %l2	 
	!MOV	32, 24
	mov	 %l2, %l4	 
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
 !#if-guard:
	!LOADI	1, 45
	set	 1, %l1	 	!int: reg 45 gets val 1
	!MOV	24, 44
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 43
	mov	 %g0, %l0	 
	!COMP	44, 45, 2
	cmp	 %l2, %l1	 
	!MOVLE	2, 3, 43
	movle	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	43, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 43) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	24, 46
	mov	 %l4, %l0	 
	!PRINTLN	46
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!RET	
	ret
	restore
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S4:
	!LOADI	2, 41
	set	 2, %l1	 	!int: reg 41 gets val 2
	!MOV	24, 40
	mov	 %l4, %l2	 
	!DIV	40, 41, 38
	sdiv	 %l2, %l1, %l1	 
	!MOV	24, 39
	mov	 %l4, %l2	 	!lvalue id: move reg 24 (var n) to reg 39
	!MOV	38, 39
	mov	 %l1, %l2	 
	!MOV	39, 24
	mov	 %l2, %l4	 
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 .S2:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	mod
	.type	mod, #function
	.proc	04
!#function-entry:
mod:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l1	 
	!STOREINARGUMENT	11, 17
	mov	 %i1, %l0	 
 !#function-body:
	!MOV	17, 21
	mov	 %l0, %l2	 
	!MOV	17, 23
	mov	 %l0, %l0	 
	!MOV	16, 22
	mov	 %l1, %l3	 
	!DIV	22, 23, 20
	sdiv	 %l3, %l0, %l0	 
	!MULT	20, 21, 19
	smul	 %l0, %l2, %l0	 
	!MOV	16, 18
	mov	 %l1, %l1	 
	!SUB	18, 19, 4
	sub	 %l1, %l0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 