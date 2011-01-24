	.file	"stats.ev"
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
	!MOV	213, 217
	mov	 %l3, %l3	 	!lvalue id: move reg 213 (var seed) to reg 217
	!READ	217
	add	%sp, %g0, %l3
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l3

	!MOV	217, 213
	mov	 %l3, %l3	 
	!MOV	214, 219
	mov	 %l1, %l1	 	!lvalue id: move reg 214 (var num) to reg 219
	!READ	219
	add	%sp, %g0, %l1
	nop
	sethi	%hi(.EV1LRD), %g1
	or	%g1, %lo(.EV1LRD), %o0
	set readplz, %o1 
	call	scanf, 0
	nop
	ld [%o1], %l1

	!MOV	219, 214
	mov	 %l1, %l1	 
	!MOV	213, 223
	mov	 %l3, %l3	 	!id: move reg 213 (var mainseed) to reg 223
	!STOREOUTARGUMENT	223, 5
	mov	 %l3, %o0	 	!argument: store out param from reg 223to register outReg 1
	!MOV	214, 223
	mov	 %l1, %l3	 	!id: move reg 214 (var mainnum) to reg 223
	!STOREOUTARGUMENT	223, 6
	mov	 %l3, %o1	 	!argument: store out param from reg 223to register outReg 2
	!CALL	getRands
	call	 getRands	
	nop
	!MOV	1, 221
	mov	 %o0, %l1	 
	!MOV	216, 222
	mov	 %l2, %l2	 	!lvalue id: move reg 216 (var nums) to reg 222
	!MOV	221, 222
	mov	 %l1, %l2	 
	!MOV	222, 216
	mov	 %l2, %l2	 
	!MOV	216, 227
	mov	 %l2, %l1	 	!id: move reg 216 (var mainnums) to reg 227
	!STOREOUTARGUMENT	227, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 227to register outReg 1
	!CALL	calcMean
	call	 calcMean	
	nop
	!MOV	1, 225
	mov	 %o0, %l1	 
	!MOV	215, 226
	mov	 %l0, %l0	 	!lvalue id: move reg 215 (var mean) to reg 226
	!MOV	225, 226
	mov	 %l1, %l0	 
	!MOV	226, 215
	mov	 %l0, %l0	 
	!MOV	215, 229
	mov	 %l0, %l0	 	!id: move reg 215 (var mainmean) to reg 229
	!PRINTLN	229
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!MOV	216, 230
	mov	 %l2, %l0	 	!id: move reg 216 (var mainnums) to reg 230
	!STOREOUTARGUMENT	230, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 230to register outReg 1
	!CALL	range
	call	 range	
	nop
	!MOV	216, 231
	mov	 %l2, %l0	 	!id: move reg 216 (var mainnums) to reg 231
	!STOREOUTARGUMENT	231, 5
	mov	 %l0, %o0	 	!argument: store out param from reg 231to register outReg 1
	!CALL	approxSqrtAll
	call	 approxSqrtAll	
	nop
	!LOADI	0, 4
	set	 0, %i0	 	!int: reg 4 gets val 0
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	range
	.type	range, #function
	.proc	04
!#function-entry:
range:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 163
	mov	 %i0, %l3	 
 !#function-body:
	!LOADI	0, 167
	set	 0, %l1	 	!int: reg 167 gets val 0
	!MOV	164, 168
	mov	 %l6, %l4	 	!lvalue id: move reg 164 (var min) to reg 168
	!MOV	167, 168
	mov	 %l1, %l4	 
	!MOV	168, 164
	mov	 %l4, %l6	 
	!LOADI	0, 170
	set	 0, %l1	 	!int: reg 170 gets val 0
	!MOV	165, 171
	mov	 %l5, %l4	 	!lvalue id: move reg 165 (var max) to reg 171
	!MOV	170, 171
	mov	 %l1, %l4	 
	!MOV	171, 165
	mov	 %l4, %l5	 
	!LOADI	1, 173
	set	 1, %l1	 	!bool: reg 173 gets true
	!MOV	166, 174
	mov	 %l2, %l2	 	!lvalue id: move reg 166 (var first) to reg 174
	!MOV	173, 174
	mov	 %l1, %l2	 
	!MOV	174, 166
	mov	 %l2, %l2	 
 !#while-guard:
