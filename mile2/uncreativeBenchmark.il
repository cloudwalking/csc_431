!#function-entry:
main:
	SAVE 	
 !#function-body:
	LOADI 36, %o0	
	NEW 	
	MOV %o0, %l3	
	MOV %l4, %l4	
	MOV %l3, %l4	
	MOV %l4, %l4	
	LOADI 0, %l3	
	MOV %l1, %l1	
	MOV %l3, %l1	
	MOV %l1, %l1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 0, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 4, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 8, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 12, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 16, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 20, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 24, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 28, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 32, %g1	
	LOADAI %l3, %g1, %l5	
	MOV %l1, %l5	
	STOREAI %l5, %l3, %g1	
	MOV %l2, %l1	
	READ %l1	
	MOV %l1, %l2	
 !#while-guard:
.S30:
	LOADI 0, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVNE %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S31, .S32	
 .S31:
 !#if-guard:
	LOADI 1, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S33, .S34	
 .S33:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 0, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 0, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S35	
 .S35:
	MOV %l2, %l0	
	READ %l0	
	MOV %l0, %l2	
	JUMPI .S30	
 .S34:
 !#if-guard:
	LOADI 2, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S36, .S37	
 .S36:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 4, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 4, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S38	
 .S38:
	JUMPI .S35	
 .S37:
 !#if-guard:
	LOADI 3, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S39, .S40	
 .S39:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 8, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 8, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S41	
 .S41:
	JUMPI .S38	
 .S40:
 !#if-guard:
	LOADI 4, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S42, .S43	
 .S42:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 12, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 12, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S44	
 .S44:
	JUMPI .S41	
 .S43:
 !#if-guard:
	LOADI 5, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S45, .S46	
 .S45:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 16, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 16, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S47	
 .S47:
	JUMPI .S44	
 .S46:
 !#if-guard:
	LOADI 6, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S48, .S49	
 .S48:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 20, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 20, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S50	
 .S50:
	JUMPI .S47	
 .S49:
 !#if-guard:
	LOADI 7, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S51, .S52	
 .S51:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 24, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 24, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S53	
 .S53:
	JUMPI .S50	
 .S52:
 !#if-guard:
	LOADI 8, %l1	
	MOV %l2, %l3	
	LOADI 1, %g1	
	MOV %g0, %l0	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l0	
	LOADI 1, %g1	
	COMP %l0, %g1, %icc	
	CBREQ %icc, .S54, .S55	
 .S54:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 28, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 28, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S56	
 .S56:
	JUMPI .S53	
 .S55:
	LOADI 1, %l0	
	MOV %l4, %l1	
	LOADI 32, %g1	
	LOADAI %l1, %g1, %l1	
	ADD %l1, %l0, %l1	
	MOV %l4, %l0	
	LOADI 32, %g1	
	LOADAI %l0, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l0, %g1	
	JUMPI .S56	
 .S32:
	MOV %l4, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL countTotal	
	MOV %o0, %l0	
	PRINTLN %l0	
	LOADI 1, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l0	
	LOADI 0, %g1	
	LOADAI %l0, %g1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	LOADI 2, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l0	
	LOADI 4, %g1	
	LOADAI %l0, %g1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	LOADI 3, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l0	
	LOADI 8, %g1	
	LOADAI %l0, %g1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	LOADI 4, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l0	
	LOADI 12, %g1	
	LOADAI %l0, %g1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	LOADI 5, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l0	
	LOADI 16, %g1	
	LOADAI %l0, %g1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	LOADI 6, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l0	
	LOADI 20, %g1	
	LOADAI %l0, %g1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	LOADI 7, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l0	
	LOADI 24, %g1	
	LOADAI %l0, %g1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	LOADI 8, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l0	
	LOADI 28, %g1	
	LOADAI %l0, %g1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	LOADI 9, %l0	
	STOREOUTARGUMENT %l0, %o0	
	CALL convertBinary	
	MOV %o0, %l0	
	STOREOUTARGUMENT %l0, %o0	
	MOV %l4, %l0	
	LOADI 32, %g1	
	LOADAI %l0, %g1, %l0	
	STOREOUTARGUMENT %l0, %o1	
	CALL printRecursive	
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
convertBinary:
	SAVE 	
	STOREINARGUMENT %i0, %l1	
 !#function-body:
 !#if-guard:
	LOADI 0, %l2	
	MOV %l1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S3, .S4	
 .S3:
	LOADI 0, %i0	
	RET 	
	JUMPI .S5	
 .S5:
 .S4:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S6, .S7	
 .S6:
	LOADI 1, %i0	
	RET 	
	JUMPI .S8	
 .S8:
	JUMPI .S5	
 .S7:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S9, .S10	
 .S9:
	LOADI 10, %i0	
	RET 	
	JUMPI .S11	
 .S11:
	JUMPI .S8	
 .S10:
 !#if-guard:
	LOADI 3, %l2	
	MOV %l1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S12, .S13	
 .S12:
	LOADI 11, %i0	
	RET 	
	JUMPI .S14	
 .S14:
	JUMPI .S11	
 .S13:
 !#if-guard:
	LOADI 4, %l2	
	MOV %l1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S15, .S16	
 .S15:
	LOADI 100, %i0	
	RET 	
	JUMPI .S17	
 .S17:
	JUMPI .S14	
 .S16:
 !#if-guard:
	LOADI 5, %l2	
	MOV %l1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S18, .S19	
 .S18:
	LOADI 101, %i0	
	RET 	
	JUMPI .S20	
 .S20:
	JUMPI .S17	
 .S19:
 !#if-guard:
	LOADI 6, %l2	
	MOV %l1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S21, .S22	
 .S21:
	LOADI 110, %i0	
	RET 	
	JUMPI .S23	
 .S23:
	JUMPI .S20	
 .S22:
 !#if-guard:
	LOADI 7, %l2	
	MOV %l1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S24, .S25	
 .S24:
	LOADI 111, %i0	
	RET 	
	JUMPI .S26	
 .S26:
	JUMPI .S23	
 .S25:
 !#if-guard:
	LOADI 8, %l2	
	MOV %l1, %l1	
	LOADI 1, %g1	
	MOV %g0, %l0	
	COMP %l1, %l2, %icc	
	MOVEQ %icc, %g1, %l0	
	LOADI 1, %g1	
	COMP %l0, %g1, %icc	
	CBREQ %icc, .S27, .S28	
 .S27:
	LOADI 1000, %i0	
	RET 	
	JUMPI .S29	
 .S29:
	JUMPI .S26	
 .S28:
	LOADI 1001, %i0	
	RET 	
	JUMPI .S29	
 !#function-exit:
 !#function-entry:
printRecursive:
	SAVE 	
	STOREINARGUMENT %i0, %l2	
	STOREINARGUMENT %i1, %l4	
 !#function-body:
 !#if-guard:
	LOADI 0, %l1	
	MOV %l4, %l3	
	LOADI 1, %g1	
	MOV %g0, %l5	
	COMP %l3, %l1, %icc	
	MOVEQ %icc, %g1, %l5	
	LOADI 1, %g1	
	COMP %l5, %g1, %icc	
	CBREQ %icc, .S0, .S1	
 .S0:
	MOV %l2, %i0	
	RET 	
	JUMPI .S2	
 .S2:
 .S1:
	MOV %l2, %l1	
	PRINTLN %l1	
	LOADI 1, %l1	
	MOV %l4, %l3	
	SUB %l3, %l1, %l1	
	MOV %l4, %l3	
	MOV %l1, %l3	
	MOV %l3, %l4	
	MOV %l2, %l1	
	STOREOUTARGUMENT %l1, %o0	
	MOV %l4, %l1	
	STOREOUTARGUMENT %l1, %o1	
	CALL printRecursive	
	MOV %o0, %i0	
	RET 	
	JUMPI .S2	
 !#function-exit:
 !#function-entry:
countTotal:
	SAVE 	
	STOREINARGUMENT %i0, %l0	
 !#function-body:
	LOADI 0, %l1	
	MOV %l2, %l2	
	MOV %l1, %l2	
	MOV %l2, %l2	
	MOV %l0, %l1	
	LOADI 32, %g1	
	LOADAI %l1, %g1, %l1	
	MOV %l0, %l3	
	LOADI 28, %g1	
	LOADAI %l3, %g1, %l3	
	MOV %l0, %l4	
	LOADI 24, %g1	
	LOADAI %l4, %g1, %l4	
	MOV %l0, %l5	
	LOADI 20, %g1	
	LOADAI %l5, %g1, %l5	
	MOV %l0, %l6	
	LOADI 16, %g1	
	LOADAI %l6, %g1, %l6	
	MOV %l0, %l7	
	LOADI 12, %g1	
	LOADAI %l7, %g1, %l7	
	MOV %l0, %g2	
	LOADI 8, %g1	
	LOADAI %g2, %g1, 40	
	MOV %l0, 44	
	LOADI 4, %g1	
	LOADAI 44, %g1, 42	
	MOV %l0, 43	
	LOADI 0, %g1	
	LOADAI 43, %g1, 41	
	ADD 41, 42, 39	
	ADD 39, 40, %l0	
	ADD %l0, %l7, %l0	
	ADD %l0, %l6, %l0	
	ADD %l0, %l5, %l0	
	ADD %l0, %l4, %l0	
	ADD %l0, %l3, %l0	
	ADD %l0, %l1, %l1	
	MOV %l2, %l0	
	MOV %l1, %l0	
	MOV %l0, %l2	
	MOV %l2, %i0	
	RET 	
 !#function-exit:
 