	.file	"uncreativeBenchmark.ev"
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
	!NEW	36, 1
	mov	36, %o0
	call	malloc
	nop
	!MOV	1, 89
	mov	 %o0, %l3	 
	!STOREAI	0, 89, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 89, 4
	st	%g0, [%l3 + 4]
	!STOREAI	0, 89, 8
	st	%g0, [%l3 + 8]
	!STOREAI	0, 89, 12
	st	%g0, [%l3 + 12]
	!STOREAI	0, 89, 16
	st	%g0, [%l3 + 16]
	!STOREAI	0, 89, 20
	st	%g0, [%l3 + 20]
	!STOREAI	0, 89, 24
	st	%g0, [%l3 + 24]
	!STOREAI	0, 89, 28
	st	%g0, [%l3 + 28]
	!STOREAI	0, 89, 32
	st	%g0, [%l3 + 32]
	!NEW	36, 1
	mov	36, %o0
	call	malloc
	nop
	!MOV	1, 90
	mov	 %o0, %l1	 
	!STOREAI	0, 90, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 90, 4
	st	%g0, [%l1 + 4]
	!STOREAI	0, 90, 8
	st	%g0, [%l1 + 8]
	!STOREAI	0, 90, 12
	st	%g0, [%l1 + 12]
	!STOREAI	0, 90, 16
	st	%g0, [%l1 + 16]
	!STOREAI	0, 90, 20
	st	%g0, [%l1 + 20]
	!STOREAI	0, 90, 24
	st	%g0, [%l1 + 24]
	!STOREAI	0, 90, 28
	st	%g0, [%l1 + 28]
	!STOREAI	0, 90, 32
	st	%g0, [%l1 + 32]
	!MOV	90, 89
	mov	 %l1, %l3	 
	!LOADI	0, 92
	set	 0, %l1	 	!int: reg 92 gets val 0
	!MOV	92, 87
	mov	 %l1, %l1	 
	!LOADI	0, 94
	set	 0, %l1	 	!int: reg 94 gets val 0
	!MOV	89, 95
	mov	 %l3, %l2	 
	!STOREAI	94, 95, 0
	st	%l1, [%l2 + 0]
	!LOADI	0, 97
	set	 0, %l1	 	!int: reg 97 gets val 0
	!MOV	89, 98
	mov	 %l3, %l2	 
	!STOREAI	97, 98, 4
	st	%l1, [%l2 + 4]
	!LOADI	0, 100
	set	 0, %l1	 	!int: reg 100 gets val 0
	!MOV	89, 101
	mov	 %l3, %l2	 
	!STOREAI	100, 101, 8
	st	%l1, [%l2 + 8]
	!LOADI	0, 103
	set	 0, %l1	 	!int: reg 103 gets val 0
	!MOV	89, 104
	mov	 %l3, %l2	 
	!STOREAI	103, 104, 12
	st	%l1, [%l2 + 12]
	!LOADI	0, 106
	set	 0, %l1	 	!int: reg 106 gets val 0
	!MOV	89, 107
	mov	 %l3, %l2	 
	!STOREAI	106, 107, 16
	st	%l1, [%l2 + 16]
	!LOADI	0, 109
	set	 0, %l1	 	!int: reg 109 gets val 0
	!MOV	89, 110
	mov	 %l3, %l2	 
	!STOREAI	109, 110, 20
	st	%l1, [%l2 + 20]
	!LOADI	0, 112
	set	 0, %l1	 	!int: reg 112 gets val 0
	!MOV	89, 113
	mov	 %l3, %l2	 
	!STOREAI	112, 113, 24
	st	%l1, [%l2 + 24]
	!LOADI	0, 115
	set	 0, %l1	 	!int: reg 115 gets val 0
	!MOV	89, 116
	mov	 %l3, %l2	 
	!STOREAI	115, 116, 28
	st	%l1, [%l2 + 28]
	!LOADI	0, 118
	set	 0, %l1	 	!int: reg 118 gets val 0
	!MOV	89, 119
	mov	 %l3, %l2	 
	!STOREAI	118, 119, 32
	st	%l1, [%l2 + 32]
	!READ	121
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	121, 86
	mov	 %l1, %l4	 
 !#while-guard:
.S30:
	!LOADI	0, 125
	set	 0, %l1	 	!int: reg 125 gets val 0
	!MOV	86, 124
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 123
	mov	 %g0, %l5	 
	!COMP	124, 125, 2
	cmp	 %l2, %l1	 
	!MOVNE	2, 3, 123
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	123, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 123) to true
	!CBREQ	2, .S31, .S32
	be	 .S31	 	!while: branch true: '.S31' false: '.S32'
	nop
	ba	.S32 	!while: branch true: '.S31' false: '.S32'
	nop
 .S31:
 !#if-guard:
	!LOADI	1, 128
	set	 1, %l1	 	!int: reg 128 gets val 1
	!MOV	86, 127
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 126
	mov	 %g0, %l5	 
	!COMP	127, 128, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 126
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	126, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 126) to true
	!CBREQ	2, .S33, .S34
	be	 .S33	 	!if: branch true: '.S33' false: '.S34'
	nop
	ba	.S34 	!if: branch true: '.S33' false: '.S34'
	nop
 .S33:
	!LOADI	1, 131
	set	 1, %l1	 	!int: reg 131 gets val 1
	!MOV	89, 130
	mov	 %l3, %l2	 
	!LOADAI	130, 0, 130
	ld	[%l2 + 0], %l2
	!ADD	130, 131, 129
	add	 %l2, %l1, %l1	 
	!MOV	89, 132
	mov	 %l3, %l2	 
	!STOREAI	129, 132, 0
	st	%l1, [%l2 + 0]
	!JUMPI	.S35
	ba	 .S35	 	!then: jump to #end-if '.S35'
	nop
 .S35:
	!READ	195
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	195, 86
	mov	 %l1, %l4	 
	!JUMPI	.S30
	ba	 .S30	 	!while: jump back to guard
	nop
 .S32:
	!MOV	89, 198
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	198, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 198to register outReg 1
	!CALL	countTotal
	call	 countTotal	
	nop
	!MOV	1, 197
	mov	 %o0, %l1	 
	!PRINTLN	197
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 200
	set	 1, %l1	 	!int: reg 200 gets val 1
	!STOREOUTARGUMENT	200, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 200to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 199
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	199, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 199to register outReg 1
	!MOV	89, 199
	mov	 %l3, %l1	 
	!LOADAI	199, 0, 199
	ld	[%l1 + 0], %l1
	!STOREOUTARGUMENT	199, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 199to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	2, 202
	set	 2, %l1	 	!int: reg 202 gets val 2
	!STOREOUTARGUMENT	202, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 202to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 201
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	201, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 201to register outReg 1
	!MOV	89, 201
	mov	 %l3, %l1	 
	!LOADAI	201, 4, 201
	ld	[%l1 + 4], %l1
	!STOREOUTARGUMENT	201, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 201to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	3, 204
	set	 3, %l1	 	!int: reg 204 gets val 3
	!STOREOUTARGUMENT	204, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 204to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 203
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	203, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 203to register outReg 1
	!MOV	89, 203
	mov	 %l3, %l1	 
	!LOADAI	203, 8, 203
	ld	[%l1 + 8], %l1
	!STOREOUTARGUMENT	203, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 203to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	4, 206
	set	 4, %l1	 	!int: reg 206 gets val 4
	!STOREOUTARGUMENT	206, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 206to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 205
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	205, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 205to register outReg 1
	!MOV	89, 205
	mov	 %l3, %l1	 
	!LOADAI	205, 12, 205
	ld	[%l1 + 12], %l1
	!STOREOUTARGUMENT	205, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 205to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	5, 208
	set	 5, %l1	 	!int: reg 208 gets val 5
	!STOREOUTARGUMENT	208, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 208to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 207
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	207, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 207to register outReg 1
	!MOV	89, 207
	mov	 %l3, %l1	 
	!LOADAI	207, 16, 207
	ld	[%l1 + 16], %l1
	!STOREOUTARGUMENT	207, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 207to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	6, 210
	set	 6, %l1	 	!int: reg 210 gets val 6
	!STOREOUTARGUMENT	210, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 210to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 209
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	209, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 209to register outReg 1
	!MOV	89, 209
	mov	 %l3, %l1	 
	!LOADAI	209, 20, 209
	ld	[%l1 + 20], %l1
	!STOREOUTARGUMENT	209, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 209to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	7, 212
	set	 7, %l1	 	!int: reg 212 gets val 7
	!STOREOUTARGUMENT	212, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 212to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 211
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	211, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 211to register outReg 1
	!MOV	89, 211
	mov	 %l3, %l1	 
	!LOADAI	211, 24, 211
	ld	[%l1 + 24], %l1
	!STOREOUTARGUMENT	211, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 211to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	8, 214
	set	 8, %l1	 	!int: reg 214 gets val 8
	!STOREOUTARGUMENT	214, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 214to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 213
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	213, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 213to register outReg 1
	!MOV	89, 213
	mov	 %l3, %l1	 
	!LOADAI	213, 28, 213
	ld	[%l1 + 28], %l1
	!STOREOUTARGUMENT	213, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 213to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	9, 216
	set	 9, %l1	 	!int: reg 216 gets val 9
	!STOREOUTARGUMENT	216, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 216to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 215
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	215, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 215to register outReg 1
	!MOV	89, 215
	mov	 %l3, %l1	 
	!LOADAI	215, 32, 215
	ld	[%l1 + 32], %l1
	!STOREOUTARGUMENT	215, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 215to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 .S34:
 !#if-guard:
	!LOADI	2, 136
	set	 2, %l1	 	!int: reg 136 gets val 2
	!MOV	86, 135
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 134
	mov	 %g0, %l5	 
	!COMP	135, 136, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 134
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	134, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 134) to true
	!CBREQ	2, .S36, .S37
	be	 .S36	 	!if: branch true: '.S36' false: '.S37'
	nop
	ba	.S37 	!if: branch true: '.S36' false: '.S37'
	nop
 .S36:
	!LOADI	1, 139
	set	 1, %l1	 	!int: reg 139 gets val 1
	!MOV	89, 138
	mov	 %l3, %l2	 
	!LOADAI	138, 4, 138
	ld	[%l2 + 4], %l2
	!ADD	138, 139, 137
	add	 %l2, %l1, %l1	 
	!MOV	89, 140
	mov	 %l3, %l2	 
	!STOREAI	137, 140, 4
	st	%l1, [%l2 + 4]
	!JUMPI	.S38
	ba	 .S38	 	!then: jump to #end-if '.S38'
	nop
 .S38:
	!JUMPI	.S35
	ba	 .S35	 	!if: jump to #end-if '.S35'
	nop
 .S37:
 !#if-guard:
	!LOADI	3, 144
	set	 3, %l1	 	!int: reg 144 gets val 3
	!MOV	86, 143
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 142
	mov	 %g0, %l5	 
	!COMP	143, 144, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 142
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	142, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 142) to true
	!CBREQ	2, .S39, .S40
	be	 .S39	 	!if: branch true: '.S39' false: '.S40'
	nop
	ba	.S40 	!if: branch true: '.S39' false: '.S40'
	nop
 .S39:
	!LOADI	1, 147
	set	 1, %l1	 	!int: reg 147 gets val 1
	!MOV	89, 146
	mov	 %l3, %l2	 
	!LOADAI	146, 8, 146
	ld	[%l2 + 8], %l2
	!ADD	146, 147, 145
	add	 %l2, %l1, %l1	 
	!MOV	89, 148
	mov	 %l3, %l2	 
	!STOREAI	145, 148, 8
	st	%l1, [%l2 + 8]
	!JUMPI	.S41
	ba	 .S41	 	!then: jump to #end-if '.S41'
	nop
 .S41:
	!JUMPI	.S38
	ba	 .S38	 	!if: jump to #end-if '.S38'
	nop
 .S40:
 !#if-guard:
	!LOADI	4, 152
	set	 4, %l1	 	!int: reg 152 gets val 4
	!MOV	86, 151
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 150
	mov	 %g0, %l5	 
	!COMP	151, 152, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 150
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	150, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 150) to true
	!CBREQ	2, .S42, .S43
	be	 .S42	 	!if: branch true: '.S42' false: '.S43'
	nop
	ba	.S43 	!if: branch true: '.S42' false: '.S43'
	nop
 .S42:
	!LOADI	1, 155
	set	 1, %l1	 	!int: reg 155 gets val 1
	!MOV	89, 154
	mov	 %l3, %l2	 
	!LOADAI	154, 12, 154
	ld	[%l2 + 12], %l2
	!ADD	154, 155, 153
	add	 %l2, %l1, %l1	 
	!MOV	89, 156
	mov	 %l3, %l2	 
	!STOREAI	153, 156, 12
	st	%l1, [%l2 + 12]
	!JUMPI	.S44
	ba	 .S44	 	!then: jump to #end-if '.S44'
	nop
 .S44:
	!JUMPI	.S41
	ba	 .S41	 	!if: jump to #end-if '.S41'
	nop
 .S43:
 !#if-guard:
	!LOADI	5, 160
	set	 5, %l1	 	!int: reg 160 gets val 5
	!MOV	86, 159
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 158
	mov	 %g0, %l5	 
	!COMP	159, 160, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 158
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	158, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 158) to true
	!CBREQ	2, .S45, .S46
	be	 .S45	 	!if: branch true: '.S45' false: '.S46'
	nop
	ba	.S46 	!if: branch true: '.S45' false: '.S46'
	nop
 .S45:
	!LOADI	1, 163
	set	 1, %l1	 	!int: reg 163 gets val 1
	!MOV	89, 162
	mov	 %l3, %l2	 
	!LOADAI	162, 16, 162
	ld	[%l2 + 16], %l2
	!ADD	162, 163, 161
	add	 %l2, %l1, %l1	 
	!MOV	89, 164
	mov	 %l3, %l2	 
	!STOREAI	161, 164, 16
	st	%l1, [%l2 + 16]
	!JUMPI	.S47
	ba	 .S47	 	!then: jump to #end-if '.S47'
	nop
 .S47:
	!JUMPI	.S44
	ba	 .S44	 	!if: jump to #end-if '.S44'
	nop
 .S46:
 !#if-guard:
	!LOADI	6, 168
	set	 6, %l1	 	!int: reg 168 gets val 6
	!MOV	86, 167
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 166
	mov	 %g0, %l5	 
	!COMP	167, 168, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 166
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	166, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 166) to true
	!CBREQ	2, .S48, .S49
	be	 .S48	 	!if: branch true: '.S48' false: '.S49'
	nop
	ba	.S49 	!if: branch true: '.S48' false: '.S49'
	nop
 .S48:
	!LOADI	1, 171
	set	 1, %l1	 	!int: reg 171 gets val 1
	!MOV	89, 170
	mov	 %l3, %l2	 
	!LOADAI	170, 20, 170
	ld	[%l2 + 20], %l2
	!ADD	170, 171, 169
	add	 %l2, %l1, %l1	 
	!MOV	89, 172
	mov	 %l3, %l2	 
	!STOREAI	169, 172, 20
	st	%l1, [%l2 + 20]
	!JUMPI	.S50
	ba	 .S50	 	!then: jump to #end-if '.S50'
	nop
 .S50:
	!JUMPI	.S47
	ba	 .S47	 	!if: jump to #end-if '.S47'
	nop
 .S49:
 !#if-guard:
	!LOADI	7, 176
	set	 7, %l1	 	!int: reg 176 gets val 7
	!MOV	86, 175
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 174
	mov	 %g0, %l5	 
	!COMP	175, 176, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 174
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	174, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 174) to true
	!CBREQ	2, .S51, .S52
	be	 .S51	 	!if: branch true: '.S51' false: '.S52'
	nop
	ba	.S52 	!if: branch true: '.S51' false: '.S52'
	nop
 .S51:
	!LOADI	1, 179
	set	 1, %l1	 	!int: reg 179 gets val 1
	!MOV	89, 178
	mov	 %l3, %l2	 
	!LOADAI	178, 24, 178
	ld	[%l2 + 24], %l2
	!ADD	178, 179, 177
	add	 %l2, %l1, %l1	 
	!MOV	89, 180
	mov	 %l3, %l2	 
	!STOREAI	177, 180, 24
	st	%l1, [%l2 + 24]
	!JUMPI	.S53
	ba	 .S53	 	!then: jump to #end-if '.S53'
	nop
 .S53:
	!JUMPI	.S50
	ba	 .S50	 	!if: jump to #end-if '.S50'
	nop
 .S52:
 !#if-guard:
	!LOADI	8, 184
	set	 8, %l1	 	!int: reg 184 gets val 8
	!MOV	86, 183
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 182
	mov	 %g0, %l4	 
	!COMP	183, 184, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 182
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	182, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 182) to true
	!CBREQ	2, .S54, .S55
	be	 .S54	 	!if: branch true: '.S54' false: '.S55'
	nop
	ba	.S55 	!if: branch true: '.S54' false: '.S55'
	nop
 .S54:
	!LOADI	1, 187
	set	 1, %l1	 	!int: reg 187 gets val 1
	!MOV	89, 186
	mov	 %l3, %l2	 
	!LOADAI	186, 28, 186
	ld	[%l2 + 28], %l2
	!ADD	186, 187, 185
	add	 %l2, %l1, %l1	 
	!MOV	89, 188
	mov	 %l3, %l2	 
	!STOREAI	185, 188, 28
	st	%l1, [%l2 + 28]
	!JUMPI	.S56
	ba	 .S56	 	!then: jump to #end-if '.S56'
	nop
 .S56:
	!JUMPI	.S53
	ba	 .S53	 	!if: jump to #end-if '.S53'
	nop
 .S55:
	!LOADI	1, 192
	set	 1, %l1	 	!int: reg 192 gets val 1
	!MOV	89, 191
	mov	 %l3, %l2	 
	!LOADAI	191, 32, 191
	ld	[%l2 + 32], %l2
	!ADD	191, 192, 190
	add	 %l2, %l1, %l1	 
	!MOV	89, 193
	mov	 %l3, %l2	 
	!STOREAI	190, 193, 32
	st	%l1, [%l2 + 32]
	!JUMPI	.S56
	ba	 .S56	 	!if: jump to #end-if '.S56'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	convertBinary
	.type	convertBinary, #function
	.proc	04