.S15:
	!MOV	0, 178
	mov	 %g0, %l1	 	!null: reg 178 gets false
	!MOV	163, 177
	mov	 %l3, %l4	 	!id: move reg 163 (var rangenums) to reg 177
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 176
	mov	 %g0, %l7	 
	!COMP	177, 178, 2
	cmp	 %l4, %l1	 	!expression: compare: reg 177 (var null) to 178 (var null), store in cc-reg
	!MOVNE	2, 3, 176
	movne	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	176, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 176) to true
	!CBREQ	2, .S16, .S17
	be	 .S16	 	!while: branch true: '.S16' false: '.S17'
	nop
	ba	.S17 	!while: branch true: '.S16' false: '.S17'
	nop
 .S16:
 !#if-guard:
	!MOV	166, 179
	mov	 %l2, %l1	 	!id: move reg 166 (var rangefirst) to reg 179
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	179, 3, 2
	cmp	 %l1, %g1	 	!if: compare guard result (reg 179) to true
	!CBREQ	2, .S18, .S19
	be	 .S18	 	!if: branch true: '.S18' false: '.S19'
	nop
	ba	.S19 	!if: branch true: '.S18' false: '.S19'
	nop
 .S18:
	!MOV	163, 182
	mov	 %l3, %l1	 	!id: move reg 163 (var rangenums) to reg 182
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	182, 3, 180
	ld	[%l1 + %g1], %l1
	!MOV	164, 181
	mov	 %l6, %l4	 	!lvalue id: move reg 164 (var min) to reg 181
	!MOV	180, 181
	mov	 %l1, %l4	 
	!MOV	181, 164
	mov	 %l4, %l6	 
	!MOV	163, 186
	mov	 %l3, %l1	 	!id: move reg 163 (var rangenums) to reg 186
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	186, 3, 184
	ld	[%l1 + %g1], %l1
	!MOV	165, 185
	mov	 %l5, %l4	 	!lvalue id: move reg 165 (var max) to reg 185
	!MOV	184, 185
	mov	 %l1, %l4	 
	!MOV	185, 165
	mov	 %l4, %l5	 
	!MOV	0, 188
	mov	 %g0, %l0	 	!bool: reg 188 gets false
	!MOV	166, 189
	mov	 %l2, %l1	 	!lvalue id: move reg 166 (var first) to reg 189
	!MOV	188, 189
	mov	 %l0, %l1	 
	!MOV	189, 166
	mov	 %l1, %l2	 
	!JUMPI	.S20
	ba	 .S20	 	!then: jump to #end-if '.S20'
	nop
 .S20:
	!MOV	163, 209
	mov	 %l3, %l0	 	!id: move reg 163 (var rangenums) to reg 209
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	209, 3, 207
	ld	[%l0 + %g1], %l1
	!MOV	163, 208
	mov	 %l3, %l0	 	!lvalue id: move reg 163 (var nums) to reg 208
	!MOV	207, 208
	mov	 %l1, %l0	 
	!MOV	208, 163
	mov	 %l0, %l3	 
	!JUMPI	.S15
	ba	 .S15	 	!while: jump back to guard
	nop
 .S19:
 !#if-guard:
	!MOV	164, 193
	mov	 %l6, %l1	 	!id: move reg 164 (var rangemin) to reg 193
	!MOV	163, 194
	mov	 %l3, %l2	 	!id: move reg 163 (var rangenums) to reg 194
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	194, 3, 192
	ld	[%l2 + %g1], %l2
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 191
	mov	 %g0, %l4	 
	!COMP	192, 193, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 192 (var null) to 193 (var null), store in cc-reg
	!MOVLT	2, 3, 191
	movl	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	191, 3, 2
	cmp	 %l4, %g1	 	!if: compare guard result (reg 191) to true
	!CBREQ	2, .S21, .S22
	be	 .S21	 	!if: branch true: '.S21' false: '.S22'
	nop
	ba	.S22 	!if: branch true: '.S21' false: '.S22'
	nop
 .S21:
	!MOV	163, 197
	mov	 %l3, %l0	 	!id: move reg 163 (var rangenums) to reg 197
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	197, 3, 195
	ld	[%l0 + %g1], %l0
	!MOV	164, 196
	mov	 %l6, %l1	 	!lvalue id: move reg 164 (var min) to reg 196
	!MOV	195, 196
	mov	 %l0, %l1	 
	!MOV	196, 164
	mov	 %l1, %l6	 
	!JUMPI	.S23
	ba	 .S23	 	!then: jump to #end-if '.S23'
	nop
 .S23:
	!JUMPI	.S20
	ba	 .S20	 	!if: jump to #end-if '.S20'
	nop
 .S22:
 !#if-guard:
	!MOV	165, 201
	mov	 %l5, %l1	 	!id: move reg 165 (var rangemax) to reg 201
	!MOV	163, 202
	mov	 %l3, %l2	 	!id: move reg 163 (var rangenums) to reg 202
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	202, 3, 200
	ld	[%l2 + %g1], %l2
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 199
	mov	 %g0, %l0	 
	!COMP	200, 201, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 200 (var null) to 201 (var null), store in cc-reg
	!MOVGT	2, 3, 199
	movg	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	199, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 199) to true
	!CBREQ	2, .S24, .S25
	be	 .S24	 	!if: branch true: '.S24' false: '.S25'
	nop
	ba	.S25 	!if: branch true: '.S24' false: '.S25'
	nop
 .S24:
	!MOV	163, 205
	mov	 %l3, %l0	 	!id: move reg 163 (var rangenums) to reg 205
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	205, 3, 203
	ld	[%l0 + %g1], %l0
	!MOV	165, 204
	mov	 %l5, %l1	 	!lvalue id: move reg 165 (var max) to reg 204
	!MOV	203, 204
	mov	 %l0, %l1	 
	!MOV	204, 165
	mov	 %l1, %l5	 
	!JUMPI	.S26
	ba	 .S26	 	!then: jump to #end-if '.S26'
	nop
 .S26:
