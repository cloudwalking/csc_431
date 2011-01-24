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
	!MOV	1, 80
	mov	 %o0, %l3	 
	!STOREAI	0, 80, 0
	st	%g0, [%l3 + 0]
	!STOREAI	0, 80, 4
	st	%g0, [%l3 + 4]
	!STOREAI	0, 80, 8
	st	%g0, [%l3 + 8]
	!STOREAI	0, 80, 12
	st	%g0, [%l3 + 12]
	!STOREAI	0, 80, 16
	st	%g0, [%l3 + 16]
	!STOREAI	0, 80, 20
	st	%g0, [%l3 + 20]
	!STOREAI	0, 80, 24
	st	%g0, [%l3 + 24]
	!STOREAI	0, 80, 28
	st	%g0, [%l3 + 28]
	!STOREAI	0, 80, 32
	st	%g0, [%l3 + 32]
	!NEW	36, 1
	mov	36, %o0
	call	malloc
	nop
	!MOV	1, 81
	mov	 %o0, %l1	 
	!STOREAI	0, 81, 0
	st	%g0, [%l1 + 0]
	!STOREAI	0, 81, 4
	st	%g0, [%l1 + 4]
	!STOREAI	0, 81, 8
	st	%g0, [%l1 + 8]
	!STOREAI	0, 81, 12
	st	%g0, [%l1 + 12]
	!STOREAI	0, 81, 16
	st	%g0, [%l1 + 16]
	!STOREAI	0, 81, 20
	st	%g0, [%l1 + 20]
	!STOREAI	0, 81, 24
	st	%g0, [%l1 + 24]
	!STOREAI	0, 81, 28
	st	%g0, [%l1 + 28]
	!STOREAI	0, 81, 32
	st	%g0, [%l1 + 32]
	!MOV	81, 80
	mov	 %l1, %l3	 
	!LOADI	0, 83
	set	 0, %l1	 	!int: reg 83 gets val 0
	!MOV	83, 78
	mov	 %l1, %l1	 
	!LOADI	0, 85
	set	 0, %l2	 	!int: reg 85 gets val 0
	!MOV	80, 86
	mov	 %l3, %l1	 
	!STOREAI	85, 86, 0
	st	%l2, [%l1 + 0]
	!LOADI	0, 88
	set	 0, %l2	 	!int: reg 88 gets val 0
	!MOV	80, 89
	mov	 %l3, %l1	 
	!STOREAI	88, 89, 4
	st	%l2, [%l1 + 4]
	!LOADI	0, 91
	set	 0, %l2	 	!int: reg 91 gets val 0
	!MOV	80, 92
	mov	 %l3, %l1	 
	!STOREAI	91, 92, 8
	st	%l2, [%l1 + 8]
	!LOADI	0, 94
	set	 0, %l2	 	!int: reg 94 gets val 0
	!MOV	80, 95
	mov	 %l3, %l1	 
	!STOREAI	94, 95, 12
	st	%l2, [%l1 + 12]
	!LOADI	0, 97
	set	 0, %l2	 	!int: reg 97 gets val 0
	!MOV	80, 98
	mov	 %l3, %l1	 
	!STOREAI	97, 98, 16
	st	%l2, [%l1 + 16]
	!LOADI	0, 100
	set	 0, %l2	 	!int: reg 100 gets val 0
	!MOV	80, 101
	mov	 %l3, %l1	 
	!STOREAI	100, 101, 20
	st	%l2, [%l1 + 20]
	!LOADI	0, 103
	set	 0, %l2	 	!int: reg 103 gets val 0
	!MOV	80, 104
	mov	 %l3, %l1	 
	!STOREAI	103, 104, 24
	st	%l2, [%l1 + 24]
	!LOADI	0, 106
	set	 0, %l2	 	!int: reg 106 gets val 0
	!MOV	80, 107
	mov	 %l3, %l1	 
	!STOREAI	106, 107, 28
	st	%l2, [%l1 + 28]
	!LOADI	0, 109
	set	 0, %l2	 	!int: reg 109 gets val 0
	!MOV	80, 110
	mov	 %l3, %l1	 
	!STOREAI	109, 110, 32
	st	%l2, [%l1 + 32]
	!READ	112
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	112, 77
	mov	 %l1, %l2	 
 !#while-guard:
