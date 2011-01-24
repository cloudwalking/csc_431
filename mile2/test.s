	.file	"test.ev"
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
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 20
	mov	 %o0, %l0	 
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 21
	mov	 %o0, %l1	 
	!LOADI	5, 22
	set	 5, %l3	 	!int: reg 22 gets val 5
	!MOV	20, 23
	mov	 %l0, %l2	 
	!STOREAI	22, 23, 0
	st	%l3, [%l2 + 0]
	!LOADI	77, 25
	set	 77, %l3	 	!int: reg 25 gets val 77
	!MOV	21, 26
	mov	 %l1, %l2	 
	!STOREAI	25, 26, 0
	st	%l3, [%l2 + 0]
	!MOV	21, 28
	mov	 %l1, %l2	 
	!MOV	20, 29
	mov	 %l0, %l1	 
	!STOREAI	28, 29, 4
	st	%l2, [%l1 + 4]
	!MOV	20, 31
	mov	 %l0, %l0	 
	!STOREOUTARGUMENT	31, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 31to register outReg 1
	!CALL	printWompa
	call	 printWompa	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	printWompa
	.type	printWompa, #function
	.proc	04
!#function-entry:
printWompa:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 17
	mov	 %i0, %l1	 
 !#function-body:
	!NEW	8, 1
	mov	8, %o0
	call	malloc
	nop
	!MOV	1, 18
	mov	 %o0, %l0	 
	!MOV	17, 19
	mov	 %l1, %l0	 
	!LOADAI	19, 0, 19
	ld	[%l0 + 0], %l0
	!PRINT	19
	sethi	%hi(.EV1LPR), %g1
	or	%g1, %lo(.EV1LPR), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 