.S25:
	!JUMPI	.S23
	ba	 .S23	 	!if: jump to #end-if '.S23'
	nop
 .S17:
	!MOV	164, 211
	mov	 %l6, %l0	 	!id: move reg 164 (var rangemin) to reg 211
	!PRINTLN	211
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
	!MOV	165, 212
	mov	 %l5, %l0	 	!id: move reg 165 (var rangemax) to reg 212
	!PRINTLN	212
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l0, %o1
	call	printf, 0
	nop
 !#function-exit:
 	.section	".text"
	.align	4
	.global	approxSqrtAll
	.type	approxSqrtAll, #function
	.proc	04
!#function-entry:
approxSqrtAll:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 152
	mov	 %i0, %l3	 
 !#function-body:
 !#while-guard:
.S12:
	!MOV	0, 155
	mov	 %g0, %l1	 	!null: reg 155 gets false
	!MOV	152, 154
	mov	 %l3, %l2	 	!id: move reg 152 (var approxSqrtAllnums) to reg 154
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 153
	mov	 %g0, %l4	 
	!COMP	154, 155, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 154 (var null) to 155 (var null), store in cc-reg
	!MOVNE	2, 3, 153
	movne	 %icc, %g1, %l4	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	153, 3, 2
	cmp	 %l4, %g1	 	!while: compare guard result (reg 153) to true
	!CBREQ	2, .S13, .S14
	be	 .S13	 	!while: branch true: '.S13' false: '.S14'
	nop
	ba	.S14 	!while: branch true: '.S13' false: '.S14'
	nop
 .S13:
	!MOV	152, 158
	mov	 %l3, %l1	 	!id: move reg 152 (var approxSqrtAllnums) to reg 158
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	158, 3, 157
	ld	[%l1 + %g1], %l1
	!STOREOUTARGUMENT	157, 5
	mov	 %l1, %o0	 	!argument: store out param from reg 157to register outReg 1
	!CALL	approxSqrt
	call	 approxSqrt	
	nop
	!MOV	1, 156
	mov	 %o0, %l1	 
	!PRINTLN	156
	sethi	%hi(.EV1LPRL), %g1
	or	%g1, %lo(.EV1LPRL), %o0
	mov	%l1, %o1
	call	printf, 0
	nop
	!MOV	152, 161
	mov	 %l3, %l1	 	!id: move reg 152 (var approxSqrtAllnums) to reg 161
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	161, 3, 159
	ld	[%l1 + %g1], %l1
	!MOV	152, 160
	mov	 %l3, %l2	 	!lvalue id: move reg 152 (var nums) to reg 160
	!MOV	159, 160
	mov	 %l1, %l2	 
	!MOV	160, 152
	mov	 %l2, %l3	 
	!JUMPI	.S12
	ba	 .S12	 	!while: jump back to guard
	nop
 .S14:
 !#function-exit:
 	.section	".text"
	.align	4
	.global	approxSqrt
	.type	approxSqrt, #function
	.proc	04
