!#function-entry:
main:
	SAVE 	
 !#function-body:
	LOADI 20000, %l1	
	MOV %l1, %l1	
	LOADI 0, %l2	
	MOV %l2, %l2	
 !#while-guard:
.S0:
	MOV %l1, %l3	
	MOV %l2, %l4	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l4, %l3, %icc	
	MOVLT %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S1, .S2	
 .S1:
 !#if-guard:
	LOADI 1, %l1	
	LOADI 1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l0	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l0	
	LOADI 1, %g1	
	COMP %l0, %g1, %icc	
	CBREQ %icc, .S3, .S4	
 .S3:
	MOV %l2, %l0	
	PRINTLN %l0	
	JUMPI .S5	
 .S5:
.S4:
	LOADI 1, %l0	
	MOV %l2, %l1	
	ADD %l1, %l0, %l0	
	MOV %l0, %l2	
	JUMPI .S0	
 .S2:
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 