.S30:
	!LOADI	0, 116
	set	 0, %l1	 	!int: reg 116 gets val 0
	!MOV	77, 115
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 114
	mov	 %g0, %l5	 
	!COMP	115, 116, 2
	cmp	 %l4, %l1	 
	!MOVNE	2, 3, 114
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	114, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 114) to true
	!CBREQ	2, .S31, .S32
	be	 .S31	 	!while: branch true: '.S31' false: '.S32'
	nop
	ba	.S32 	!while: branch true: '.S31' false: '.S32'
	nop
 .S31:
 !#if-guard:
	!LOADI	1, 119
	set	 1, %l1	 	!int: reg 119 gets val 1
	!MOV	77, 118
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 117
	mov	 %g0, %l5	 
	!COMP	118, 119, 2
	cmp	 %l4, %l1	 
	!MOVEQ	2, 3, 117
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	117, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 117) to true
	!CBREQ	2, .S33, .S34
	be	 .S33	 	!if: branch true: '.S33' false: '.S34'
	nop
	ba	.S34 	!if: branch true: '.S33' false: '.S34'
	nop
 .S33:
	!LOADI	1, 122
	set	 1, %l0	 	!int: reg 122 gets val 1
	!MOV	80, 121
	mov	 %l3, %l1	 
	!LOADAI	121, 0, 121
	ld	[%l1 + 0], %l1
	!ADD	121, 122, 120
	add	 %l1, %l0, %l1	 
	!MOV	80, 123
	mov	 %l3, %l0	 
	!STOREAI	120, 123, 0
	st	%l1, [%l0 + 0]
	!JUMPI	.S35
	ba	 .S35	 	!then: jump to #end-if '.S35'
	nop
 .S35:
	!READ	186
	add	%sp, %g0, %l0
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l0

	!MOV	186, 77
	mov	 %l0, %l2	 
	!JUMPI	.S30
	ba	 .S30	 	!while: jump back to guard
	nop
 .S34:
 !#if-guard:
	!LOADI	2, 127
	set	 2, %l1	 	!int: reg 127 gets val 2
	!MOV	77, 126
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 125
	mov	 %g0, %l5	 
	!COMP	126, 127, 2
	cmp	 %l4, %l1	 
	!MOVEQ	2, 3, 125
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	125, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 125) to true
	!CBREQ	2, .S36, .S37
	be	 .S36	 	!if: branch true: '.S36' false: '.S37'
	nop
	ba	.S37 	!if: branch true: '.S36' false: '.S37'
	nop
 .S36:
	!LOADI	1, 130
	set	 1, %l0	 	!int: reg 130 gets val 1
	!MOV	80, 129
	mov	 %l3, %l1	 
	!LOADAI	129, 4, 129
	ld	[%l1 + 4], %l1
	!ADD	129, 130, 128
	add	 %l1, %l0, %l1	 
	!MOV	80, 131
	mov	 %l3, %l0	 
	!STOREAI	128, 131, 4
	st	%l1, [%l0 + 4]
	!JUMPI	.S38
	ba	 .S38	 	!then: jump to #end-if '.S38'
	nop
 .S38:
	!JUMPI	.S35
	ba	 .S35	 	!if: jump to #end-if '.S35'
	nop
 .S37:
 !#if-guard:
	!LOADI	3, 135
	set	 3, %l1	 	!int: reg 135 gets val 3
	!MOV	77, 134
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 133
	mov	 %g0, %l5	 
	!COMP	134, 135, 2
	cmp	 %l4, %l1	 
	!MOVEQ	2, 3, 133
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	133, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 133) to true
	!CBREQ	2, .S39, .S40
	be	 .S39	 	!if: branch true: '.S39' false: '.S40'
	nop
	ba	.S40 	!if: branch true: '.S39' false: '.S40'
	nop
 .S39:
	!LOADI	1, 138
	set	 1, %l0	 	!int: reg 138 gets val 1
	!MOV	80, 137
	mov	 %l3, %l1	 
	!LOADAI	137, 8, 137
	ld	[%l1 + 8], %l1
	!ADD	137, 138, 136
	add	 %l1, %l0, %l1	 
	!MOV	80, 139
	mov	 %l3, %l0	 
	!STOREAI	136, 139, 8
	st	%l1, [%l0 + 8]
	!JUMPI	.S41
	ba	 .S41	 	!then: jump to #end-if '.S41'
	nop
 .S41:
	!JUMPI	.S38
	ba	 .S38	 	!if: jump to #end-if '.S38'
	nop
 .S40:
 !#if-guard:
	!LOADI	4, 143
	set	 4, %l1	 	!int: reg 143 gets val 4
	!MOV	77, 142
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 141
	mov	 %g0, %l5	 
	!COMP	142, 143, 2
	cmp	 %l4, %l1	 
	!MOVEQ	2, 3, 141
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	141, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 141) to true
	!CBREQ	2, .S42, .S43
	be	 .S42	 	!if: branch true: '.S42' false: '.S43'
	nop
	ba	.S43 	!if: branch true: '.S42' false: '.S43'
	nop
 .S42:
	!LOADI	1, 146
	set	 1, %l0	 	!int: reg 146 gets val 1
	!MOV	80, 145
	mov	 %l3, %l1	 
	!LOADAI	145, 12, 145
	ld	[%l1 + 12], %l1
	!ADD	145, 146, 144
	add	 %l1, %l0, %l1	 
	!MOV	80, 147
	mov	 %l3, %l0	 
	!STOREAI	144, 147, 12
	st	%l1, [%l0 + 12]
	!JUMPI	.S44
	ba	 .S44	 	!then: jump to #end-if '.S44'
	nop
 .S44:
	!JUMPI	.S41
	ba	 .S41	 	!if: jump to #end-if '.S41'
	nop
 .S43:
 !#if-guard:
	!LOADI	5, 151
	set	 5, %l1	 	!int: reg 151 gets val 5
	!MOV	77, 150
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 149
	mov	 %g0, %l5	 
	!COMP	150, 151, 2
	cmp	 %l4, %l1	 
	!MOVEQ	2, 3, 149
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	149, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 149) to true
	!CBREQ	2, .S45, .S46
	be	 .S45	 	!if: branch true: '.S45' false: '.S46'
	nop
	ba	.S46 	!if: branch true: '.S45' false: '.S46'
	nop
 .S45:
	!LOADI	1, 154
	set	 1, %l0	 	!int: reg 154 gets val 1
	!MOV	80, 153
	mov	 %l3, %l1	 
	!LOADAI	153, 16, 153
	ld	[%l1 + 16], %l1
	!ADD	153, 154, 152
	add	 %l1, %l0, %l1	 
	!MOV	80, 155
	mov	 %l3, %l0	 
	!STOREAI	152, 155, 16
	st	%l1, [%l0 + 16]
	!JUMPI	.S47
	ba	 .S47	 	!then: jump to #end-if '.S47'
	nop
 .S47:
	!JUMPI	.S44
	ba	 .S44	 	!if: jump to #end-if '.S44'
	nop
 .S46:
 !#if-guard:
	!LOADI	6, 159
	set	 6, %l1	 	!int: reg 159 gets val 6
	!MOV	77, 158
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 157
	mov	 %g0, %l5	 
	!COMP	158, 159, 2
	cmp	 %l4, %l1	 
	!MOVEQ	2, 3, 157
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	157, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 157) to true
	!CBREQ	2, .S48, .S49
	be	 .S48	 	!if: branch true: '.S48' false: '.S49'
	nop
	ba	.S49 	!if: branch true: '.S48' false: '.S49'
	nop
 .S48:
	!LOADI	1, 162
	set	 1, %l0	 	!int: reg 162 gets val 1
	!MOV	80, 161
	mov	 %l3, %l1	 
	!LOADAI	161, 20, 161
	ld	[%l1 + 20], %l1
	!ADD	161, 162, 160
	add	 %l1, %l0, %l1	 
	!MOV	80, 163
	mov	 %l3, %l0	 
	!STOREAI	160, 163, 20
	st	%l1, [%l0 + 20]
	!JUMPI	.S50
	ba	 .S50	 	!then: jump to #end-if '.S50'
	nop
 .S50:
	!JUMPI	.S47
	ba	 .S47	 	!if: jump to #end-if '.S47'
	nop
 .S49:
 !#if-guard:
	!LOADI	7, 167
	set	 7, %l1	 	!int: reg 167 gets val 7
	!MOV	77, 166
	mov	 %l2, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 165
	mov	 %g0, %l5	 
	!COMP	166, 167, 2
	cmp	 %l4, %l1	 
	!MOVEQ	2, 3, 165
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	165, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 165) to true
	!CBREQ	2, .S51, .S52
	be	 .S51	 	!if: branch true: '.S51' false: '.S52'
	nop
	ba	.S52 	!if: branch true: '.S51' false: '.S52'
	nop
 .S51:
	!LOADI	1, 170
	set	 1, %l0	 	!int: reg 170 gets val 1
	!MOV	80, 169
	mov	 %l3, %l1	 
	!LOADAI	169, 24, 169
	ld	[%l1 + 24], %l1
	!ADD	169, 170, 168
	add	 %l1, %l0, %l1	 
	!MOV	80, 171
	mov	 %l3, %l0	 
	!STOREAI	168, 171, 24
	st	%l1, [%l0 + 24]
	!JUMPI	.S53
	ba	 .S53	 	!then: jump to #end-if '.S53'
	nop
 .S53:
	!JUMPI	.S50
	ba	 .S50	 	!if: jump to #end-if '.S50'
	nop
 .S52:
 !#if-guard:
	!LOADI	8, 175
	set	 8, %l1	 	!int: reg 175 gets val 8
	!MOV	77, 174
	mov	 %l2, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 173
	mov	 %g0, %l0	 
	!COMP	174, 175, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 173
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	173, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 173) to true
	!CBREQ	2, .S54, .S55
	be	 .S54	 	!if: branch true: '.S54' false: '.S55'
	nop
	ba	.S55 	!if: branch true: '.S54' false: '.S55'
	nop
 .S54:
	!LOADI	1, 178
	set	 1, %l0	 	!int: reg 178 gets val 1
	!MOV	80, 177
	mov	 %l3, %l1	 
	!LOADAI	177, 28, 177
	ld	[%l1 + 28], %l1
	!ADD	177, 178, 176
	add	 %l1, %l0, %l1	 
	!MOV	80, 179
	mov	 %l3, %l0	 
	!STOREAI	176, 179, 28
	st	%l1, [%l0 + 28]
	!JUMPI	.S56
	ba	 .S56	 	!then: jump to #end-if '.S56'
	nop
 .S56:
	!JUMPI	.S53
	ba	 .S53	 	!if: jump to #end-if '.S53'
	nop
 .S55:
	!LOADI	1, 183
	set	 1, %l0	 	!int: reg 183 gets val 1
	!MOV	80, 182
	mov	 %l3, %l1	 
	!LOADAI	182, 32, 182
	ld	[%l1 + 32], %l1
	!ADD	182, 183, 181
	add	 %l1, %l0, %l1	 
	!MOV	80, 184
	mov	 %l3, %l0	 
	!STOREAI	181, 184, 32
	st	%l1, [%l0 + 32]
	!JUMPI	.S56
	ba	 .S56	 	!if: jump to #end-if '.S56'
	nop
 .S32:
	!MOV	80, 189
	mov	 %l3, %l0	 
	!STOREOUTARGUMENT	189, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 189to register outReg 1
	!CALL	countTotal
	call	 countTotal	
	nop
	!MOV	1, 188
	mov	 %o0, %l0	 
	!PRINTLN	188
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	1, 191
	set	 1, %l0	 	!int: reg 191 gets val 1
	!STOREOUTARGUMENT	191, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 191to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 190
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	190, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 190to register outReg 1
	!MOV	80, 190
	mov	 %l3, %l1	 
	!LOADAI	190, 0, 190
	ld	[%l1 + 0], %l1
	!STOREOUTARGUMENT	190, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 190to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	2, 193
	set	 2, %l0	 	!int: reg 193 gets val 2
	!STOREOUTARGUMENT	193, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 193to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 192
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	192, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 192to register outReg 1
	!MOV	80, 192
	mov	 %l3, %l1	 
	!LOADAI	192, 4, 192
	ld	[%l1 + 4], %l1
	!STOREOUTARGUMENT	192, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 192to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	3, 195
	set	 3, %l0	 	!int: reg 195 gets val 3
	!STOREOUTARGUMENT	195, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 195to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 194
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	194, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 194to register outReg 1
	!MOV	80, 194
	mov	 %l3, %l1	 
	!LOADAI	194, 8, 194
	ld	[%l1 + 8], %l1
	!STOREOUTARGUMENT	194, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 194to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	4, 197
	set	 4, %l0	 	!int: reg 197 gets val 4
	!STOREOUTARGUMENT	197, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 197to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 196
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	196, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 196to register outReg 1
	!MOV	80, 196
	mov	 %l3, %l1	 
	!LOADAI	196, 12, 196
	ld	[%l1 + 12], %l1
	!STOREOUTARGUMENT	196, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 196to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	5, 199
	set	 5, %l0	 	!int: reg 199 gets val 5
	!STOREOUTARGUMENT	199, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 199to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 198
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	198, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 198to register outReg 1
	!MOV	80, 198
	mov	 %l3, %l1	 
	!LOADAI	198, 16, 198
	ld	[%l1 + 16], %l1
	!STOREOUTARGUMENT	198, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 198to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	6, 201
	set	 6, %l0	 	!int: reg 201 gets val 6
	!STOREOUTARGUMENT	201, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 201to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 200
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	200, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 200to register outReg 1
	!MOV	80, 200
	mov	 %l3, %l1	 
	!LOADAI	200, 20, 200
	ld	[%l1 + 20], %l1
	!STOREOUTARGUMENT	200, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 200to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	7, 203
	set	 7, %l0	 	!int: reg 203 gets val 7
	!STOREOUTARGUMENT	203, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 203to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 202
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	202, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 202to register outReg 1
	!MOV	80, 202
	mov	 %l3, %l1	 
	!LOADAI	202, 24, 202
	ld	[%l1 + 24], %l1
	!STOREOUTARGUMENT	202, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 202to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	8, 205
	set	 8, %l0	 	!int: reg 205 gets val 8
	!STOREOUTARGUMENT	205, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 205to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 204
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	204, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 204to register outReg 1
	!MOV	80, 204
	mov	 %l3, %l1	 
	!LOADAI	204, 28, 204
	ld	[%l1 + 28], %l1
	!STOREOUTARGUMENT	204, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 204to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	9, 207
	set	 9, %l0	 	!int: reg 207 gets val 9
	!STOREOUTARGUMENT	207, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 207to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 206
	mov	 %o0, %l0	 
	!STOREOUTARGUMENT	206, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 206to register outReg 1
	!MOV	80, 206
	mov	 %l3, %l0	 
	!LOADAI	206, 32, 206
	ld	[%l0 + 32], %l0
	!STOREOUTARGUMENT	206, 6
	mov	 %l0, %o1	 	!argument: store out param from reg 206to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
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
	!STOREINARGUMENT	10, 49
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 52
	set	 0, %l2	 	!int: reg 52 gets val 0
	!MOV	49, 51
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 50
	mov	 %g0, %l4	 
	!COMP	51, 52, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 50
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	50, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 50) to true
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
	!LOADI	1, 55
	set	 1, %l2	 	!int: reg 55 gets val 1
	!MOV	49, 54
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 53
	mov	 %g0, %l4	 
	!COMP	54, 55, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 53
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	53, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 53) to true
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
	!LOADI	2, 58
	set	 2, %l2	 	!int: reg 58 gets val 2
	!MOV	49, 57
	mov	 %l1, %l3	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 56
	mov	 %g0, %l4	 
	!COMP	57, 58, 2
	cmp	 %l3, %l2	 
	!MOVEQ	2, 3, 56
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	56, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 56) to true
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
	!LOADI	3, 61
	set	 3, %l2	 	!int: reg 61 gets val 3
	!MOV	49, 60
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
	!LOADI	4, 64
	set	 4, %l2	 	!int: reg 64 gets val 4
	!MOV	49, 63
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
	!LOADI	5, 67
	set	 5, %l2	 	!int: reg 67 gets val 5
	!MOV	49, 66
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
	!LOADI	6, 70
	set	 6, %l2	 	!int: reg 70 gets val 6
	!MOV	49, 69
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
	!LOADI	7, 73
	set	 7, %l2	 	!int: reg 73 gets val 7
	!MOV	49, 72
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
	!LOADI	8, 76
	set	 8, %l2	 	!int: reg 76 gets val 8
	!MOV	49, 75
	mov	 %l1, %l1	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 74
	mov	 %g0, %l0	 
	!COMP	75, 76, 2
	cmp	 %l1, %l2	 
	!MOVEQ	2, 3, 74
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	74, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 74) to true
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
	!STOREINARGUMENT	10, 38
	mov	 %i0, %l3	 
	!STOREINARGUMENT	11, 39
	mov	 %i1, %l4	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 42
	set	 0, %l1	 	!int: reg 42 gets val 0
	!MOV	39, 41
	mov	 %l4, %l2	 
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 40
	mov	 %g0, %l5	 
	!COMP	41, 42, 2
	cmp	 %l2, %l1	 
	!MOVEQ	2, 3, 40
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	40, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 40) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	38, 4
	mov	 %l3, %i0	 
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
	!MOV	38, 43
	mov	 %l3, %l1	 
	!PRINTLN	43
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 46
	set	 1, %l1	 	!int: reg 46 gets val 1
	!MOV	39, 45
	mov	 %l4, %l2	 
	!SUB	45, 46, 44
	sub	 %l2, %l1, %l1	 
	!MOV	44, 39
	mov	 %l1, %l4	 
	!MOV	38, 48
	mov	 %l3, %l1	 
	!STOREOUTARGUMENT	48, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 48to register outReg 1
	!MOV	39, 48
	mov	 %l4, %l1	 
	!STOREOUTARGUMENT	48, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 48to register outReg 2
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
	!LOADI	0, 18
	set	 0, %l1	 	!int: reg 18 gets val 0
	!MOV	18, 17
	mov	 %l1, %l1	 
	!MOV	16, 22
	mov	 %l0, %l1	 
	!LOADAI	22, 32, 22
	ld	[%l1 + 32], %l1
	!MOV	16, 24
	mov	 %l0, %l2	 
	!LOADAI	24, 28, 24
	ld	[%l2 + 28], %l2
	!MOV	16, 26
	mov	 %l0, %l3	 
	!LOADAI	26, 24, 26
	ld	[%l3 + 24], %l3
	!MOV	16, 28
	mov	 %l0, %l4	 
	!LOADAI	28, 20, 28
	ld	[%l4 + 20], %l4
	!MOV	16, 30
	mov	 %l0, %l5	 
	!LOADAI	30, 16, 30
	ld	[%l5 + 16], %l5
	!MOV	16, 32
	mov	 %l0, %l6	 
	!LOADAI	32, 12, 32
	ld	[%l6 + 12], %l6
	!MOV	16, 34
	mov	 %l0, %l7	 
	!LOADAI	34, 8, 34
	ld	[%l7 + 8], %l7
	!STOREAI	999, 999, 16
	st	%l1, [%sp + 16]
	!MOV	16, 36
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
	!LOADAI	36, 4, 36
	ld	[%l1 + 4], %l0
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 128
	st	%l1, [%sp + 128]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l1
	!MOV	16, 35
	mov	 %l0, %l0	 
	!LOADAI	35, 0, 35
	ld	[%l0 + 0], %l0
	!STOREAI	999, 999, 40
	st	%l1, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l1
	!ADD	35, 36, 33
	add	 %l0, %l1, %l0	 
	!STOREAI	999, 999, 128
	st	%l1, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l1
	!ADD	33, 34, 31
	add	 %l0, %l7, %l0	 
	!ADD	31, 32, 29
	add	 %l0, %l6, %l0	 
	!ADD	29, 30, 27
	add	 %l0, %l5, %l0	 
	!ADD	27, 28, 25
	add	 %l0, %l4, %l0	 
	!ADD	25, 26, 23
	add	 %l0, %l3, %l0	 
	!ADD	23, 24, 21
	add	 %l0, %l2, %l0	 
	!ADD	21, 22, 20
	add	 %l0, %l1, %l0	 
	!MOV	20, 17
	mov	 %l0, %l1	 
	!MOV	17, 4
	mov	 %l1, %i0	 
	!RET	
	ret
	restore
 !#function-exit:
 