!#function-entry:
convertBinary:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 58
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 61
	set	 0, %l2	 	!int: reg 61 gets val 0
	!MOV	58, 60
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 59
	mov	 %g0, %l4	 
	!COMP	60, 61, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 59
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	59, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 59) to true
	!CBREQ	2, .S3, .S4
	be	 .S3	 	!if: branch true: '.S3' false: '.S4'
	nop
	ba	.S4 	!if: branch true: '.S3' false: '.S4'
	nop
 .S3:
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
	!JUMPI	.S5
	ba	 .S5	 	!then: jump to #end-if '.S5'
	nop
 .S5:
 .S4:
 !#if-guard:
	!LOADI	1, 64
	set	 1, %l2	 	!int: reg 64 gets val 1
	!MOV	58, 63
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 62
	mov	 %g0, %l4	 
	!COMP	63, 64, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 62
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	62, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 62) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!LOADI	1, 4
	set	 1, %i0	 	!int: reg 4 gets val 1
	!RET	
	ret
	restore
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
	!JUMPI	.S5
	ba	 .S5	 	!if: jump to #end-if '.S5'
	nop
 .S7:
 !#if-guard:
	!LOADI	2, 67
	set	 2, %l2	 	!int: reg 67 gets val 2
	!MOV	58, 66
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 65
	mov	 %g0, %l4	 
	!COMP	66, 67, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 65
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	65, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 65) to true
	!CBREQ	2, .S9, .S10
	be	 .S9	 	!if: branch true: '.S9' false: '.S10'
	nop
	ba	.S10 	!if: branch true: '.S9' false: '.S10'
	nop
 .S9:
	!LOADI	10, 4
	set	 10, %i0	 	!int: reg 4 gets val 10
	!RET	
	ret
	restore
	!JUMPI	.S11
	ba	 .S11	 	!then: jump to #end-if '.S11'
	nop
 .S11:
	!JUMPI	.S8
	ba	 .S8	 	!if: jump to #end-if '.S8'
	nop
 .S10:
 !#if-guard:
	!LOADI	3, 70
	set	 3, %l2	 	!int: reg 70 gets val 3
	!MOV	58, 69
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 68
	mov	 %g0, %l4	 
	!COMP	69, 70, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 68
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	68, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 68) to true
	!CBREQ	2, .S12, .S13
	be	 .S12	 	!if: branch true: '.S12' false: '.S13'
	nop
	ba	.S13 	!if: branch true: '.S12' false: '.S13'
	nop
 .S12:
	!LOADI	11, 4
	set	 11, %i0	 	!int: reg 4 gets val 11
	!RET	
	ret
	restore
	!JUMPI	.S14
	ba	 .S14	 	!then: jump to #end-if '.S14'
	nop
 .S14:
	!JUMPI	.S11
	ba	 .S11	 	!if: jump to #end-if '.S11'
	nop
 .S13:
 !#if-guard:
	!LOADI	4, 73
	set	 4, %l2	 	!int: reg 73 gets val 4
	!MOV	58, 72
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 71
	mov	 %g0, %l4	 
	!COMP	72, 73, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 71
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	71, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 71) to true
	!CBREQ	2, .S15, .S16
	be	 .S15	 	!if: branch true: '.S15' false: '.S16'
	nop
	ba	.S16 	!if: branch true: '.S15' false: '.S16'
	nop
 .S15:
	!LOADI	100, 4
	set	 100, %i0	 	!int: reg 4 gets val 100
	!RET	
	ret
	restore
	!JUMPI	.S17
	ba	 .S17	 	!then: jump to #end-if '.S17'
	nop
 .S17:
	!JUMPI	.S14
	ba	 .S14	 	!if: jump to #end-if '.S14'
	nop
 .S16:
 !#if-guard:
	!LOADI	5, 76
	set	 5, %l2	 	!int: reg 76 gets val 5
	!MOV	58, 75
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 74
	mov	 %g0, %l4	 
	!COMP	75, 76, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 74
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	74, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 74) to true
	!CBREQ	2, .S18, .S19
	be	 .S18	 	!if: branch true: '.S18' false: '.S19'
	nop
	ba	.S19 	!if: branch true: '.S18' false: '.S19'
	nop
 .S18:
	!LOADI	101, 4
	set	 101, %i0	 	!int: reg 4 gets val 101
	!RET	
	ret
	restore
	!JUMPI	.S20
	ba	 .S20	 	!then: jump to #end-if '.S20'
	nop
 .S20:
	!JUMPI	.S17
	ba	 .S17	 	!if: jump to #end-if '.S17'
	nop
 .S19:
 !#if-guard:
	!LOADI	6, 79
	set	 6, %l2	 	!int: reg 79 gets val 6
	!MOV	58, 78
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 77
	mov	 %g0, %l4	 
	!COMP	78, 79, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 77
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	77, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 77) to true
	!CBREQ	2, .S21, .S22
	be	 .S21	 	!if: branch true: '.S21' false: '.S22'
	nop
	ba	.S22 	!if: branch true: '.S21' false: '.S22'
	nop
 .S21:
	!LOADI	110, 4
	set	 110, %i0	 	!int: reg 4 gets val 110
	!RET	
	ret
	restore
	!JUMPI	.S23
	ba	 .S23	 	!then: jump to #end-if '.S23'
	nop
 .S23:
	!JUMPI	.S20
	ba	 .S20	 	!if: jump to #end-if '.S20'
	nop
 .S22:
 !#if-guard:
	!LOADI	7, 82
	set	 7, %l2	 	!int: reg 82 gets val 7
	!MOV	58, 81
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 80
	mov	 %g0, %l4	 
	!COMP	81, 82, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 80
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	80, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 80) to true
	!CBREQ	2, .S24, .S25
	be	 .S24	 	!if: branch true: '.S24' false: '.S25'
	nop
	ba	.S25 	!if: branch true: '.S24' false: '.S25'
	nop
 .S24:
	!LOADI	111, 4
	set	 111, %i0	 	!int: reg 4 gets val 111
	!RET	
	ret
	restore
	!JUMPI	.S26
	ba	 .S26	 	!then: jump to #end-if '.S26'
	nop
 .S26:
	!JUMPI	.S23
	ba	 .S23	 	!if: jump to #end-if '.S23'
	nop
 .S25:
 !#if-guard:
	!LOADI	8, 85
	set	 8, %l2	 	!int: reg 85 gets val 8
	!MOV	58, 84
	mov	 %l1, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 83
	mov	 %g0, %l0	 
	!COMP	84, 85, 2
	cmp	 %l1, %l2	 
	!MOVEQ	2, 3, 83
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	83, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 83) to true
	!CBREQ	2, .S27, .S28
	be	 .S27	 	!if: branch true: '.S27' false: '.S28'
	nop
	ba	.S28 	!if: branch true: '.S27' false: '.S28'
	nop
 .S27:
	!LOADI	1000, 4
	set	 1000, %i0	 	!int: reg 4 gets val 1000
	!RET	
	ret
	restore
	!JUMPI	.S29
	ba	 .S29	 	!then: jump to #end-if '.S29'
	nop
 .S29:
	!JUMPI	.S26
	ba	 .S26	 	!if: jump to #end-if '.S26'
	nop
 .S28:
	!LOADI	1001, 4
	set	 1001, %i0	 	!int: reg 4 gets val 1001
	!RET	
	ret
	restore
	!JUMPI	.S29
	ba	 .S29	 	!if: jump to #end-if '.S29'
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	printRecursive
	.type	printRecursive, #function
	.proc	04