!#function-entry:
approxSqrt:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 123
	mov	 %i0, %l1	 
 !#function-body:
	!LOADI	1, 127
	set	 1, %l2	 	!int: reg 127 gets val 1
	!MOV	124, 128
	mov	 %l6, %l3	 	!lvalue id: move reg 124 (var guess) to reg 128
	!MOV	127, 128
	mov	 %l2, %l3	 
	!MOV	128, 124
	mov	 %l3, %l6	 
	!MOV	124, 130
	mov	 %l6, %l2	 	!id: move reg 124 (var approxSqrtguess) to reg 130
	!MOV	126, 131
	mov	 %l4, %l3	 	!lvalue id: move reg 126 (var prev) to reg 131
	!MOV	130, 131
	mov	 %l2, %l3	 
	!MOV	131, 126
	mov	 %l3, %l4	 
	!LOADI	0, 133
	set	 0, %l2	 	!int: reg 133 gets val 0
	!MOV	125, 134
	mov	 %l5, %l3	 	!lvalue id: move reg 125 (var result) to reg 134
	!MOV	133, 134
	mov	 %l2, %l3	 
	!MOV	134, 125
	mov	 %l3, %l5	 
 !#while-guard:
.S9:
	!MOV	123, 138
	mov	 %l1, %l2	 	!id: move reg 123 (var approxSqrtnum) to reg 138
	!MOV	125, 137
	mov	 %l5, %l3	 	!id: move reg 125 (var approxSqrtresult) to reg 137
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 136
	mov	 %g0, %l7	 
	!COMP	137, 138, 2
	cmp	 %l3, %l2	 	!expression: compare: reg 137 (var null) to 138 (var null), store in cc-reg
	!MOVLT	2, 3, 136
	movl	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	136, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 136) to true
	!CBREQ	2, .S10, .S11
	be	 .S10	 	!while: branch true: '.S10' false: '.S11'
	nop
	ba	.S11 	!while: branch true: '.S10' false: '.S11'
	nop
 .S10:
	!MOV	124, 142
	mov	 %l6, %l2	 	!id: move reg 124 (var approxSqrtguess) to reg 142
	!MOV	124, 141
	mov	 %l6, %l3	 	!id: move reg 124 (var approxSqrtguess) to reg 141
	!MULT	141, 142, 139
	smul	 %l3, %l2, %l2	 	!expression: reg 141 (var null) * 142 in reg 139 (var null)
	!MOV	125, 140
	mov	 %l5, %l3	 	!lvalue id: move reg 125 (var result) to reg 140
	!MOV	139, 140
	mov	 %l2, %l3	 
	!MOV	140, 125
	mov	 %l3, %l5	 
	!MOV	124, 144
	mov	 %l6, %l2	 	!id: move reg 124 (var approxSqrtguess) to reg 144
	!MOV	126, 145
	mov	 %l4, %l3	 	!lvalue id: move reg 126 (var prev) to reg 145
	!MOV	144, 145
	mov	 %l2, %l3	 
	!MOV	145, 126
	mov	 %l3, %l4	 
	!LOADI	1, 150
	set	 1, %l2	 	!int: reg 150 gets val 1
	!MOV	124, 149
	mov	 %l6, %l3	 	!id: move reg 124 (var approxSqrtguess) to reg 149
	!ADD	149, 150, 147
	add	 %l3, %l2, %l2	 	!expression: reg 149 (var null) + 150 in reg 147 (var null)
	!MOV	124, 148
	mov	 %l6, %l3	 	!lvalue id: move reg 124 (var guess) to reg 148
	!MOV	147, 148
	mov	 %l2, %l3	 
	!MOV	148, 124
	mov	 %l3, %l6	 
	!JUMPI	.S9
	ba	 .S9	 	!while: jump back to guard
	nop
 .S11:
	!MOV	126, 4
	mov	 %l4, %i0	 	!id: move reg 126 (var approxSqrtprev) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	calcMean
	.type	calcMean, #function
	.proc	04
