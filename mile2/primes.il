!#function-entry:
main:
	SAVE 	
 !#function-body:
	MOV %l1, %l1	
	READ %l1	
	MOV %l1, %l1	
	LOADI 0, %l3	
	MOV %l2, %l2	
	MOV %l3, %l2	
	MOV %l2, %l2	
 !#while-guard:
.S12:
	MOV %l1, %l3	
	MOV %l2, %l4	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l4, %l3, %icc	
	MOVLE %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S13, .S14	
 .S13:
 !#if-guard:
	MOV %l2, %l1	
	STOREOUTARGUMENT %l1, %o0	
	CALL prime	
	MOV %o0, %l0	
	LOADI 1, %g1	
	COMP %l0, %g1, %icc	
	CBREQ %icc, .S15, .S16	
 .S15:
	MOV %l2, %l0	
	PRINTLN %l0	
	JUMPI .S17	
 .S17:
.S16:
	LOADI 1, %l0	
	MOV %l2, %l1	
	ADD %l1, %l0, %l1	
	MOV %l2, %l0	
	MOV %l1, %l0	
	MOV %l0, %l2	
	JUMPI .S12	
 .S14:
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
prime:
	SAVE 	
	STOREINARGUMENT %i0, %l5	
 !#function-body:
 !#if-guard:
	LOADI 2, %l4	
	MOV %l5, %l6	
	LOADI 1, %g1	
	MOV %g0, %l7	
	COMP %l6, %l4, %icc	
	MOVLT %icc, %g1, %l7	
	LOADI 1, %g1	
	COMP %l7, %g1, %icc	
	CBREQ %icc, .S3, .S4	
 .S3:
	MOV %g0, %i0	
	RET 	
	JUMPI .S5	
 .S5:
 .S4:
	MOV %l5, %l4	
	STOREOUTARGUMENT %l4, %o0	
	CALL isqrt	
	MOV %o0, %l4	
	MOV %l1, %l1	
	MOV %l4, %l1	
	MOV %l1, %l1	
	LOADI 2, %l4	
	MOV %l3, %l3	
	MOV %l4, %l3	
	MOV %l3, %l3	
 !#while-guard:
.S6:
	MOV %l1, %l4	
	MOV %l3, %l6	
	LOADI 1, %g1	
	MOV %g0, %l7	
	COMP %l6, %l4, %icc	
	MOVLE %icc, %g1, %l7	
	LOADI 1, %g1	
	COMP %l7, %g1, %icc	
	CBREQ %icc, .S7, .S8	
 .S7:
	MOV %l3, %l4	
	MOV %l3, %l6	
	MOV %l5, %l7	
	DIV %l7, %l6, %l6	
	MULT %l6, %l4, %l4	
	MOV %l5, %l6	
	SUB %l6, %l4, %l4	
	MOV %l2, %l2	
	MOV %l4, %l2	
	MOV %l2, %l2	
 !#if-guard:
	LOADI 0, %l1	
	MOV %l2, %l2	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l2, %l1, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S9, .S10	
 .S9:
	MOV %g0, %i0	
	RET 	
	JUMPI .S11	
 .S11:
.S10:
	LOADI 1, %l0	
	MOV %l3, %l1	
	ADD %l1, %l0, %l1	
	MOV %l3, %l0	
	MOV %l1, %l0	
	MOV %l0, %l3	
	JUMPI .S6	
 .S8:
	LOADI 1, %i0	
	RET 	
	JUMPI .S5	
 !#function-exit:
 !#function-entry:
isqrt:
	SAVE 	
	STOREINARGUMENT %i0, %l1	
 !#function-body:
	LOADI 1, %l2	
	MOV %l5, %l3	
	MOV %l2, %l3	
	MOV %l3, %l5	
	LOADI 3, %l2	
	MOV %l4, %l3	
	MOV %l2, %l3	
	MOV %l3, %l4	
 !#while-guard:
.S0:
	MOV %l1, %l2	
	MOV %l5, %l3	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l3, %l2, %icc	
	MOVLE %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S1, .S2	
 .S1:
	MOV %l4, %l2	
	MOV %l5, %l3	
	ADD %l3, %l2, %l2	
	MOV %l5, %l3	
	MOV %l2, %l3	
	MOV %l3, %l5	
	LOADI 2, %l2	
	MOV %l4, %l3	
	ADD %l3, %l2, %l2	
	MOV %l4, %l3	
	MOV %l2, %l3	
	MOV %l3, %l4	
	JUMPI .S0	
 .S2:
	LOADI 1, %l0	
	LOADI 2, %l1	
	MOV %l4, %l2	
	DIV %l2, %l1, %l1	
	SUB %l1, %l0, %i0	
	RET 	
 !#function-exit:
 