!#function-entry:
printRecursive:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 47
	mov	 %i0, %l3	 
	!STOREINARGUMENT	11, 48
	mov	 %i1, %l4	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 51
	set	 0, %l1	 	!int: reg 51 gets val 0
	!MOV	48, 50
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 49
	mov	 %g0, %l5	 
	!COMP	50, 51, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 49
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	49, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 49) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	47, 4
	mov	 %l3, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
	!MOV	47, 52
	mov	 %l3, %l1	 
	!PRINTLN	52
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 55
	set	 1, %l1	 	!int: reg 55 gets val 1
	!MOV	48, 54
	mov	 %l4, %l2	 
	!SUB	54, 55, 53
	sub	 %l2, %l1, %l1	 
	!MOV	53, 48
	mov	 %l1, %l4	 
	!MOV	47, 57
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	57, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 57to register outReg 1
	!MOV	48, 57
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	57, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 57to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
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
 	.section	".text"
	.align	4
	.global	countTotal
	.type	countTotal, #function
	.proc	04
!#function-entry:
countTotal:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l0	 
 !#function-body:
	!MOV	16, 18
	mov	 %l0, %l1	 
	!LOADAI	18, 0, 18
	ld	[%l1 + 0], %l1
	!PRINTLN	18
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	16, 19
	mov	 %l0, %l1	 
	!LOADAI	19, 4, 19
	ld	[%l1 + 4], %l1
	!PRINTLN	19
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	16, 20
	mov	 %l0, %l1	 
	!LOADAI	20, 8, 20
	ld	[%l1 + 8], %l1
	!PRINTLN	20
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	16, 21
	mov	 %l0, %l1	 
	!LOADAI	21, 12, 21
	ld	[%l1 + 12], %l1
	!PRINTLN	21
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	16, 22
	mov	 %l0, %l1	 
	!LOADAI	22, 16, 22
	ld	[%l1 + 16], %l1
	!PRINTLN	22
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	16, 23
	mov	 %l0, %l1	 
	!LOADAI	23, 20, 23
	ld	[%l1 + 20], %l1
	!PRINTLN	23
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	16, 24
	mov	 %l0, %l1	 
	!LOADAI	24, 24, 24
	ld	[%l1 + 24], %l1
	!PRINTLN	24
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	16, 25
	mov	 %l0, %l1	 
	!LOADAI	25, 28, 25
	ld	[%l1 + 28], %l1
	!PRINTLN	25
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	16, 26
	mov	 %l0, %l1	 
	!LOADAI	26, 32, 26
	ld	[%l1 + 32], %l1
	!PRINTLN	26
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	0, 27
	set	 0, %l1	 	!int: reg 27 gets val 0
	!MOV	27, 17
	mov	 %l1, %l1	 
	!MOV	16, 31
	mov	 %l0, %l1	 
	!LOADAI	31, 32, 31
	ld	[%l1 + 32], %l1
	!MOV	16, 33
	mov	 %l0, %l2	 
	!LOADAI	33, 28, 33
	ld	[%l2 + 28], %l2
	!MOV	16, 35
	mov	 %l0, %l3	 
	!LOADAI	35, 24, 35
	ld	[%l3 + 24], %l3
	!MOV	16, 37
	mov	 %l0, %l4	 
	!LOADAI	37, 20, 37
	ld	[%l4 + 20], %l4
	!MOV	16, 39
	mov	 %l0, %l5	 
	!LOADAI	39, 16, 39
	ld	[%l5 + 16], %l5
	!MOV	16, 41
	mov	 %l0, %l6	 
	!LOADAI	41, 12, 41
	ld	[%l6 + 12], %l6
	!MOV	16, 43
	mov	 %l0, %l7	 
	!LOADAI	43, 8, 43
	ld	[%l7 + 8], %l7
	!STOREAI	999, 999, 16
	st	%l1, [%sp + 16]
	!MOV	16, 45
	mov	 %l0, %l1	 
	!STOREAI	999, 999, 128
	st	%l1, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l1
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!STOREAI	999, 999, 24
	st	%l1, [%sp + 24]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l1
	!LOADAI	45, 4, 45
	ld	[%l1 + 4], %l0
	!STOREAI	999, 999, 128
	st	%l1, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l1
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!MOV	16, 44
	mov	 %l0, %l0	 
	!LOADAI	44, 0, 44
	ld	[%l0 + 0], %l0
	!STOREAI	999, 999, 40
	st	%l1, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l1
	!ADD	44, 45, 42
	add	 %l0, %l1, %l0	 
	!STOREAI	999, 999, 128
	st	%l1, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l1
	!ADD	42, 43, 40
	add	 %l0, %l7, %l0	 
	!ADD	40, 41, 38
	add	 %l0, %l6, %l0	 
	!ADD	38, 39, 36
	add	 %l0, %l5, %l0	 
	!ADD	36, 37, 34
	add	 %l0, %l4, %l0	 
	!ADD	34, 35, 32
	add	 %l0, %l3, %l0	 
	!ADD	32, 33, 30
	add	 %l0, %l2, %l0	 
	!ADD	30, 31, 29
	add	 %l0, %l1, %l0	 
	!MOV	29, 17
	mov	 %l0, %l1	 
	!MOV	17, 4
	mov	 %l1, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 