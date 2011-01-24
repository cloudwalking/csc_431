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
	!LOADI	36, 1
	set	 36, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 93
	mov	 %o0, %l3	 
	!MOV	92, 94
	mov	 %l4, %l4	 	!lvalue id: move reg 92 (var digits) to reg 94
	!MOV	93, 94
	mov	 %l3, %l4	 
	!MOV	94, 92
	mov	 %l4, %l4	 
	!LOADI	0, 96
	set	 0, %l3	 	!int: reg 96 gets val 0
	!MOV	90, 97
	mov	 %l1, %l1	 	!lvalue id: move reg 90 (var count) to reg 97
	!MOV	96, 97
	mov	 %l3, %l1	 
	!MOV	97, 90
	mov	 %l1, %l1	 
	!LOADI	0, 99
	set	 0, %l1	 	!int: reg 99 gets val 0
	!MOV	92, 101
	mov	 %l4, %l3	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	101, 3, 100
	ld	[%l3 + %g1], %l5
	!MOV	99, 100
	mov	 %l1, %l5	 
	!STOREAI	100, 101, 3
	st	%l5, [%l3 + %g1]
	!LOADI	0, 103
	set	 0, %l1	 	!int: reg 103 gets val 0
	!MOV	92, 105
	mov	 %l4, %l3	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	105, 3, 104
	ld	[%l3 + %g1], %l5
	!MOV	103, 104
	mov	 %l1, %l5	 
	!STOREAI	104, 105, 3
	st	%l5, [%l3 + %g1]
	!LOADI	0, 107
	set	 0, %l1	 	!int: reg 107 gets val 0
	!MOV	92, 109
	mov	 %l4, %l3	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	109, 3, 108
	ld	[%l3 + %g1], %l5
	!MOV	107, 108
	mov	 %l1, %l5	 
	!STOREAI	108, 109, 3
	st	%l5, [%l3 + %g1]
	!LOADI	0, 111
	set	 0, %l1	 	!int: reg 111 gets val 0
	!MOV	92, 113
	mov	 %l4, %l3	 
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	113, 3, 112
	ld	[%l3 + %g1], %l5
	!MOV	111, 112
	mov	 %l1, %l5	 
	!STOREAI	112, 113, 3
	st	%l5, [%l3 + %g1]
	!LOADI	0, 115
	set	 0, %l1	 	!int: reg 115 gets val 0
	!MOV	92, 117
	mov	 %l4, %l3	 
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	117, 3, 116
	ld	[%l3 + %g1], %l5
	!MOV	115, 116
	mov	 %l1, %l5	 
	!STOREAI	116, 117, 3
	st	%l5, [%l3 + %g1]
	!LOADI	0, 119
	set	 0, %l1	 	!int: reg 119 gets val 0
	!MOV	92, 121
	mov	 %l4, %l3	 
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	121, 3, 120
	ld	[%l3 + %g1], %l5
	!MOV	119, 120
	mov	 %l1, %l5	 
	!STOREAI	120, 121, 3
	st	%l5, [%l3 + %g1]
	!LOADI	0, 123
	set	 0, %l1	 	!int: reg 123 gets val 0
	!MOV	92, 125
	mov	 %l4, %l3	 
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	125, 3, 124
	ld	[%l3 + %g1], %l5
	!MOV	123, 124
	mov	 %l1, %l5	 
	!STOREAI	124, 125, 3
	st	%l5, [%l3 + %g1]
	!LOADI	0, 127
	set	 0, %l1	 	!int: reg 127 gets val 0
	!MOV	92, 129
	mov	 %l4, %l3	 
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	129, 3, 128
	ld	[%l3 + %g1], %l5
	!MOV	127, 128
	mov	 %l1, %l5	 
	!STOREAI	128, 129, 3
	st	%l5, [%l3 + %g1]
	!LOADI	0, 131
	set	 0, %l1	 	!int: reg 131 gets val 0
	!MOV	92, 133
	mov	 %l4, %l3	 
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	133, 3, 132
	ld	[%l3 + %g1], %l5
	!MOV	131, 132
	mov	 %l1, %l5	 
	!STOREAI	132, 133, 3
	st	%l5, [%l3 + %g1]
	!MOV	89, 135
	mov	 %l2, %l1	 	!lvalue id: move reg 89 (var current) to reg 135
	!READ	135
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	135, 89
	mov	 %l1, %l2	 
 !#while-guard:
.S30:
	!LOADI	0, 139
	set	 0, %l1	 	!int: reg 139 gets val 0
	!MOV	89, 138
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 138
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 137
	mov	 %g0, %l5	 
	!COMP	138, 139, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 138 (var null) to 139 (var null), store in cc-reg
	!MOVNE	2, 3, 137
	movne	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	137, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 137) to true
	!CBREQ	2, .S31, .S32
	be	 .S31	 	!while: branch true: '.S31' false: '.S32'
	nop
	ba	.S32 	!while: branch true: '.S31' false: '.S32'
	nop
 .S31:
 !#if-guard:
	!LOADI	1, 142
	set	 1, %l1	 	!int: reg 142 gets val 1
	!MOV	89, 141
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 141
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 140
	mov	 %g0, %l5	 
	!COMP	141, 142, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 141 (var null) to 142 (var null), store in cc-reg
	!MOVEQ	2, 3, 140
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	140, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 140) to true
	!CBREQ	2, .S33, .S34
	be	 .S33	 	!if: branch true: '.S33' false: '.S34'
	nop
	ba	.S34 	!if: branch true: '.S33' false: '.S34'
	nop
 .S33:
	!LOADI	1, 146
	set	 1, %l0	 	!int: reg 146 gets val 1
	!MOV	92, 147
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 147
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	147, 3, 145
	ld	[%l1 + %g1], %l1
	!ADD	145, 146, 143
	add	 %l1, %l0, %l1	 	!expression: reg 145 (var null) + 146 in reg 143 (var null)
	!MOV	92, 148
	mov	 %l4, %l0	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	148, 3, 144
	ld	[%l0 + %g1], %l3
	!MOV	143, 144
	mov	 %l1, %l3	 
	!STOREAI	144, 148, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S35
	ba	 .S35	 	!then: jump to #end-if '.S35'
	nop
 .S35:
	!MOV	89, 227
	mov	 %l2, %l0	 	!lvalue id: move reg 89 (var current) to reg 227
	!READ	227
	add	%sp, %g0, %l0
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l0

	!MOV	227, 89
	mov	 %l0, %l2	 
	!JUMPI	.S30
	ba	 .S30	 	!while: jump back to guard
	nop
 .S34:
 !#if-guard:
	!LOADI	2, 152
	set	 2, %l1	 	!int: reg 152 gets val 2
	!MOV	89, 151
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 151
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 150
	mov	 %g0, %l5	 
	!COMP	151, 152, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 151 (var null) to 152 (var null), store in cc-reg
	!MOVEQ	2, 3, 150
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	150, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 150) to true
	!CBREQ	2, .S36, .S37
	be	 .S36	 	!if: branch true: '.S36' false: '.S37'
	nop
	ba	.S37 	!if: branch true: '.S36' false: '.S37'
	nop
 .S36:
	!LOADI	1, 156
	set	 1, %l0	 	!int: reg 156 gets val 1
	!MOV	92, 157
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 157
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	157, 3, 155
	ld	[%l1 + %g1], %l1
	!ADD	155, 156, 153
	add	 %l1, %l0, %l1	 	!expression: reg 155 (var null) + 156 in reg 153 (var null)
	!MOV	92, 158
	mov	 %l4, %l0	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	158, 3, 154
	ld	[%l0 + %g1], %l3
	!MOV	153, 154
	mov	 %l1, %l3	 
	!STOREAI	154, 158, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S38
	ba	 .S38	 	!then: jump to #end-if '.S38'
	nop
 .S38:
	!JUMPI	.S35
	ba	 .S35	 	!if: jump to #end-if '.S35'
	nop
 .S37:
 !#if-guard:
	!LOADI	3, 162
	set	 3, %l1	 	!int: reg 162 gets val 3
	!MOV	89, 161
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 161
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 160
	mov	 %g0, %l5	 
	!COMP	161, 162, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 161 (var null) to 162 (var null), store in cc-reg
	!MOVEQ	2, 3, 160
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	160, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 160) to true
	!CBREQ	2, .S39, .S40
	be	 .S39	 	!if: branch true: '.S39' false: '.S40'
	nop
	ba	.S40 	!if: branch true: '.S39' false: '.S40'
	nop
 .S39:
	!LOADI	1, 166
	set	 1, %l0	 	!int: reg 166 gets val 1
	!MOV	92, 167
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 167
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	167, 3, 165
	ld	[%l1 + %g1], %l1
	!ADD	165, 166, 163
	add	 %l1, %l0, %l1	 	!expression: reg 165 (var null) + 166 in reg 163 (var null)
	!MOV	92, 168
	mov	 %l4, %l0	 
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	168, 3, 164
	ld	[%l0 + %g1], %l3
	!MOV	163, 164
	mov	 %l1, %l3	 
	!STOREAI	164, 168, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S41
	ba	 .S41	 	!then: jump to #end-if '.S41'
	nop
 .S41:
	!JUMPI	.S38
	ba	 .S38	 	!if: jump to #end-if '.S38'
	nop
 .S40:
 !#if-guard:
	!LOADI	4, 172
	set	 4, %l1	 	!int: reg 172 gets val 4
	!MOV	89, 171
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 171
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 170
	mov	 %g0, %l5	 
	!COMP	171, 172, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 171 (var null) to 172 (var null), store in cc-reg
	!MOVEQ	2, 3, 170
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	170, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 170) to true
	!CBREQ	2, .S42, .S43
	be	 .S42	 	!if: branch true: '.S42' false: '.S43'
	nop
	ba	.S43 	!if: branch true: '.S42' false: '.S43'
	nop
 .S42:
	!LOADI	1, 176
	set	 1, %l0	 	!int: reg 176 gets val 1
	!MOV	92, 177
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 177
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	177, 3, 175
	ld	[%l1 + %g1], %l1
	!ADD	175, 176, 173
	add	 %l1, %l0, %l1	 	!expression: reg 175 (var null) + 176 in reg 173 (var null)
	!MOV	92, 178
	mov	 %l4, %l0	 
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	178, 3, 174
	ld	[%l0 + %g1], %l3
	!MOV	173, 174
	mov	 %l1, %l3	 
	!STOREAI	174, 178, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S44
	ba	 .S44	 	!then: jump to #end-if '.S44'
	nop
 .S44:
	!JUMPI	.S41
	ba	 .S41	 	!if: jump to #end-if '.S41'
	nop
 .S43:
 !#if-guard:
	!LOADI	5, 182
	set	 5, %l1	 	!int: reg 182 gets val 5
	!MOV	89, 181
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 181
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 180
	mov	 %g0, %l5	 
	!COMP	181, 182, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 181 (var null) to 182 (var null), store in cc-reg
	!MOVEQ	2, 3, 180
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	180, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 180) to true
	!CBREQ	2, .S45, .S46
	be	 .S45	 	!if: branch true: '.S45' false: '.S46'
	nop
	ba	.S46 	!if: branch true: '.S45' false: '.S46'
	nop
 .S45:
	!LOADI	1, 186
	set	 1, %l0	 	!int: reg 186 gets val 1
	!MOV	92, 187
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 187
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	187, 3, 185
	ld	[%l1 + %g1], %l1
	!ADD	185, 186, 183
	add	 %l1, %l0, %l1	 	!expression: reg 185 (var null) + 186 in reg 183 (var null)
	!MOV	92, 188
	mov	 %l4, %l0	 
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	188, 3, 184
	ld	[%l0 + %g1], %l3
	!MOV	183, 184
	mov	 %l1, %l3	 
	!STOREAI	184, 188, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S47
	ba	 .S47	 	!then: jump to #end-if '.S47'
	nop
 .S47:
	!JUMPI	.S44
	ba	 .S44	 	!if: jump to #end-if '.S44'
	nop
 .S46:
 !#if-guard:
	!LOADI	6, 192
	set	 6, %l1	 	!int: reg 192 gets val 6
	!MOV	89, 191
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 191
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 190
	mov	 %g0, %l5	 
	!COMP	191, 192, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 191 (var null) to 192 (var null), store in cc-reg
	!MOVEQ	2, 3, 190
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	190, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 190) to true
	!CBREQ	2, .S48, .S49
	be	 .S48	 	!if: branch true: '.S48' false: '.S49'
	nop
	ba	.S49 	!if: branch true: '.S48' false: '.S49'
	nop
 .S48:
	!LOADI	1, 196
	set	 1, %l0	 	!int: reg 196 gets val 1
	!MOV	92, 197
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 197
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	197, 3, 195
	ld	[%l1 + %g1], %l1
	!ADD	195, 196, 193
	add	 %l1, %l0, %l1	 	!expression: reg 195 (var null) + 196 in reg 193 (var null)
	!MOV	92, 198
	mov	 %l4, %l0	 
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	198, 3, 194
	ld	[%l0 + %g1], %l3
	!MOV	193, 194
	mov	 %l1, %l3	 
	!STOREAI	194, 198, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S50
	ba	 .S50	 	!then: jump to #end-if '.S50'
	nop
 .S50:
	!JUMPI	.S47
	ba	 .S47	 	!if: jump to #end-if '.S47'
	nop
 .S49:
 !#if-guard:
	!LOADI	7, 202
	set	 7, %l1	 	!int: reg 202 gets val 7
	!MOV	89, 201
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 201
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 200
	mov	 %g0, %l5	 
	!COMP	201, 202, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 201 (var null) to 202 (var null), store in cc-reg
	!MOVEQ	2, 3, 200
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	200, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 200) to true
	!CBREQ	2, .S51, .S52
	be	 .S51	 	!if: branch true: '.S51' false: '.S52'
	nop
	ba	.S52 	!if: branch true: '.S51' false: '.S52'
	nop
 .S51:
	!LOADI	1, 206
	set	 1, %l0	 	!int: reg 206 gets val 1
	!MOV	92, 207
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 207
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	207, 3, 205
	ld	[%l1 + %g1], %l1
	!ADD	205, 206, 203
	add	 %l1, %l0, %l1	 	!expression: reg 205 (var null) + 206 in reg 203 (var null)
	!MOV	92, 208
	mov	 %l4, %l0	 
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	208, 3, 204
	ld	[%l0 + %g1], %l3
	!MOV	203, 204
	mov	 %l1, %l3	 
	!STOREAI	204, 208, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S53
	ba	 .S53	 	!then: jump to #end-if '.S53'
	nop
 .S53:
	!JUMPI	.S50
	ba	 .S50	 	!if: jump to #end-if '.S50'
	nop
 .S52:
 !#if-guard:
	!LOADI	8, 212
	set	 8, %l1	 	!int: reg 212 gets val 8
	!MOV	89, 211
	mov	 %l2, %l3	 	!id: move reg 89 (var maincurrent) to reg 211
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 210
	mov	 %g0, %l0	 
	!COMP	211, 212, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 211 (var null) to 212 (var null), store in cc-reg
	!MOVEQ	2, 3, 210
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	210, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 210) to true
	!CBREQ	2, .S54, .S55
	be	 .S54	 	!if: branch true: '.S54' false: '.S55'
	nop
	ba	.S55 	!if: branch true: '.S54' false: '.S55'
	nop
 .S54:
	!LOADI	1, 216
	set	 1, %l0	 	!int: reg 216 gets val 1
	!MOV	92, 217
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 217
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	217, 3, 215
	ld	[%l1 + %g1], %l1
	!ADD	215, 216, 213
	add	 %l1, %l0, %l1	 	!expression: reg 215 (var null) + 216 in reg 213 (var null)
	!MOV	92, 218
	mov	 %l4, %l0	 
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	218, 3, 214
	ld	[%l0 + %g1], %l3
	!MOV	213, 214
	mov	 %l1, %l3	 
	!STOREAI	214, 218, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S56
	ba	 .S56	 	!then: jump to #end-if '.S56'
	nop
 .S56:
	!JUMPI	.S53
	ba	 .S53	 	!if: jump to #end-if '.S53'
	nop
 .S55:
	!LOADI	1, 223
	set	 1, %l0	 	!int: reg 223 gets val 1
	!MOV	92, 224
	mov	 %l4, %l1	 	!id: move reg 92 (var maindigits) to reg 224
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	224, 3, 222
	ld	[%l1 + %g1], %l1
	!ADD	222, 223, 220
	add	 %l1, %l0, %l1	 	!expression: reg 222 (var null) + 223 in reg 220 (var null)
	!MOV	92, 225
	mov	 %l4, %l0	 
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	225, 3, 221
	ld	[%l0 + %g1], %l3
	!MOV	220, 221
	mov	 %l1, %l3	 
	!STOREAI	221, 225, 3
	st	%l3, [%l0 + %g1]
	!JUMPI	.S56
	ba	 .S56	 	!if: jump to #end-if '.S56'
	nop
 .S32:
	!MOV	92, 230
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 230
	!STOREOUTARGUMENT	230, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 230to register outReg 1
	!CALL	countTotal
	call	 countTotal	
	nop
	!MOV	1, 229
	mov	 %o0, %l0	 
	!PRINTLN	229
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!LOADI	1, 232
	set	 1, %l0	 	!int: reg 232 gets val 1
	!STOREOUTARGUMENT	232, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 232to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 231
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	231, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 231to register outReg 1
	!MOV	92, 233
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 233
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	233, 3, 231
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	231, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 231to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	2, 235
	set	 2, %l0	 	!int: reg 235 gets val 2
	!STOREOUTARGUMENT	235, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 235to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 234
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	234, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 234to register outReg 1
	!MOV	92, 236
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 236
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	236, 3, 234
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	234, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 234to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	3, 238
	set	 3, %l0	 	!int: reg 238 gets val 3
	!STOREOUTARGUMENT	238, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 238to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 237
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	237, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 237to register outReg 1
	!MOV	92, 239
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 239
	!LOADI	8, 3
	set	 8, %g1	 
	!LOADAI	239, 3, 237
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	237, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 237to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	4, 241
	set	 4, %l0	 	!int: reg 241 gets val 4
	!STOREOUTARGUMENT	241, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 241to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 240
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	240, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 240to register outReg 1
	!MOV	92, 242
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 242
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	242, 3, 240
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	240, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 240to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	5, 244
	set	 5, %l0	 	!int: reg 244 gets val 5
	!STOREOUTARGUMENT	244, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 244to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 243
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	243, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 243to register outReg 1
	!MOV	92, 245
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 245
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	245, 3, 243
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	243, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 243to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	6, 247
	set	 6, %l0	 	!int: reg 247 gets val 6
	!STOREOUTARGUMENT	247, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 247to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 246
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	246, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 246to register outReg 1
	!MOV	92, 248
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 248
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	248, 3, 246
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	246, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 246to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	7, 250
	set	 7, %l0	 	!int: reg 250 gets val 7
	!STOREOUTARGUMENT	250, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 250to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 249
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	249, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 249to register outReg 1
	!MOV	92, 251
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 251
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	251, 3, 249
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	249, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 249to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	8, 253
	set	 8, %l0	 	!int: reg 253 gets val 8
	!STOREOUTARGUMENT	253, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 253to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 252
	mov	 %o0, %l1	 
	!STOREOUTARGUMENT	252, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 252to register outReg 1
	!MOV	92, 254
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 254
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	254, 3, 252
	ld	[%l0 + %g1], %l1
	!STOREOUTARGUMENT	252, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 252to register outReg 2
	!CALL	printRecursive
	call	 printRecursive	
	nop
	!LOADI	9, 256
	set	 9, %l0	 	!int: reg 256 gets val 9
	!STOREOUTARGUMENT	256, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 256to register outReg 1
	!CALL	convertBinary
	call	 convertBinary	
	nop
	!MOV	1, 255
	mov	 %o0, %l0	 
	!STOREOUTARGUMENT	255, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 255to register outReg 1
	!MOV	92, 257
	mov	 %l4, %l0	 	!id: move reg 92 (var maindigits) to reg 257
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	257, 3, 255
	ld	[%l0 + %g1], %l0
	!STOREOUTARGUMENT	255, 6
	mov	 %l0, %o1	 	!argument: store out param from reg 255to register outReg 2
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
	!STOREINARGUMENT	10, 61
	mov	 %i0, %l1	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 64
	set	 0, %l2	 	!int: reg 64 gets val 0
	!MOV	61, 63
	mov	 %l1, %l3	 	!id: move reg 61 (var convertBinarynumber) to reg 63
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 62
	mov	 %g0, %l4	 
	!COMP	63, 64, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 63 (var null) to 64 (var null), store in cc-reg
	!MOVEQ	2, 3, 62
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	62, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 62) to true
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
	!LOADI	1, 67
	set	 1, %l2	 	!int: reg 67 gets val 1
	!MOV	61, 66
	mov	 %l1, %l3	 	!id: move reg 61 (var convertBinarynumber) to reg 66
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 65
	mov	 %g0, %l4	 
	!COMP	66, 67, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 66 (var null) to 67 (var null), store in cc-reg
	!MOVEQ	2, 3, 65
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	65, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 65) to true
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
	!LOADI	2, 70
	set	 2, %l2	 	!int: reg 70 gets val 2
	!MOV	61, 69
	mov	 %l1, %l3	 	!id: move reg 61 (var convertBinarynumber) to reg 69
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 68
	mov	 %g0, %l4	 
	!COMP	69, 70, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 69 (var null) to 70 (var null), store in cc-reg
	!MOVEQ	2, 3, 68
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	68, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 68) to true
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
	!LOADI	3, 73
	set	 3, %l2	 	!int: reg 73 gets val 3
	!MOV	61, 72
	mov	 %l1, %l3	 	!id: move reg 61 (var convertBinarynumber) to reg 72
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 71
	mov	 %g0, %l4	 
	!COMP	72, 73, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 72 (var null) to 73 (var null), store in cc-reg
	!MOVEQ	2, 3, 71
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	71, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 71) to true
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
	!LOADI	4, 76
	set	 4, %l2	 	!int: reg 76 gets val 4
	!MOV	61, 75
	mov	 %l1, %l3	 	!id: move reg 61 (var convertBinarynumber) to reg 75
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 74
	mov	 %g0, %l4	 
	!COMP	75, 76, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 75 (var null) to 76 (var null), store in cc-reg
	!MOVEQ	2, 3, 74
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	74, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 74) to true
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
	!LOADI	5, 79
	set	 5, %l2	 	!int: reg 79 gets val 5
	!MOV	61, 78
	mov	 %l1, %l3	 	!id: move reg 61 (var convertBinarynumber) to reg 78
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 77
	mov	 %g0, %l4	 
	!COMP	78, 79, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 78 (var null) to 79 (var null), store in cc-reg
	!MOVEQ	2, 3, 77
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	77, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 77) to true
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
	!LOADI	6, 82
	set	 6, %l2	 	!int: reg 82 gets val 6
	!MOV	61, 81
	mov	 %l1, %l3	 	!id: move reg 61 (var convertBinarynumber) to reg 81
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 80
	mov	 %g0, %l4	 
	!COMP	81, 82, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 81 (var null) to 82 (var null), store in cc-reg
	!MOVEQ	2, 3, 80
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	80, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 80) to true
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
	!LOADI	7, 85
	set	 7, %l2	 	!int: reg 85 gets val 7
	!MOV	61, 84
	mov	 %l1, %l3	 	!id: move reg 61 (var convertBinarynumber) to reg 84
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 83
	mov	 %g0, %l4	 
	!COMP	84, 85, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 84 (var null) to 85 (var null), store in cc-reg
	!MOVEQ	2, 3, 83
	move	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	83, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 83) to true
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
	!LOADI	8, 88
	set	 8, %l2	 	!int: reg 88 gets val 8
	!MOV	61, 87
	mov	 %l1, %l1	 	!id: move reg 61 (var convertBinarynumber) to reg 87
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 86
	mov	 %g0, %l0	 
	!COMP	87, 88, 2
	cmp	 %l1, %l2	 	!expression: compare: reg 87 (var null) to 88 (var null), store in cc-reg
	!MOVEQ	2, 3, 86
	move	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	86, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 86) to true
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
	!STOREINARGUMENT	10, 49
	mov	 %i0, %l2	 
	!STOREINARGUMENT	11, 50
	mov	 %i1, %l4	 
 !#function-body:
 !#if-guard:
	!LOADI	0, 53
	set	 0, %l1	 	!int: reg 53 gets val 0
	!MOV	50, 52
	mov	 %l4, %l3	 	!id: move reg 50 (var printRecursiverec) to reg 52
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 51
	mov	 %g0, %l5	 
	!COMP	52, 53, 2
	cmp	 %l3, %l1	 	!expression: compare: reg 52 (var null) to 53 (var null), store in cc-reg
	!MOVEQ	2, 3, 51
	move	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	51, 3, 2
	cmp	 %l5, %g1	 	!if: compare guard result (reg 51) to true
	!CBREQ	2, .S0, .S1
	be	 .S0	 	!if: branch true: '.S0' false: '.S1'
	nop
	ba	.S1 	!if: branch true: '.S0' false: '.S1'
	nop
 .S0:
	!MOV	49, 4
	mov	 %l2, %i0	 	!id: move reg 49 (var printRecursivenum) to reg 4
	!RET	
	ret
	restore
	!JUMPI	.S2
	ba	 .S2	 	!then: jump to #end-if '.S2'
	nop
 .S2:
 .S1:
	!MOV	49, 54
	mov	 %l2, %l1	 	!id: move reg 49 (var printRecursivenum) to reg 54
	!PRINTLN	54
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!LOADI	1, 58
	set	 1, %l1	 	!int: reg 58 gets val 1
	!MOV	50, 57
	mov	 %l4, %l3	 	!id: move reg 50 (var printRecursiverec) to reg 57
	!SUB	57, 58, 55
	sub	 %l3, %l1, %l1	 	!expression: reg 57 (var null) - 58 in reg 55 (var null)
	!MOV	50, 56
	mov	 %l4, %l3	 	!lvalue id: move reg 50 (var rec) to reg 56
	!MOV	55, 56
	mov	 %l1, %l3	 
	!MOV	56, 50
	mov	 %l3, %l4	 
	!MOV	49, 60
	mov	 %l2, %l1	 	!id: move reg 49 (var printRecursivenum) to reg 60
	!STOREOUTARGUMENT	60, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 60to register outReg 1
	!MOV	50, 60
	mov	 %l4, %l1	 	!id: move reg 50 (var printRecursiverec) to reg 60
	!STOREOUTARGUMENT	60, 6
	mov	 %l1, %o1	 	!argument: store out param from reg 60to register outReg 2
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
	!MOV	17, 19
	mov	 %l2, %l2	 	!lvalue id: move reg 17 (var total) to reg 19
	!MOV	18, 19
	mov	 %l1, %l2	 
	!MOV	19, 17
	mov	 %l2, %l2	 
	!MOV	16, 47
	mov	 %l0, %l1	 	!id: move reg 16 (var countTotalwhat) to reg 47
	!LOADI	32, 3
	set	 32, %g1	 
	!LOADAI	47, 3, 24
	ld	[%l1 + %g1], %l1
	!MOV	16, 46
	mov	 %l0, %l3	 	!id: move reg 16 (var countTotalwhat) to reg 46
	!LOADI	28, 3
	set	 28, %g1	 
	!LOADAI	46, 3, 26
	ld	[%l3 + %g1], %l3
	!MOV	16, 45
	mov	 %l0, %l4	 	!id: move reg 16 (var countTotalwhat) to reg 45
	!LOADI	24, 3
	set	 24, %g1	 
	!LOADAI	45, 3, 28
	ld	[%l4 + %g1], %l4
	!MOV	16, 44
	mov	 %l0, %l5	 	!id: move reg 16 (var countTotalwhat) to reg 44
	!LOADI	20, 3
	set	 20, %g1	 
	!LOADAI	44, 3, 30
	ld	[%l5 + %g1], %l5
	!MOV	16, 43
	mov	 %l0, %l6	 	!id: move reg 16 (var countTotalwhat) to reg 43
	!LOADI	16, 3
	set	 16, %g1	 
	!LOADAI	43, 3, 32
	ld	[%l6 + %g1], %l6
	!MOV	16, 42
	mov	 %l0, %l7	 	!id: move reg 16 (var countTotalwhat) to reg 42
	!LOADI	12, 3
	set	 12, %g1	 
	!LOADAI	42, 3, 34
	ld	[%l7 + %g1], %l7
	!STOREAI	999, 999, 16
	st	%l1, [%sp + null]
	!MOV	16, 41
	mov	 %l0, %l1	 	!id: move reg 16 (var countTotalwhat) to reg 41
	!STOREAI	999, 999, 128
	st	%l1, [%sp + null]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l1
	!LOADI	8, 3
	set	 8, %g1	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + null]
	!STOREAI	999, 999, 24
	st	%l1, [%sp + null]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l1
	!LOADAI	41, 3, 36
	ld	[%l1 + %g1], %l0
	!STOREAI	999, 999, 144
	st	%l0, [%sp + null]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 128
	st	%l1, [%sp + null]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l1
	!MOV	16, 40
	mov	 %l0, %g3	 	!id: move reg 16 (var countTotalwhat) to reg 40
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	40, 3, 38
	ld	[%g3 + %g1], %g3
	!MOV	16, 39
	mov	 %l0, %l0	 	!id: move reg 16 (var countTotalwhat) to reg 39
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	39, 3, 37
	ld	[%l0 + %g1], %l0
	!ADD	37, 38, 35
	add	 %l0, %g3, %l0	 	!expression: reg 37 (var null) + 38 in reg 35 (var null)
	!STOREAI	999, 999, 40
	st	%l1, [%sp + null]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l1
	!ADD	35, 36, 33
	add	 %l0, %l1, %l0	 	!expression: reg 35 (var null) + 36 in reg 33 (var null)
	!STOREAI	999, 999, 144
	st	%l1, [%sp + null]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l1
	!ADD	33, 34, 31
	add	 %l0, %l7, %l0	 	!expression: reg 33 (var null) + 34 in reg 31 (var null)
	!ADD	31, 32, 29
	add	 %l0, %l6, %l0	 	!expression: reg 31 (var null) + 32 in reg 29 (var null)
	!ADD	29, 30, 27
	add	 %l0, %l5, %l0	 	!expression: reg 29 (var null) + 30 in reg 27 (var null)
	!ADD	27, 28, 25
	add	 %l0, %l4, %l0	 	!expression: reg 27 (var null) + 28 in reg 25 (var null)
	!ADD	25, 26, 23
	add	 %l0, %l3, %l0	 	!expression: reg 25 (var null) + 26 in reg 23 (var null)
	!ADD	23, 24, 21
	add	 %l0, %l1, %l1	 	!expression: reg 23 (var null) + 24 in reg 21 (var null)
	!MOV	17, 22
	mov	 %l2, %l0	 	!lvalue id: move reg 17 (var total) to reg 22
	!MOV	21, 22
	mov	 %l1, %l0	 
	!MOV	22, 17
	mov	 %l0, %l2	 
	!MOV	17, 4
	mov	 %l2, %i0	 	!id: move reg 17 (var countTotaltotal) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 