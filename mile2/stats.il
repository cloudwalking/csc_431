!#function-entry:
main:
	SAVE 	
 !#function-body:
	MOV %l3, %l3	
	READ %l3	
	MOV %l3, %l3	
	MOV %l1, %l1	
	READ %l1	
	MOV %l1, %l1	
	MOV %l3, %l3	
	STOREOUTARGUMENT %l3, %o0	
	MOV %l1, %l3	
	STOREOUTARGUMENT %l3, %o1	
	CALL getRands	
	MOV %o0, %l1	
	MOV %l2, %l2	
	MOV %l1, %l2	
	MOV %l2, %l2	
	MOV %l2, %l1	
	STOREOUTARGUMENT %l1, %o0	
	CALL calcMean	
	MOV %o0, %l1	
	MOV %l0, %l0	
	MOV %l1, %l0	
	MOV %l0, %l0	
	MOV %l0, %l0	
	PRINTLN %l0	
	MOV %l2, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL range	
	MOV %l2, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL approxSqrtAll	
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
range:
	SAVE 	
	STOREINARGUMENT %i0, %l3	
 !#function-body:
	LOADI 0, %l1	
	MOV %l6, %l4	
	MOV %l1, %l4	
	MOV %l4, %l6	
	LOADI 0, %l1	
	MOV %l5, %l4	
	MOV %l1, %l4	
	MOV %l4, %l5	
	LOADI 1, %l1	
	MOV %l2, %l2	
	MOV %l1, %l2	
	MOV %l2, %l2	
 !#while-guard:
.S15:
	MOV %g0, %l1	
	MOV %l3, %l4	
	LOADI 1, %g1	
	MOV %g0, %l7	
	COMP %l4, %l1, %icc	
	MOVNE %icc, %g1, %l7	
	LOADI 1, %g1	
	COMP %l7, %g1, %icc	
	CBREQ %icc, .S16, .S17	
 .S16:
 !#if-guard:
	MOV %l2, %l1	
	LOADI 1, %g1	
	COMP %l1, %g1, %icc	
	CBREQ %icc, .S18, .S19	
 .S18:
	MOV %l3, %l1	
	LOADI 0, %g1	
	LOADAI %l1, %g1, %l1	
	MOV %l6, %l4	
	MOV %l1, %l4	
	MOV %l4, %l6	
	MOV %l3, %l1	
	LOADI 0, %g1	
	LOADAI %l1, %g1, %l1	
	MOV %l5, %l4	
	MOV %l1, %l4	
	MOV %l4, %l5	
	MOV %g0, %l0	
	MOV %l2, %l1	
	MOV %l0, %l1	
	MOV %l1, %l2	
	JUMPI .S20	
 .S20:
	MOV %l3, %l0	
	LOADI 4, %g1	
	LOADAI %l0, %g1, %l1	
	MOV %l3, %l0	
	MOV %l1, %l0	
	MOV %l0, %l3	
	JUMPI .S15	
 .S19:
 !#if-guard:
	MOV %l6, %l1	
	MOV %l3, %l2	
	LOADI 0, %g1	
	LOADAI %l2, %g1, %l2	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l2, %l1, %icc	
	MOVLT %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S21, .S22	
 .S21:
	MOV %l3, %l0	
	LOADI 0, %g1	
	LOADAI %l0, %g1, %l0	
	MOV %l6, %l1	
	MOV %l0, %l1	
	MOV %l1, %l6	
	JUMPI .S23	
 .S23:
	JUMPI .S20	
 .S22:
 !#if-guard:
	MOV %l5, %l1	
	MOV %l3, %l2	
	LOADI 0, %g1	
	LOADAI %l2, %g1, %l2	
	LOADI 1, %g1	
	MOV %g0, %l0	
	COMP %l2, %l1, %icc	
	MOVGT %icc, %g1, %l0	
	LOADI 1, %g1	
	COMP %l0, %g1, %icc	
	CBREQ %icc, .S24, .S25	
 .S24:
	MOV %l3, %l0	
	LOADI 0, %g1	
	LOADAI %l0, %g1, %l0	
	MOV %l5, %l1	
	MOV %l0, %l1	
	MOV %l1, %l5	
	JUMPI .S26	
 .S26:
.S25:
	JUMPI .S23	
 .S17:
	MOV %l6, %l0	
	PRINTLN %l0	
	MOV %l5, %l0	
	PRINTLN %l0	
 !#function-exit:
 !#function-entry:
approxSqrtAll:
	SAVE 	
	STOREINARGUMENT %i0, %l3	
 !#function-body:
 !#while-guard:
.S12:
	MOV %g0, %l1	
	MOV %l3, %l2	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l2, %l1, %icc	
	MOVNE %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S13, .S14	
 .S13:
	MOV %l3, %l1	
	LOADI 0, %g1	
	LOADAI %l1, %g1, %l1	
	STOREOUTARGUMENT %l1, %o0	
	CALL approxSqrt	
	MOV %o0, %l1	
	PRINTLN %l1	
	MOV %l3, %l1	
	LOADI 4, %g1	
	LOADAI %l1, %g1, %l1	
	MOV %l3, %l2	
	MOV %l1, %l2	
	MOV %l2, %l3	
	JUMPI .S12	
 .S14:
 !#function-exit:
 !#function-entry:
approxSqrt:
	SAVE 	
	STOREINARGUMENT %i0, %l1	
 !#function-body:
	LOADI 1, %l2	
	MOV %l6, %l3	
	MOV %l2, %l3	
	MOV %l3, %l6	
	MOV %l6, %l2	
	MOV %l4, %l3	
	MOV %l2, %l3	
	MOV %l3, %l4	
	LOADI 0, %l2	
	MOV %l5, %l3	
	MOV %l2, %l3	
	MOV %l3, %l5	
 !#while-guard:
.S9:
	MOV %l1, %l2	
	MOV %l5, %l3	
	LOADI 1, %g1	
	MOV %g0, %l7	
	COMP %l3, %l2, %icc	
	MOVLT %icc, %g1, %l7	
	LOADI 1, %g1	
	COMP %l7, %g1, %icc	
	CBREQ %icc, .S10, .S11	
 .S10:
	MOV %l6, %l2	
	MOV %l6, %l3	
	MULT %l3, %l2, %l2	
	MOV %l5, %l3	
	MOV %l2, %l3	
	MOV %l3, %l5	
	MOV %l6, %l2	
	MOV %l4, %l3	
	MOV %l2, %l3	
	MOV %l3, %l4	
	LOADI 1, %l2	
	MOV %l6, %l3	
	ADD %l3, %l2, %l2	
	MOV %l6, %l3	
	MOV %l2, %l3	
	MOV %l3, %l6	
	JUMPI .S9	
 .S11:
	MOV %l4, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
calcMean:
	SAVE 	
	STOREINARGUMENT %i0, %l6	
 !#function-body:
	LOADI 0, %l1	
	MOV %l5, %l2	
	MOV %l1, %l2	
	MOV %l2, %l5	
	LOADI 0, %l1	
	MOV %l4, %l2	
	MOV %l1, %l2	
	MOV %l2, %l4	
	LOADI 0, %l1	
	MOV %l3, %l2	
	MOV %l1, %l2	
	MOV %l2, %l3	
 !#while-guard:
.S3:
	MOV %g0, %l1	
	MOV %l6, %l2	
	LOADI 1, %g1	
	MOV %g0, %l7	
	COMP %l2, %l1, %icc	
	MOVNE %icc, %g1, %l7	
	LOADI 1, %g1	
	COMP %l7, %g1, %icc	
	CBREQ %icc, .S4, .S5	
 .S4:
	LOADI 1, %l1	
	MOV %l4, %l2	
	ADD %l2, %l1, %l1	
	MOV %l4, %l2	
	MOV %l1, %l2	
	MOV %l2, %l4	
	MOV %l6, %l1	
	LOADI 0, %g1	
	LOADAI %l1, %g1, %l1	
	MOV %l5, %l2	
	ADD %l2, %l1, %l1	
	MOV %l5, %l2	
	MOV %l1, %l2	
	MOV %l2, %l5	
	MOV %l6, %l1	
	LOADI 4, %g1	
	LOADAI %l1, %g1, %l1	
	MOV %l6, %l2	
	MOV %l1, %l2	
	MOV %l2, %l6	
	JUMPI .S3	
 .S5:
 !#if-guard:
	LOADI 0, %l1	
	MOV %l4, %l2	
	LOADI 1, %g1	
	MOV %g0, %l0	
	COMP %l2, %l1, %icc	
	MOVNE %icc, %g1, %l0	
	LOADI 1, %g1	
	COMP %l0, %g1, %icc	
	CBREQ %icc, .S6, .S7	
 .S6:
	MOV %l4, %l0	
	MOV %l5, %l1	
	DIV %l1, %l0, %l1	
	MOV %l3, %l0	
	MOV %l1, %l0	
	MOV %l0, %l3	
	JUMPI .S8	
 .S8:
.S7:
	MOV %l3, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
getRands:
	SAVE 	
	STOREINARGUMENT %i0, %l2	
	STOREINARGUMENT %i1, 21	
 !#function-body:
	MOV %l2, %l3	
	MOV %l2, %l4	
	MULT %l4, %l3, %l3	
	MOV 22, %l4	
	MOV %l3, %l4	
	MOV %l4, 22	
	LOADI 8, %o0	
	NEW 	
	MOV %o0, %l3	
	MOV %g2, %l4	
	MOV %l3, %l4	
	MOV %l4, %g2	
	MOV 22, %l3	
	MOV %g2, %l4	
	LOADI 0, %g1	
	LOADAI %l4, %g1, 35	
	MOV %l3, 35	
	STOREAI 35, %l4, %g1	
	MOV %g0, %l3	
	MOV %g2, %l4	
	LOADI 4, %g1	
	LOADAI %l4, %g1, 39	
	MOV %l3, 39	
	STOREAI 39, %l4, %g1	
	LOADI 1, %l3	
	MOV 21, %l4	
	SUB %l4, %l3, %l3	
	MOV 21, %l4	
	MOV %l3, %l4	
	MOV %l4, 21	
	MOV 22, %l3	
	MOV 23, %l4	
	MOV %l3, %l4	
	MOV %l4, 23	
 !#while-guard:
.S0:
	LOADI 0, %l3	
	MOV 21, %l4	
	LOADI 1, %g1	
	MOV %g0, 50	
	COMP %l4, %l3, %icc	
	MOVGT %icc, %g1, 50	
	LOADI 1, %g1	
	COMP 50, %g1, %icc	
	CBREQ %icc, .S1, .S2	
 .S1:
	LOADI 1, %l3	
	LOADI 2, %l4	
	MOV %l2, %l5	
	DIV %l5, %l4, %l4	
	MOV %l2, %l5	
	MOV 23, %l6	
	MOV 23, %l7	
	MULT %l7, %l6, %l6	
	DIV %l6, %l5, %l5	
	MULT %l5, %l4, %l4	
	ADD %l4, %l3, %l3	
	MOV 22, %l4	
	MOV %l3, %l4	
	MOV %l4, 22	
	LOADI 8, %o0	
	NEW 	
	MOV %o0, %l3	
	MOV %l1, %l1	
	MOV %l3, %l1	
	MOV %l1, %l1	
	MOV 22, %l3	
	MOV %l1, %l4	
	LOADI 0, %g1	
	LOADAI %l4, %g1, 70	
	MOV %l3, 70	
	STOREAI 70, %l4, %g1	
	MOV %g2, %l3	
	MOV %l1, %l4	
	LOADI 4, %g1	
	LOADAI %l4, %g1, 74	
	MOV %l3, 74	
	STOREAI 74, %l4, %g1	
	MOV %l1, %l3	
	MOV %g2, %l4	
	MOV %l3, %l4	
	MOV %l4, %g2	
	LOADI 1, %l3	
	MOV 21, %l4	
	SUB %l4, %l3, %l3	
	MOV 21, %l4	
	MOV %l3, %l4	
	MOV %l4, 21	
	MOV 22, %l3	
	MOV 23, %l4	
	MOV %l3, %l4	
	MOV %l4, 23	
	JUMPI .S0	
 .S2:
	MOV %l1, %i0	
	RET 	
 !#function-exit:
 