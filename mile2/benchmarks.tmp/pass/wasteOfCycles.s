	.file	"wasteOfCycles.ev"
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
	!READ	42
	add	%sp, %g0, %l0
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l0

	!MOV	42, 41
	mov	 %l0, %l0	 
	!MOV	41, 44
	mov	 %l0, %l0	 
	!STOREOUTARGUMENT	44, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 44to register outReg 1
	!CALL	function
	call	 function	
	nop
	!LOADI	0, 45
	set	 0, %l0	 	!int: reg 45 gets val 0
	!PRINTLN	45
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
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
	.global	function
	.type	function, #function
	.proc	04
!#function-entry:
function:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 21
	set	 0, %l2	 	!int: reg 21 gets val 0
	!MOV	16, 20
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 19
	mov	 %g0, %l4	 
	!COMP	20, 21, 2
	cmp	 %l3, %l2	 
	!MOVLE	2, 3, 19
	movle	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	19, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 19) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
.S1:
	!LOADI	0, 22
	set	 0, %l2	 	!int: reg 22 gets val 0
	!MOV	22, 17
	mov	 %l2, %l4	 
 !#while-guard:
.S3:
	!MOV	16, 28
	mov	 %l1, %l2	 
	!MOV	16, 27
	mov	 %l1, %l3	 
	!MULT	27, 28, 26
	smul	 %l3, %l2, %l2	 
	!MOV	17, 25
	mov	 %l4, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 24
	mov	 %g0, %l5	 
	!COMP	25, 26, 2
	cmp	 %l3, %l2	 
	!MOVLT	2, 3, 24
	movl	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	24, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 24) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
	!MOV	16, 31
	mov	 %l1, %l2	 
	!MOV	17, 30
	mov	 %l4, %l3	 
	!ADD	30, 31, 29
	add	 %l3, %l2, %l2	 
	!MOV	29, 18
	mov	 %l2, %l2	 
	!MOV	18, 33
	mov	 %l2, %l2	 
	!PRINT	33
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l2, %o1
	call	printf, 0
	nop
	!LOADI	1, 36
	set	 1, %l2	 	!int: reg 36 gets val 1
	!MOV	17, 35
	mov	 %l4, %l3	 
	!ADD	35, 36, 34
	add	 %l3, %l2, %l2	 
	!MOV	34, 17
	mov	 %l2, %l4	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
	!LOADI	1, 40
	set	 1, %l2	 	!int: reg 40 gets val 1
	!MOV	16, 39
	mov	 %l1, %l3	 
	!SUB	39, 40, 38
	sub	 %l3, %l2, %l2	 
	!STOREOUTARGUMENT	38, 5
	mov	 %l2, %o0	 	!argument: store out param from reg 38to register outReg 1
	!CALL	function
	call	 function	
	nop
	!MOV	1, 4
	mov	 %o0, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 