!#function-entry:
calcMean:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 84
	mov	 %i0, %l6	 
 !#function-body:
	!LOADI	0, 88
	set	 0, %l1	 	!int: reg 88 gets val 0
	!MOV	85, 89
	mov	 %l5, %l2	 	!lvalue id: move reg 85 (var sum) to reg 89
	!MOV	88, 89
	mov	 %l1, %l2	 
	!MOV	89, 85
	mov	 %l2, %l5	 
	!LOADI	0, 91
	set	 0, %l1	 	!int: reg 91 gets val 0
	!MOV	86, 92
	mov	 %l4, %l2	 	!lvalue id: move reg 86 (var num) to reg 92
	!MOV	91, 92
	mov	 %l1, %l2	 
	!MOV	92, 86
	mov	 %l2, %l4	 
	!LOADI	0, 94
	set	 0, %l1	 	!int: reg 94 gets val 0
	!MOV	87, 95
	mov	 %l3, %l2	 	!lvalue id: move reg 87 (var mean) to reg 95
	!MOV	94, 95
	mov	 %l1, %l2	 
	!MOV	95, 87
	mov	 %l2, %l3	 
 !#while-guard:
.S3:
	!MOV	0, 99
	mov	 %g0, %l1	 	!null: reg 99 gets false
	!MOV	84, 98
	mov	 %l6, %l2	 	!id: move reg 84 (var calcMeannums) to reg 98
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 97
	mov	 %g0, %l7	 
	!COMP	98, 99, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 98 (var null) to 99 (var null), store in cc-reg
	!MOVNE	2, 3, 97
	movne	 %icc, %g1, %l7	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	97, 3, 2
	cmp	 %l7, %g1	 	!while: compare guard result (reg 97) to true
	!CBREQ	2, .S4, .S5
	be	 .S4	 	!while: branch true: '.S4' false: '.S5'
	nop
	ba	.S5 	!while: branch true: '.S4' false: '.S5'
	nop
 .S4:
	!LOADI	1, 103
	set	 1, %l1	 	!int: reg 103 gets val 1
	!MOV	86, 102
	mov	 %l4, %l2	 	!id: move reg 86 (var calcMeannum) to reg 102
	!ADD	102, 103, 100
	add	 %l2, %l1, %l1	 	!expression: reg 102 (var null) + 103 in reg 100 (var null)
	!MOV	86, 101
	mov	 %l4, %l2	 	!lvalue id: move reg 86 (var num) to reg 101
	!MOV	100, 101
	mov	 %l1, %l2	 
	!MOV	101, 86
	mov	 %l2, %l4	 
	!MOV	84, 109
	mov	 %l6, %l1	 	!id: move reg 84 (var calcMeannums) to reg 109
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	109, 3, 108
	ld	[%l1 + %g1], %l1
	!MOV	85, 107
	mov	 %l5, %l2	 	!id: move reg 85 (var calcMeansum) to reg 107
	!ADD	107, 108, 105
	add	 %l2, %l1, %l1	 	!expression: reg 107 (var null) + 108 in reg 105 (var null)
	!MOV	85, 106
	mov	 %l5, %l2	 	!lvalue id: move reg 85 (var sum) to reg 106
	!MOV	105, 106
	mov	 %l1, %l2	 
	!MOV	106, 85
	mov	 %l2, %l5	 
	!MOV	84, 113
	mov	 %l6, %l1	 	!id: move reg 84 (var calcMeannums) to reg 113
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	113, 3, 111
	ld	[%l1 + %g1], %l1
	!MOV	84, 112
	mov	 %l6, %l2	 	!lvalue id: move reg 84 (var nums) to reg 112
	!MOV	111, 112
	mov	 %l1, %l2	 
	!MOV	112, 84
	mov	 %l2, %l6	 
	!JUMPI	.S3
	ba	 .S3	 	!while: jump back to guard
	nop
 .S5:
 !#if-guard:
	!LOADI	0, 117
	set	 0, %l1	 	!int: reg 117 gets val 0
	!MOV	86, 116
	mov	 %l4, %l2	 	!id: move reg 86 (var calcMeannum) to reg 116
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 115
	mov	 %g0, %l0	 
	!COMP	116, 117, 2
	cmp	 %l2, %l1	 	!expression: compare: reg 116 (var null) to 117 (var null), store in cc-reg
	!MOVNE	2, 3, 115
	movne	 %icc, %g1, %l0	 
	!LOADI	1, 3
	set	 1, %g1	 
	!COMP	115, 3, 2
	cmp	 %l0, %g1	 	!if: compare guard result (reg 115) to true
	!CBREQ	2, .S6, .S7
	be	 .S6	 	!if: branch true: '.S6' false: '.S7'
	nop
	ba	.S7 	!if: branch true: '.S6' false: '.S7'
	nop
 .S6:
	!MOV	86, 121
	mov	 %l4, %l0	 	!id: move reg 86 (var calcMeannum) to reg 121
	!MOV	85, 120
	mov	 %l5, %l1	 	!id: move reg 85 (var calcMeansum) to reg 120
	!DIV	120, 121, 118
	sdiv	 %l1, %l0, %l1	 	!expression: reg 120 (var null) / 121 in reg 118 (var null)
	!MOV	87, 119
	mov	 %l3, %l0	 	!lvalue id: move reg 87 (var mean) to reg 119
	!MOV	118, 119
	mov	 %l1, %l0	 
	!MOV	119, 87
	mov	 %l0, %l3	 
	!JUMPI	.S8
	ba	 .S8	 	!then: jump to #end-if '.S8'
	nop
 .S8:
