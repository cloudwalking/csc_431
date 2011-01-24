!#function-entry:
main:
	SAVE 	
 !#function-body:
	MOV %l4, %l1	
	READ %l1	
	MOV %l1, %l4	
	MOV %l4, %l1	
	STOREOUTARGUMENT %l1, %o0	
	CALL convertToDecimal	
	MOV %o0, %l1	
	MOV %l4, %l2	
	MOV %l1, %l2	
	MOV %l2, %l4	
	MOV %l4, %l1	
	MOV %l4, %l2	
	MULT %l2, %l1, %l1	
	MOV %l3, %l2	
	MOV %l1, %l2	
	MOV %l2, %l3	
 !#while-guard:
.S12:
	LOADI 0, %l1	
	MOV %l3, %l2	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l2, %l1, %icc	
	MOVGT %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S13, .S14	
 .S13:
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o0	
	CALL wait	
	LOADI 1, %l1	
	MOV %l3, %l2	
	SUB %l2, %l1, %l1	
	MOV %l3, %l2	
	MOV %l1, %l2	
	MOV %l2, %l3	
	JUMPI .S12	
 .S14:
	MOV %l4, %l0	
	PRINTLN %l0	
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
convertToDecimal:
	SAVE 	
	STOREINARGUMENT %i0, %l3	
 !#function-body:
	LOADI 0, %l4	
	MOV %l2, %l2	
	MOV %l4, %l2	
	MOV %l2, %l2	
	LOADI 0, %l4	
	MOV %l1, %l1	
	MOV %l4, %l1	
	MOV %l1, %l1	
	MOV %l3, %l3	
	STOREOUTARGUMENT %l3, %o0	
	MOV %l1, %l3	
	STOREOUTARGUMENT %l3, %o1	
	MOV %l2, %l3	
	STOREOUTARGUMENT %l3, %o2	
	CALL recursiveDecimalSum	
	MOV %o0, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
recursiveDecimalSum:
	SAVE 	
	STOREINARGUMENT %i0, %l4	
	STOREINARGUMENT %i1, %l6	
	STOREINARGUMENT %i2, %l3	
 !#function-body:
 !#if-guard:
	LOADI 0, %l2	
	MOV %l4, %l5	
	LOADI 1, %g1	
	MOV %g0, %l7	
	COMP %l5, %l2, %icc	
	MOVGT %icc, %g1, %l7	
	LOADI 1, %g1	
	COMP %l7, %g1, %icc	
	CBREQ %icc, .S6, .S7	
 .S6:
	LOADI 2, %l2	
	MOV %l1, %l1	
	MOV %l2, %l1	
	MOV %l1, %l1	
	LOADI 10, %l2	
	MOV %l4, %l5	
	DIV %l5, %l2, %l2	
	MOV %g2, %l5	
	MOV %l2, %l5	
	MOV %l5, %g2	
	LOADI 10, %l2	
	MOV %g2, %l5	
	MULT %l5, %l2, %l2	
	MOV %g2, %l5	
	MOV %l2, %l5	
	MOV %l5, %g2	
	MOV %g2, %l2	
	MOV %l4, %l5	
	SUB %l5, %l2, %l2	
	MOV %g2, %l5	
	MOV %l2, %l5	
	MOV %l5, %g2	
 !#if-guard:
	LOADI 1, %l2	
	MOV %g2, %l5	
	LOADI 1, %g1	
	MOV %g0, %l7	
	COMP %l5, %l2, %icc	
	MOVEQ %icc, %g1, %l7	
	LOADI 1, %g1	
	COMP %l7, %g1, %icc	
	CBREQ %icc, .S9, .S10	
 .S9:
	MOV %l1, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL power	
	MOV %o0, %l1	
	MOV %l6, %l2	
	ADD %l2, %l1, %l1	
	MOV %l6, %l2	
	MOV %l1, %l2	
	MOV %l2, %l6	
	JUMPI .S11	
 .S11:
.S10:
	LOADI 10, %l1	
	MOV %l4, %l2	
	DIV %l2, %l1, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l6, %l1	
	STOREOUTARGUMENT %l1, %o1	
	LOADI 1, %l1	
	MOV %l3, %l2	
	ADD %l2, %l1, %l1	
	STOREOUTARGUMENT %l1, %o2	
	CALL recursiveDecimalSum	
	MOV %o0, %i0	
	RET 	
	JUMPI .S8	
 .S8:
.S7:
	MOV %l6, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
power:
	SAVE 	
	STOREINARGUMENT %i0, %l1	
	STOREINARGUMENT %i1, %l5	
 !#function-body:
	LOADI 1, %l2	
	MOV %l4, %l3	
	MOV %l2, %l3	
	MOV %l3, %l4	
 !#while-guard:
.S3:
	LOADI 0, %l2	
	MOV %l5, %l3	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l3, %l2, %icc	
	MOVGT %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S4, .S5	
 .S4:
	MOV %l1, %l2	
	MOV %l4, %l3	
	MULT %l3, %l2, %l2	
	MOV %l4, %l3	
	MOV %l2, %l3	
	MOV %l3, %l4	
	LOADI 1, %l2	
	MOV %l5, %l3	
	SUB %l3, %l2, %l2	
	MOV %l5, %l3	
	MOV %l2, %l3	
	MOV %l3, %l5	
	JUMPI .S3	
 .S5:
	MOV %l4, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
wait:
	SAVE 	
	STOREINARGUMENT %i0, %l3	
 !#function-body:
 !#while-guard:
.S0:
	LOADI 0, %l1	
	MOV %l3, %l2	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l2, %l1, %icc	
	MOVGT %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S1, .S2	
 .S1:
	LOADI 1, %l1	
	MOV %l3, %l2	
	SUB %l2, %l1, %l1	
	MOV %l3, %l2	
	MOV %l1, %l2	
	MOV %l2, %l3	
	JUMPI .S0	
 .S2:
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 