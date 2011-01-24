Spill list: []
block [#function-entry, main]
	SAVE[] 
block [#function-body]
	MOV[%l3, %l3] 	!lvalue id: move reg 213 (var seed) to reg 217
	READ[%l3] 	!read: read into address stored in reg 217 (var null)
	MOV[%l3, %l3] 
	MOV[%l1, %l1] 	!lvalue id: move reg 214 (var num) to reg 219
	READ[%l1] 	!read: read into address stored in reg 219 (var null)
	MOV[%l1, %l1] 
	MOV[%l3, %l3] 	!id: move reg 213 (var mainseed) to reg 223
	STOREOUTARGUMENT[%l3, %o0] 	!argument: store out param from reg 223to register outReg 1
	MOV[%l1, %l3] 	!id: move reg 214 (var mainnum) to reg 223
	STOREOUTARGUMENT[%l3, %o1] 	!argument: store out param from reg 223to register outReg 2
	CALL[getRands] 	!invocation: call function getRands
	MOV[%o0, %l1] 
	MOV[%l2, %l2] 	!lvalue id: move reg 216 (var nums) to reg 222
	MOV[%l1, %l2] 
	MOV[%l2, %l2] 
	MOV[%l2, %l1] 	!id: move reg 216 (var mainnums) to reg 227
	STOREOUTARGUMENT[%l1, %o0] 	!argument: store out param from reg 227to register outReg 1
	CALL[calcMean] 	!invocation: call function calcMean
	MOV[%o0, %l1] 
	MOV[%l0, %l0] 	!lvalue id: move reg 215 (var mean) to reg 226
	MOV[%l1, %l0] 
	MOV[%l0, %l0] 
	MOV[%l0, %l0] 	!id: move reg 215 (var mainmean) to reg 229
	PRINTLN[%l0] 	!print: print contents of reg 229 (var null)
	MOV[%l2, %l0] 	!id: move reg 216 (var mainnums) to reg 230
	STOREOUTARGUMENT[%l0, %o0] 	!argument: store out param from reg 230to register outReg 1
	CALL[range] 	!invocation: call function range
	MOV[%l2, %l0] 	!id: move reg 216 (var mainnums) to reg 231
	STOREOUTARGUMENT[%l0, %o0] 	!argument: store out param from reg 231to register outReg 1
	CALL[approxSqrtAll] 	!invocation: call function approxSqrtAll
	LOADI[0, %i0] 	!int: reg 4 gets val 0
	RET[] 
block [#function-exit]
Spill list: []
block [#function-entry, range]
	SAVE[] 
	STOREINARGUMENT[%i0, %l3] 
block [#function-body]
	LOADI[0, %l1] 	!int: reg 167 gets val 0
	MOV[%l6, %l4] 	!lvalue id: move reg 164 (var min) to reg 168
	MOV[%l1, %l4] 
	MOV[%l4, %l6] 
	LOADI[0, %l1] 	!int: reg 170 gets val 0
	MOV[%l5, %l4] 	!lvalue id: move reg 165 (var max) to reg 171
	MOV[%l1, %l4] 
	MOV[%l4, %l5] 
	LOADI[1, %l1] 	!bool: reg 173 gets true
	MOV[%l2, %l2] 	!lvalue id: move reg 166 (var first) to reg 174
	MOV[%l1, %l2] 
	MOV[%l2, %l2] 
block [#function-exit]
block [#while-guard, .S15]
	MOV[%g0, %l1] 	!null: reg 178 gets false
	MOV[%l3, %l4] 	!id: move reg 163 (var rangenums) to reg 177
	LOADI[1, %g1] 
	MOV[%g0, %l7] 
	COMP[%l4, %l1, %icc] 	!expression: compare: reg 177 (var null) to 178 (var null), store in cc-reg
	MOVNE[%icc, %g1, %l7] 
	LOADI[1, %g1] 	!while: set immediate 1 (true)
	COMP[%l7, %g1, %icc] 	!while: compare guard result (reg 176) to true
	CBREQ[%icc, .S16, .S17] 	!while: branch true: '.S16' false: '.S17'
block [.S17]
	MOV[%l6, %l0] 	!id: move reg 164 (var rangemin) to reg 211
	PRINTLN[%l0] 	!print: print contents of reg 211 (var null)
	MOV[%l5, %l0] 	!id: move reg 165 (var rangemax) to reg 212
	PRINTLN[%l0] 	!print: print contents of reg 212 (var null)
block [.S16]
block [#if-guard]
	MOV[%l2, %l1] 	!id: move reg 166 (var rangefirst) to reg 179
	LOADI[1, %g1] 
	COMP[%l1, %g1, %icc] 	!if: compare guard result (reg 179) to true
	CBREQ[%icc, .S18, .S19] 	!if: branch true: '.S18' false: '.S19'
block [.S19]
block [#if-guard]
	MOV[%l6, %l1] 	!id: move reg 164 (var rangemin) to reg 193
	MOV[%l3, %l2] 	!id: move reg 163 (var rangenums) to reg 194
	LOADI[0, %g1] 
	LOADAI[%l2, %g1, %l2] 	!dot: load from pointer 'num' (reg 194), store in reg 192
	LOADI[1, %g1] 
	MOV[%g0, %l4] 
	COMP[%l2, %l1, %icc] 	!expression: compare: reg 192 (var null) to 193 (var null), store in cc-reg
	MOVLT[%icc, %g1, %l4] 
	LOADI[1, %g1] 
	COMP[%l4, %g1, %icc] 	!if: compare guard result (reg 191) to true
	CBREQ[%icc, .S21, .S22] 	!if: branch true: '.S21' false: '.S22'
block [.S22]
block [#if-guard]
	MOV[%l5, %l1] 	!id: move reg 165 (var rangemax) to reg 201
	MOV[%l3, %l2] 	!id: move reg 163 (var rangenums) to reg 202
	LOADI[0, %g1] 
	LOADAI[%l2, %g1, %l2] 	!dot: load from pointer 'num' (reg 202), store in reg 200
	LOADI[1, %g1] 
	MOV[%g0, %l0] 
	COMP[%l2, %l1, %icc] 	!expression: compare: reg 200 (var null) to 201 (var null), store in cc-reg
	MOVGT[%icc, %g1, %l0] 
	LOADI[1, %g1] 
	COMP[%l0, %g1, %icc] 	!if: compare guard result (reg 199) to true
	CBREQ[%icc, .S24, .S25] 	!if: branch true: '.S24' false: '.S25'
block [.S24]
	MOV[%l3, %l0] 	!id: move reg 163 (var rangenums) to reg 205
	LOADI[0, %g1] 
	LOADAI[%l0, %g1, %l0] 	!dot: load from pointer 'num' (reg 205), store in reg 203
	MOV[%l5, %l1] 	!lvalue id: move reg 165 (var max) to reg 204
	MOV[%l0, %l1] 
	MOV[%l1, %l5] 
	JUMPI[.S26] 	!then: jump to #end-if '.S26'
block [.S26, .S25]
	JUMPI[.S23] 	!if: jump to #end-if '.S23'
block [.S21]
	MOV[%l3, %l0] 	!id: move reg 163 (var rangenums) to reg 197
	LOADI[0, %g1] 
	LOADAI[%l0, %g1, %l0] 	!dot: load from pointer 'num' (reg 197), store in reg 195
	MOV[%l6, %l1] 	!lvalue id: move reg 164 (var min) to reg 196
	MOV[%l0, %l1] 
	MOV[%l1, %l6] 
	JUMPI[.S23] 	!then: jump to #end-if '.S23'
block [.S23]
	JUMPI[.S20] 	!if: jump to #end-if '.S20'
block [.S18]
	MOV[%l3, %l1] 	!id: move reg 163 (var rangenums) to reg 182
	LOADI[0, %g1] 
	LOADAI[%l1, %g1, %l1] 	!dot: load from pointer 'num' (reg 182), store in reg 180
	MOV[%l6, %l4] 	!lvalue id: move reg 164 (var min) to reg 181
	MOV[%l1, %l4] 
	MOV[%l4, %l6] 
	MOV[%l3, %l1] 	!id: move reg 163 (var rangenums) to reg 186
	LOADI[0, %g1] 
	LOADAI[%l1, %g1, %l1] 	!dot: load from pointer 'num' (reg 186), store in reg 184
	MOV[%l5, %l4] 	!lvalue id: move reg 165 (var max) to reg 185
	MOV[%l1, %l4] 
	MOV[%l4, %l5] 
	MOV[%g0, %l0] 	!bool: reg 188 gets false
	MOV[%l2, %l1] 	!lvalue id: move reg 166 (var first) to reg 189
	MOV[%l0, %l1] 
	MOV[%l1, %l2] 
	JUMPI[.S20] 	!then: jump to #end-if '.S20'
block [.S20]
	MOV[%l3, %l0] 	!id: move reg 163 (var rangenums) to reg 209
	LOADI[4, %g1] 
	LOADAI[%l0, %g1, %l1] 	!dot: load from pointer 'next' (reg 209), store in reg 207
	MOV[%l3, %l0] 	!lvalue id: move reg 163 (var nums) to reg 208
	MOV[%l1, %l0] 
	MOV[%l0, %l3] 
	JUMPI[.S15] 	!while: jump back to guard
Spill list: []
block [#function-entry, approxSqrtAll]
	SAVE[] 
	STOREINARGUMENT[%i0, %l3] 
block [#function-body]
block [#function-exit]
block [#while-guard, .S12]
	MOV[%g0, %l1] 	!null: reg 155 gets false
	MOV[%l3, %l2] 	!id: move reg 152 (var approxSqrtAllnums) to reg 154
	LOADI[1, %g1] 
	MOV[%g0, %l4] 
	COMP[%l2, %l1, %icc] 	!expression: compare: reg 154 (var null) to 155 (var null), store in cc-reg
	MOVNE[%icc, %g1, %l4] 
	LOADI[1, %g1] 	!while: set immediate 1 (true)
	COMP[%l4, %g1, %icc] 	!while: compare guard result (reg 153) to true
	CBREQ[%icc, .S13, .S14] 	!while: branch true: '.S13' false: '.S14'
block [.S14]
block [.S13]
	MOV[%l3, %l1] 	!id: move reg 152 (var approxSqrtAllnums) to reg 158
	LOADI[0, %g1] 
	LOADAI[%l1, %g1, %l1] 	!dot: load from pointer 'num' (reg 158), store in reg 157
	STOREOUTARGUMENT[%l1, %o0] 	!argument: store out param from reg 157to register outReg 1
	CALL[approxSqrt] 	!invocation: call function approxSqrt
	MOV[%o0, %l1] 
	PRINTLN[%l1] 	!print: print contents of reg 156 (var null)
	MOV[%l3, %l1] 	!id: move reg 152 (var approxSqrtAllnums) to reg 161
	LOADI[4, %g1] 
	LOADAI[%l1, %g1, %l1] 	!dot: load from pointer 'next' (reg 161), store in reg 159
	MOV[%l3, %l2] 	!lvalue id: move reg 152 (var nums) to reg 160
	MOV[%l1, %l2] 
	MOV[%l2, %l3] 
	JUMPI[.S12] 	!while: jump back to guard
Spill list: []
block [#function-entry, approxSqrt]
	SAVE[] 
	STOREINARGUMENT[%i0, %l1] 
block [#function-body]
	LOADI[1, %l2] 	!int: reg 127 gets val 1
	MOV[%l6, %l3] 	!lvalue id: move reg 124 (var guess) to reg 128
	MOV[%l2, %l3] 
	MOV[%l3, %l6] 
	MOV[%l6, %l2] 	!id: move reg 124 (var approxSqrtguess) to reg 130
	MOV[%l4, %l3] 	!lvalue id: move reg 126 (var prev) to reg 131
	MOV[%l2, %l3] 
	MOV[%l3, %l4] 
	LOADI[0, %l2] 	!int: reg 133 gets val 0
	MOV[%l5, %l3] 	!lvalue id: move reg 125 (var result) to reg 134
	MOV[%l2, %l3] 
	MOV[%l3, %l5] 
block [#function-exit]
block [#while-guard, .S9]
	MOV[%l1, %l2] 	!id: move reg 123 (var approxSqrtnum) to reg 138
	MOV[%l5, %l3] 	!id: move reg 125 (var approxSqrtresult) to reg 137
	LOADI[1, %g1] 
	MOV[%g0, %l7] 
	COMP[%l3, %l2, %icc] 	!expression: compare: reg 137 (var null) to 138 (var null), store in cc-reg
	MOVLT[%icc, %g1, %l7] 
	LOADI[1, %g1] 	!while: set immediate 1 (true)
	COMP[%l7, %g1, %icc] 	!while: compare guard result (reg 136) to true
	CBREQ[%icc, .S10, .S11] 	!while: branch true: '.S10' false: '.S11'
block [.S11]
	MOV[%l4, %i0] 	!id: move reg 126 (var approxSqrtprev) to reg 4
	RET[] 
block [.S10]
	MOV[%l6, %l2] 	!id: move reg 124 (var approxSqrtguess) to reg 142
	MOV[%l6, %l3] 	!id: move reg 124 (var approxSqrtguess) to reg 141
	MULT[%l3, %l2, %l2] 	!expression: reg 141 (var null) * 142 in reg 139 (var null)
	MOV[%l5, %l3] 	!lvalue id: move reg 125 (var result) to reg 140
	MOV[%l2, %l3] 
	MOV[%l3, %l5] 
	MOV[%l6, %l2] 	!id: move reg 124 (var approxSqrtguess) to reg 144
	MOV[%l4, %l3] 	!lvalue id: move reg 126 (var prev) to reg 145
	MOV[%l2, %l3] 
	MOV[%l3, %l4] 
	LOADI[1, %l2] 	!int: reg 150 gets val 1
	MOV[%l6, %l3] 	!id: move reg 124 (var approxSqrtguess) to reg 149
	ADD[%l3, %l2, %l2] 	!expression: reg 149 (var null) + 150 in reg 147 (var null)
	MOV[%l6, %l3] 	!lvalue id: move reg 124 (var guess) to reg 148
	MOV[%l2, %l3] 
	MOV[%l3, %l6] 
	JUMPI[.S9] 	!while: jump back to guard
Spill list: []
block [#function-entry, calcMean]
	SAVE[] 
	STOREINARGUMENT[%i0, %l6] 
block [#function-body]
	LOADI[0, %l1] 	!int: reg 88 gets val 0
	MOV[%l5, %l2] 	!lvalue id: move reg 85 (var sum) to reg 89
	MOV[%l1, %l2] 
	MOV[%l2, %l5] 
	LOADI[0, %l1] 	!int: reg 91 gets val 0
	MOV[%l4, %l2] 	!lvalue id: move reg 86 (var num) to reg 92
	MOV[%l1, %l2] 
	MOV[%l2, %l4] 
	LOADI[0, %l1] 	!int: reg 94 gets val 0
	MOV[%l3, %l2] 	!lvalue id: move reg 87 (var mean) to reg 95
	MOV[%l1, %l2] 
	MOV[%l2, %l3] 
block [#function-exit]
block [#while-guard, .S3]
	MOV[%g0, %l1] 	!null: reg 99 gets false
	MOV[%l6, %l2] 	!id: move reg 84 (var calcMeannums) to reg 98
	LOADI[1, %g1] 
	MOV[%g0, %l7] 
	COMP[%l2, %l1, %icc] 	!expression: compare: reg 98 (var null) to 99 (var null), store in cc-reg
	MOVNE[%icc, %g1, %l7] 
	LOADI[1, %g1] 	!while: set immediate 1 (true)
	COMP[%l7, %g1, %icc] 	!while: compare guard result (reg 97) to true
	CBREQ[%icc, .S4, .S5] 	!while: branch true: '.S4' false: '.S5'
block [.S5]
block [#if-guard]
	LOADI[0, %l1] 	!int: reg 117 gets val 0
	MOV[%l4, %l2] 	!id: move reg 86 (var calcMeannum) to reg 116
	LOADI[1, %g1] 
	MOV[%g0, %l0] 
	COMP[%l2, %l1, %icc] 	!expression: compare: reg 116 (var null) to 117 (var null), store in cc-reg
	MOVNE[%icc, %g1, %l0] 
	LOADI[1, %g1] 
	COMP[%l0, %g1, %icc] 	!if: compare guard result (reg 115) to true
	CBREQ[%icc, .S6, .S7] 	!if: branch true: '.S6' false: '.S7'
block [.S6]
	MOV[%l4, %l0] 	!id: move reg 86 (var calcMeannum) to reg 121
	MOV[%l5, %l1] 	!id: move reg 85 (var calcMeansum) to reg 120
	DIV[%l1, %l0, %l1] 	!expression: reg 120 (var null) / 121 in reg 118 (var null)
	MOV[%l3, %l0] 	!lvalue id: move reg 87 (var mean) to reg 119
	MOV[%l1, %l0] 
	MOV[%l0, %l3] 
	JUMPI[.S8] 	!then: jump to #end-if '.S8'
block [.S8, .S7]
	MOV[%l3, %i0] 	!id: move reg 87 (var calcMeanmean) to reg 4
	RET[] 
block [.S4]
	LOADI[1, %l1] 	!int: reg 103 gets val 1
	MOV[%l4, %l2] 	!id: move reg 86 (var calcMeannum) to reg 102
	ADD[%l2, %l1, %l1] 	!expression: reg 102 (var null) + 103 in reg 100 (var null)
	MOV[%l4, %l2] 	!lvalue id: move reg 86 (var num) to reg 101
	MOV[%l1, %l2] 
	MOV[%l2, %l4] 
	MOV[%l6, %l1] 	!id: move reg 84 (var calcMeannums) to reg 109
	LOADI[0, %g1] 
	LOADAI[%l1, %g1, %l1] 	!dot: load from pointer 'num' (reg 109), store in reg 108
	MOV[%l5, %l2] 	!id: move reg 85 (var calcMeansum) to reg 107
	ADD[%l2, %l1, %l1] 	!expression: reg 107 (var null) + 108 in reg 105 (var null)
	MOV[%l5, %l2] 	!lvalue id: move reg 85 (var sum) to reg 106
	MOV[%l1, %l2] 
	MOV[%l2, %l5] 
	MOV[%l6, %l1] 	!id: move reg 84 (var calcMeannums) to reg 113
	LOADI[4, %g1] 
	LOADAI[%l1, %g1, %l1] 	!dot: load from pointer 'next' (reg 113), store in reg 111
	MOV[%l6, %l2] 	!lvalue id: move reg 84 (var nums) to reg 112
	MOV[%l1, %l2] 
	MOV[%l2, %l6] 
	JUMPI[.S3] 	!while: jump back to guard
Register 21 is causing spill
Register 18 is causing spill
Register 17 is causing spill
Spill list: [21, 18, 17]
block [#function-entry, getRands]
	SAVE[] 
	STOREINARGUMENT[%i0, %l2] 
	STOREINARGUMENT[%i1, 17] 
		spill!
spill destination register 17
	instruction: STOREINARGUMENT[%i1, 17] 
	instructi*n: STOREINARGUMENT[%i1, %l0] 
adding before:
STOREAI[%l0, %sp, 16] 
current instr:
STOREINARGUMENT[%i1, %l0] 
adding after:
STOREAI[%l0, %sp, 160] 
LOADAI[%sp, 16, %l0] 
block [#function-body]
	MOV[%l2, %l3] 	!id: move reg 16 (var getRandsseed) to reg 25
	MOV[%l2, %l4] 	!id: move reg 16 (var getRandsseed) to reg 24
	MULT[%l4, %l3, %l3] 	!expression: reg 24 (var null) * 25 in reg 22 (var null)
	MOV[18, %l4] 	!lvalue id: move reg 18 (var cur) to reg 23
		spill!
source spill reg 18
	instruction: MOV[18, %l4] 	!lvalue id: move reg 18 (var cur) to reg 23
	instructi*n: MOV[%l0, %l4] 	!lvalue id: move reg 18 (var cur) to reg 23
adding before:
STOREAI[%l0, %sp, 24] 
LOADAI[%sp, 144, %l0] 
current instr:
MOV[%l0, %l4] 	!lvalue id: move reg 18 (var cur) to reg 23
adding after:
STOREAI[%l0, %sp, 144] 
LOADAI[%sp, 24, %l0] 
	MOV[%l3, %l4] 
	MOV[%l4, 18] 
		spill!
spill destination register 18
	instruction: MOV[%l4, 18] 
	instructi*n: MOV[%l4, %l0] 
adding before:
STOREAI[%l0, %sp, 16] 
current instr:
MOV[%l4, %l0] 
adding after:
STOREAI[%l0, %sp, 144] 
LOADAI[%sp, 16, %l0] 
	LOADI[8, %o0] 
	NEW[] 
	MOV[%o0, %l3] 
	MOV[%g2, %l4] 	!lvalue id: move reg 21 (var prevNode) to reg 28
		spill!
source spill reg %g2
	instruction: MOV[%g2, %l4] 	!lvalue id: move reg 21 (var prevNode) to reg 28
	instructi*n: MOV[%l0, %l4] 	!lvalue id: move reg 21 (var prevNode) to reg 28
adding before:
STOREAI[%l0, %sp, 40] 
LOADAI[%sp, 128, %l0] 
current instr:
MOV[%l0, %l4] 	!lvalue id: move reg 21 (var prevNode) to reg 28
adding after:
STOREAI[%l0, %sp, 128] 
LOADAI[%sp, 40, %l0] 
	MOV[%l3, %l4] 
	MOV[%l4, %g2] 
		spill!
spill destination register %g2
	instruction: MOV[%l4, %g2] 
	instructi*n: MOV[%l4, %l0] 
adding before:
STOREAI[%l0, %sp, 16] 
current instr:
MOV[%l4, %l0] 
adding after:
STOREAI[%l0, %sp, 128] 
LOADAI[%sp, 16, %l0] 
	MOV[18, %l3] 	!id: move reg 18 (var getRandscur) to reg 30
		spill!
source spill reg 18
	instruction: MOV[18, %l3] 	!id: move reg 18 (var getRandscur) to reg 30
	instructi*n: MOV[%l0, %l3] 	!id: move reg 18 (var getRandscur) to reg 30
adding before:
STOREAI[%l0, %sp, 56] 
LOADAI[%sp, 144, %l0] 
current instr:
MOV[%l0, %l3] 	!id: move reg 18 (var getRandscur) to reg 30
adding after:
STOREAI[%l0, %sp, 144] 
LOADAI[%sp, 56, %l0] 
	MOV[%g2, %l4] 
		spill!
source spill reg %g2
	instruction: MOV[%g2, %l4] 
	instructi*n: MOV[%l0, %l4] 
adding before:
STOREAI[%l0, %sp, 72] 
LOADAI[%sp, 128, %l0] 
current instr:
MOV[%l0, %l4] 
adding after:
STOREAI[%l0, %sp, 128] 
LOADAI[%sp, 72, %l0] 
block [#function-exit]
block [#while-guard, .S0]
	LOADI[0, %l3] 	!int: reg 48 gets val 0
	MOV[17, %l4] 	!id: move reg 17 (var getRandsnum) to reg 47
		spill!
source spill reg 17
	instruction: MOV[17, %l4] 	!id: move reg 17 (var getRandsnum) to reg 47
	instructi*n: MOV[%l0, %l4] 	!id: move reg 17 (var getRandsnum) to reg 47
adding before:
STOREAI[%l0, %sp, 24] 
LOADAI[%sp, 160, %l0] 
current instr:
MOV[%l0, %l4] 	!id: move reg 17 (var getRandsnum) to reg 47
adding after:
STOREAI[%l0, %sp, 160] 
LOADAI[%sp, 24, %l0] 
	LOADI[1, %g1] 
	MOV[%g0, %l5] 
	COMP[%l4, %l3, %icc] 	!expression: compare: reg 47 (var null) to 48 (var null), store in cc-reg
block [.S2]
	MOV[%l1, %i0] 	!id: move reg 20 (var getRandscurNode) to reg 4
	RET[] 
block [.S1]
	LOADI[1, %l3] 	!int: reg 52 gets val 1
	LOADI[2, %l4] 	!int: reg 60 gets val 2
	MOV[%l2, %l5] 	!id: move reg 16 (var getRandsseed) to reg 59
	DIV[%l5, %l4, %l4] 	!expression: reg 59 (var null) / 60 in reg 54 (var null)
	MOV[%l2, %l5] 	!id: move reg 16 (var getRandsseed) to reg 56
	MOV[%g3, %l6] 	!id: move reg 19 (var getRandsprev) to reg 58
	MOV[%g3, %l7] 	!id: move reg 19 (var getRandsprev) to reg 57
	MULT[%l7, %l6, %l6] 	!expression: reg 57 (var null) * 58 in reg 55 (var null)
	DIV[%l6, %l5, %l5] 	!expression: reg 55 (var null) / 56 in reg 53 (var null)
	MULT[%l5, %l4, %l4] 	!expression: reg 53 (var null) * 54 in reg 51 (var null)
	ADD[%l4, %l3, %l3] 	!expression: reg 51 (var null) + 52 in reg 49 (var null)
	MOV[18, %l4] 	!lvalue id: move reg 18 (var cur) to reg 50
		spill!
source spill reg 18
	instruction: MOV[18, %l4] 	!lvalue id: move reg 18 (var cur) to reg 50
	instructi*n: MOV[%l0, %l4] 	!lvalue id: move reg 18 (var cur) to reg 50
adding before:
STOREAI[%l0, %sp, 24] 
LOADAI[%sp, 144, %l0] 
current instr:
MOV[%l0, %l4] 	!lvalue id: move reg 18 (var cur) to reg 50
adding after:
STOREAI[%l0, %sp, 144] 
LOADAI[%sp, 24, %l0] 
	MOV[%l3, %l4] 
	MOV[%l4, 18] 
		spill!
spill destination register 18
	instruction: MOV[%l4, 18] 
	instructi*n: MOV[%l4, %l0] 
adding before:
STOREAI[%l0, %sp, 16] 
current instr:
MOV[%l4, %l0] 
adding after:
STOREAI[%l0, %sp, 144] 
LOADAI[%sp, 16, %l0] 
	LOADI[8, %o0] 
	NEW[] 
	MOV[%o0, %l3] 
	MOV[%l1, %l1] 	!lvalue id: move reg 20 (var curNode) to reg 63
	MOV[%l3, %l1] 
	MOV[%l1, %l1] 
	MOV[18, %l3] 	!id: move reg 18 (var getRandscur) to reg 65
		spill!
source spill reg 18
	instruction: MOV[18, %l3] 	!id: move reg 18 (var getRandscur) to reg 65
	instructi*n: MOV[%l0, %l3] 	!id: move reg 18 (var getRandscur) to reg 65
adding before:
STOREAI[%l0, %sp, 40] 
LOADAI[%sp, 144, %l0] 
current instr:
MOV[%l0, %l3] 	!id: move reg 18 (var getRandscur) to reg 65
adding after:
STOREAI[%l0, %sp, 144] 
LOADAI[%sp, 40, %l0] 
	MOV[%l1, %l4] 
	LOADI[0, %g1] 
	LOADAI[%l4, %g1, %l5] 	!lvalue dot: load member 'num' from ptr reg 67 offset 0 to reg 66
	MOV[%l3, %l5] 
	STOREAI[%l5, %l4, %g1] 
	MOV[%g2, %l3] 	!id: move reg 21 (var getRandsprevNode) to reg 69
		spill!
source spill reg %g2
	instruction: MOV[%g2, %l3] 	!id: move reg 21 (var getRandsprevNode) to reg 69
	instructi*n: MOV[%l0, %l3] 	!id: move reg 21 (var getRandsprevNode) to reg 69
adding before:
STOREAI[%l0, %sp, 56] 
LOADAI[%sp, 128, %l0] 
current instr:
MOV[%l0, %l3] 	!id: move reg 21 (var getRandsprevNode) to reg 69
adding after:
STOREAI[%l0, %sp, 128] 
LOADAI[%sp, 56, %l0] 
	MOV[%l1, %l4] 
	LOADI[4, %g1] 
	LOADAI[%l4, %g1, %l5] 	!lvalue dot: load member 'next' from ptr reg 71 offset 4 to reg 70
	MOV[%l3, %l5] 
	STOREAI[%l5, %l4, %g1] 
ahh