.S7:
	!MOV	87, 4
	mov	 %l3, %i0	 	!id: move reg 87 (var calcMeanmean) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 	.section	".text"
	.align	4
	.global	getRands
	.type	getRands, #function
	.proc	04
!#function-entry:
getRands:
	!SAVE	
	save	%sp, -800, %sp 
	!STOREINARGUMENT	10, 16
	mov	 %i0, %l2	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!STOREINARGUMENT	11, 17
	mov	 %i1, %l0	 
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
 !#function-body:
	!MOV	16, 25
	mov	 %l2, %l3	 	!id: move reg 16 (var getRandsseed) to reg 25
	!MOV	16, 24
	mov	 %l2, %l4	 	!id: move reg 16 (var getRandsseed) to reg 24
	!MULT	24, 25, 22
	smul	 %l4, %l3, %l3	 	!expression: reg 24 (var null) * 25 in reg 22 (var null)
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	18, 23
	mov	 %l0, %l4	 	!lvalue id: move reg 18 (var cur) to reg 23
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!MOV	22, 23
	mov	 %l3, %l4	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	23, 18
	mov	 %l4, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 27
	mov	 %o0, %l3	 
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	21, 28
	mov	 %l0, %l4	 	!lvalue id: move reg 21 (var prevNode) to reg 28
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!MOV	27, 28
	mov	 %l3, %l4	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	28, 21
	mov	 %l4, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 56
	st	%l0, [%sp + 56]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	18, 30
	mov	 %l0, %l3	 	!id: move reg 18 (var getRandscur) to reg 30
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 56, 999
	ld	[%sp + 56], %l0
	!STOREAI	999, 999, 72
	st	%l0, [%sp + 72]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	21, 32
	mov	 %l0, %l4	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 72, 999
	ld	[%sp + 72], %l0
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	32, 3, 31
	ld	[%l4 + %g1], %l5
	!MOV	30, 31
	mov	 %l3, %l5	 
	!STOREAI	31, 32, 3
	st	%l5, [%l4 + %g1]
	!MOV	0, 34
	mov	 %g0, %l3	 	!null: reg 34 gets false
	!STOREAI	999, 999, 88
	st	%l0, [%sp + 88]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	21, 36
	mov	 %l0, %l4	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 88, 999
	ld	[%sp + 88], %l0
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	36, 3, 35
	ld	[%l4 + %g1], %l5
	!MOV	34, 35
	mov	 %l3, %l5	 
	!STOREAI	35, 36, 3
	st	%l5, [%l4 + %g1]
	!LOADI	1, 41
	set	 1, %l3	 	!int: reg 41 gets val 1
	!STOREAI	999, 999, 104
	st	%l0, [%sp + 104]
	!LOADAI	999, 160, 999
	ld	[%sp + 160], %l0
	!MOV	17, 40
	mov	 %l0, %l4	 	!id: move reg 17 (var getRandsnum) to reg 40
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 104, 999
	ld	[%sp + 104], %l0
	!SUB	40, 41, 38
	sub	 %l4, %l3, %l3	 	!expression: reg 40 (var null) - 41 in reg 38 (var null)
	!STOREAI	999, 999, 120
	st	%l0, [%sp + 120]
	!LOADAI	999, 160, 999
	ld	[%sp + 160], %l0
	!MOV	17, 39
	mov	 %l0, %l4	 	!lvalue id: move reg 17 (var num) to reg 39
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 120, 999
	ld	[%sp + 120], %l0
	!MOV	38, 39
	mov	 %l3, %l4	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	39, 17
	mov	 %l4, %l0	 
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 136
	st	%l0, [%sp + 136]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	18, 43
	mov	 %l0, %l3	 	!id: move reg 18 (var getRandscur) to reg 43
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 136, 999
	ld	[%sp + 136], %l0
	!MOV	19, 44
	mov	 %g3, %l4	 	!lvalue id: move reg 19 (var prev) to reg 44
	!MOV	43, 44
	mov	 %l3, %l4	 
	!MOV	44, 19
	mov	 %l4, %g3	 
 !#while-guard:
