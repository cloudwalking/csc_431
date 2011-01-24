	.file	"test2.ev"
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
	save	%sp, -800, %sp 
 !#function-body:
	set	 20000, %l1	 	!int: reg 18 gets val 20000
	mov	 %l1, %l1	 
	set	 0, %l2	 	!int: reg 20 gets val 0
	mov	 %l2, %l4	 
 !#while-guard:
.S0:
	mov	 %l1, %l2	 
	mov	 %l4, %l3	 
	set	 1, %g1	 
	mov	 %g0, %l5	 
	cmp	 %l3, %l2	 
	movl	 %icc, %g1, %l5	 
	set	 1, %g1	 	!while: set immediate 1 (true)
	cmp	 %l5, %g1	 	!while: compare guard result (reg 22) to true
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
 !#if-guard:
	set	 1, %l2	 	!int: reg 27 gets val 1
	set	 1, %l3	 	!int: reg 26 gets val 1
	set	 1, %g1	 
	mov	 %g0, %l5	 
	cmp	 %l3, %l2	 
	move	 %icc, %g1, %l5	 
	set	 1, %g1	 
	cmp	 %l5, %g1	 	!if: compare guard result (reg 25) to true
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	mov	 %l4, %l2	 
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l2, %o1
	call	printf, 0
	nop
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
.S4:
	set	 1, %l2	 	!int: reg 31 gets val 1
	mov	 %l4, %l3	 
	add	 %l3, %l2, %l2	 
	mov	 %l2, %l4	 
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	set	 0, %i0	 	!int: reg 4 gets val 0
	ret
	restore
 !#function-exit:
 