!#function-entry:
main:
	SAVE 	
 !#function-body:
	LOADI 0, %l1	
	MOV %l3, %l2	
	MOV %l1, %l2	
	MOV %l2, %l3	
	MOV %l3, %l1	
	READ %l1	
	MOV %l1, %l3	
 !#while-guard:
.S9:
	LOADI 10000, %l1	
	MOV %l3, %l2	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l2, %l1, %icc	
	MOVLT %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S10, .S11	
 .S10:
	LOADI 3, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o1	
	LOADI 5, %l1	
	STOREOUTARGUMENT %l1, %o2	
	CALL fun1	
	MOV %o0, %l1	
	PRINTLN %l1	
	LOADI 1, %l1	
	MOV %l3, %l2	
	ADD %l2, %l1, %l1	
	MOV %l3, %l2	
	MOV %l1, %l2	
	MOV %l2, %l3	
	JUMPI .S9	
 .S11:
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
fun1:
	SAVE 	
	STOREINARGUMENT %i0, %l3	
	STOREINARGUMENT %i1, %l4	
	STOREINARGUMENT %i2, %l1	
 !#function-body:
	MOV %l1, %l1	
	MOV %l4, %l5	
	LOADI 4, %l6	
	DIV %l6, %l5, %l5	
	LOADI 2, %l6	
	MOV %l3, %l7	
	MULT %l7, %l6, %l6	
	LOADI 6, %l7	
	LOADI 5, %g2	
	ADD %g2, %l7, %l7	
	SUB %l7, %l6, %l6	
	ADD %l6, %l5, %l5	
	ADD %l5, %l1, %l1	
	MOV %l2, 31	
	MOV %l1, 31	
	MOV 31, %l2	
 !#if-guard:
	MOV %l4, %l1	
	MOV %l2, %l5	
	LOADI 1, %g1	
	MOV %g0, 45	
	COMP %l5, %l1, %icc	
	MOVGT %icc, %g1, 45	
	LOADI 1, %g1	
	COMP 45, %g1, %icc	
	CBREQ %icc, .S3, .S4	
 .S3:
	MOV %l2, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL fun2	
	MOV %o0, %i0	
	RET 	
	JUMPI .S5	
 .S5:
	MOV %l2, %i0	
	RET 	
 .S4:
 !#if-guard:
	MOV %l4, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, 51	
	COMP %l3, %l1, %icc	
	MOVLE %icc, %g1, 51	
	LOADI 6, %l1	
	LOADI 5, %l3	
	LOADI 1, %g1	
	MOV %g0, 50	
	COMP %l3, %l1, %icc	
	MOVLT %icc, %g1, 50	
	AND 50, 51, %l1	
	LOADI 1, %g1	
	COMP %l1, %g1, %icc	
	CBREQ %icc, .S6, .S7	
 .S6:
	MOV %l2, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL fun2	
	MOV %o0, %i0	
	RET 	
	JUMPI .S8	
 .S8:
.S7:
	JUMPI .S5	
 !#function-exit:
 !#function-entry:
fun2:
	SAVE 	
	STOREINARGUMENT %i0, %l2	
	STOREINARGUMENT %i1, %l3	
 !#function-body:
 !#if-guard:
	LOADI 0, %l1	
	MOV %l2, %l4	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l4, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S0, .S1	
 .S0:
	MOV %l3, %i0	
	RET 	
	JUMPI .S2	
 .S2:
 .S1:
	LOADI 1, %l1	
	MOV %l2, %l2	
	SUB %l2, %l1, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL fun2	
	MOV %o0, %i0	
	RET 	
	JUMPI .S2	
 !#function-exit:
 