.S0:
	!LOADI	0, 48
	set	 0, %l3	 	!int: reg 48 gets val 0
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 160, 999
	ld	[%sp + 160], %l0
	!MOV	17, 47
	mov	 %l0, %l4	 	!id: move reg 17 (var getRandsnum) to reg 47
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!LOADI	1, 3
	set	 1, %g1	 
	!MOV	0, 46
	mov	 %g0, %l5	 
	!COMP	47, 48, 2
	cmp	 %l4, %l3	 	!expression: compare: reg 47 (var null) to 48 (var null), store in cc-reg
	!MOVGT	2, 3, 46
	movg	 %icc, %g1, %l5	 
	!LOADI	1, 3
	set	 1, %g1	 	!while: set immediate 1 (true)
	!COMP	46, 3, 2
	cmp	 %l5, %g1	 	!while: compare guard result (reg 46) to true
	!CBREQ	2, .S1, .S2
	be	 .S1	 	!while: branch true: '.S1' false: '.S2'
	nop
	ba	.S2 	!while: branch true: '.S1' false: '.S2'
	nop
 .S1:
	!LOADI	1, 52
	set	 1, %l3	 	!int: reg 52 gets val 1
	!LOADI	2, 60
	set	 2, %l4	 	!int: reg 60 gets val 2
	!MOV	16, 59
	mov	 %l2, %l5	 	!id: move reg 16 (var getRandsseed) to reg 59
	!DIV	59, 60, 54
	sdiv	 %l5, %l4, %l4	 	!expression: reg 59 (var null) / 60 in reg 54 (var null)
	!MOV	16, 56
	mov	 %l2, %l5	 	!id: move reg 16 (var getRandsseed) to reg 56
	!MOV	19, 58
	mov	 %g3, %l6	 	!id: move reg 19 (var getRandsprev) to reg 58
	!MOV	19, 57
	mov	 %g3, %l7	 	!id: move reg 19 (var getRandsprev) to reg 57
	!MULT	57, 58, 55
	smul	 %l7, %l6, %l6	 	!expression: reg 57 (var null) * 58 in reg 55 (var null)
	!DIV	55, 56, 53
	sdiv	 %l6, %l5, %l5	 	!expression: reg 55 (var null) / 56 in reg 53 (var null)
	!MULT	53, 54, 51
	smul	 %l5, %l4, %l4	 	!expression: reg 53 (var null) * 54 in reg 51 (var null)
	!ADD	51, 52, 49
	add	 %l4, %l3, %l3	 	!expression: reg 51 (var null) + 52 in reg 49 (var null)
	!STOREAI	999, 999, 24
	st	%l0, [%sp + 24]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	18, 50
	mov	 %l0, %l4	 	!lvalue id: move reg 18 (var cur) to reg 50
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 24, 999
	ld	[%sp + 24], %l0
	!MOV	49, 50
	mov	 %l3, %l4	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	50, 18
	mov	 %l4, %l0	 
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!LOADI	8, 1
	set	 8, %o0	 
	!NEW	
	call	malloc, 0
	nop 
	!MOV	1, 62
	mov	 %o0, %l3	 
	!MOV	20, 63
	mov	 %l1, %l1	 	!lvalue id: move reg 20 (var curNode) to reg 63
	!MOV	62, 63
	mov	 %l3, %l1	 
	!MOV	63, 20
	mov	 %l1, %l1	 
	!STOREAI	999, 999, 40
	st	%l0, [%sp + 40]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	18, 65
	mov	 %l0, %l3	 	!id: move reg 18 (var getRandscur) to reg 65
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 40, 999
	ld	[%sp + 40], %l0
	!MOV	20, 67
	mov	 %l1, %l4	 
	!LOADI	0, 3
	set	 0, %g1	 
	!LOADAI	67, 3, 66
	ld	[%l4 + %g1], %l5
	!MOV	65, 66
	mov	 %l3, %l5	 
	!STOREAI	66, 67, 3
	st	%l5, [%l4 + %g1]
	!STOREAI	999, 999, 56
	st	%l0, [%sp + 56]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	21, 69
	mov	 %l0, %l3	 	!id: move reg 21 (var getRandsprevNode) to reg 69
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 56, 999
	ld	[%sp + 56], %l0
	!MOV	20, 71
	mov	 %l1, %l4	 
	!LOADI	4, 3
	set	 4, %g1	 
	!LOADAI	71, 3, 70
	ld	[%l4 + %g1], %l5
	!MOV	69, 70
	mov	 %l3, %l5	 
	!STOREAI	70, 71, 3
	st	%l5, [%l4 + %g1]
	!MOV	20, 73
	mov	 %l1, %l3	 	!id: move reg 20 (var getRandscurNode) to reg 73
	!STOREAI	999, 999, 72
	st	%l0, [%sp + 72]
	!LOADAI	999, 128, 999
	ld	[%sp + 128], %l0
	!MOV	21, 74
	mov	 %l0, %l4	 	!lvalue id: move reg 21 (var prevNode) to reg 74
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 72, 999
	ld	[%sp + 72], %l0
	!MOV	73, 74
	mov	 %l3, %l4	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	74, 21
	mov	 %l4, %l0	 
	!STOREAI	999, 999, 128
	st	%l0, [%sp + 128]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!LOADI	1, 79
	set	 1, %l3	 	!int: reg 79 gets val 1
	!STOREAI	999, 999, 88
	st	%l0, [%sp + 88]
	!LOADAI	999, 160, 999
	ld	[%sp + 160], %l0
	!MOV	17, 78
	mov	 %l0, %l4	 	!id: move reg 17 (var getRandsnum) to reg 78
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 88, 999
	ld	[%sp + 88], %l0
	!SUB	78, 79, 76
	sub	 %l4, %l3, %l3	 	!expression: reg 78 (var null) - 79 in reg 76 (var null)
	!STOREAI	999, 999, 104
	st	%l0, [%sp + 104]
	!LOADAI	999, 160, 999
	ld	[%sp + 160], %l0
	!MOV	17, 77
	mov	 %l0, %l4	 	!lvalue id: move reg 17 (var num) to reg 77
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 104, 999
	ld	[%sp + 104], %l0
	!MOV	76, 77
	mov	 %l3, %l4	 
	!STOREAI	999, 999, 16
	st	%l0, [%sp + 16]
	!MOV	77, 17
	mov	 %l4, %l0	 
	!STOREAI	999, 999, 160
	st	%l0, [%sp + 160]
	!LOADAI	999, 16, 999
	ld	[%sp + 16], %l0
	!STOREAI	999, 999, 120
	st	%l0, [%sp + 120]
	!LOADAI	999, 144, 999
	ld	[%sp + 144], %l0
	!MOV	18, 81
	mov	 %l0, %l3	 	!id: move reg 18 (var getRandscur) to reg 81
	!STOREAI	999, 999, 144
	st	%l0, [%sp + 144]
	!LOADAI	999, 120, 999
	ld	[%sp + 120], %l0
	!MOV	19, 82
	mov	 %g3, %l4	 	!lvalue id: move reg 19 (var prev) to reg 82
	!MOV	81, 82
	mov	 %l3, %l4	 
	!MOV	82, 19
	mov	 %l4, %g3	 
	!JUMPI	.S0
	ba	 .S0	 	!while: jump back to guard
	nop
 .S2:
	!MOV	20, 4
	mov	 %l1, %i0	 	!id: move reg 20 (var getRandscurNode) to reg 4
	!RET	
	ret
	restore
 !#function-exit:
 