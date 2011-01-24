!#function-entry:
main:
	SAVE 	
 !#function-body:
	LOADI 0, %l1	
	MOV %l2, %l2	
	MOV %l1, %l2	
	MOV %l2, %l2	
	LOADI 0, %l1	
	MOV %g2, %l5	
	MOV %l1, %l5	
	MOV %l5, %g2	
	LOADI 0, %l1	
	MOV %l7, %l5	
	MOV %l1, %l5	
	MOV %l5, %l7	
	LOADI 0, %l1	
	MOV %l6, %l5	
	MOV %l1, %l5	
	MOV %l5, %l6	
	LOADI 1, %l1	
	LOADI -1, %l5	
	MULT %l1, %l5, %l1	
	MOV %l4, %l4	
	MOV %l1, %l4	
	MOV %l4, %l4	
	LOADI 36, %o0	
	NEW 	
	MOV %o0, %l1	
	MOV %l3, %l3	
	MOV %l1, %l3	
	MOV %l3, %l3	
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o0	
	CALL cleanBoard	
 !#while-guard:
.S135:
	LOADI 8, %l1	
	MOV %l2, %l5	
	LOADI 1, %g1	
	MOV %g0, 321	
	COMP %l5, %l1, %icc	
	MOVNE %icc, %g1, 321	
	LOADI 0, %l1	
	MOV %l4, %l5	
	LOADI 1, %g1	
	MOV %g0, 320	
	COMP %l5, %l1, %icc	
	MOVLT %icc, %g1, 320	
	AND 320, 321, %l1	
	LOADI 1, %g1	
	COMP %l1, %g1, %icc	
	CBREQ %icc, .S136, .S137	
 .S136:
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o0	
	CALL printBoard	
 !#if-guard:
	LOADI 0, %l1	
	MOV %g2, %l5	
	LOADI 1, %g1	
	MOV %g0, 327	
	COMP %l5, %l1, %icc	
	MOVEQ %icc, %g1, 327	
	LOADI 1, %g1	
	COMP 327, %g1, %icc	
	CBREQ %icc, .S138, .S139	
 .S138:
	LOADI 1, %l5	
	MOV %g2, %l1	
	ADD %l1, %l5, %l5	
	MOV %g2, %l1	
	MOV %l5, %l1	
	MOV %l1, %g2	
	MOV %l7, %l1	
	READ %l1	
	MOV %l1, %l7	
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o0	
	LOADI 1, %l1	
	STOREOUTARGUMENT %l1, %o1	
	MOV %l7, %l1	
	STOREOUTARGUMENT %l1, %o2	
	CALL placePiece	
	JUMPI .S140	
 .S140:
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o0	
	CALL checkWinner	
	MOV %o0, %l0	
	MOV %l4, %l1	
	MOV %l0, %l1	
	MOV %l1, %l4	
	LOADI 1, %l0	
	MOV %l2, %l1	
	ADD %l1, %l0, %l1	
	MOV %l2, %l0	
	MOV %l1, %l0	
	MOV %l0, %l2	
	JUMPI .S135	
 .S139:
	LOADI 1, %l5	
	MOV %g2, %l1	
	SUB %l1, %l5, %l5	
	MOV %g2, %l1	
	MOV %l5, %l1	
	MOV %l1, %g2	
	MOV %l6, %l1	
	READ %l1	
	MOV %l1, %l6	
	MOV %l3, %l1	
	STOREOUTARGUMENT %l1, %o0	
	LOADI 2, %l1	
	STOREOUTARGUMENT %l1, %o1	
	MOV %l6, %l1	
	STOREOUTARGUMENT %l1, %o2	
	CALL placePiece	
	JUMPI .S140	
 .S137:
	LOADI 1, %l0	
	MOV %l4, %l1	
	ADD %l1, %l0, %l0	
	PRINTLN %l0	
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
checkWinner:
	SAVE 	
	STOREINARGUMENT %i0, %l1	
 !#function-body:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 0, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S27, .S28	
 .S27:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 4, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S30, .S31	
 .S30:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 8, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S33, .S34	
 .S33:
	LOADI 0, %i0	
	RET 	
	JUMPI .S35	
 .S35:
.S34:
	JUMPI .S32	
 .S32:
.S31:
	JUMPI .S29	
 .S29:
.S28:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 0, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S36, .S37	
 .S36:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 4, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S39, .S40	
 .S39:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 8, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S42, .S43	
 .S42:
	LOADI 1, %i0	
	RET 	
	JUMPI .S44	
 .S44:
.S43:
	JUMPI .S41	
 .S41:
.S40:
	JUMPI .S38	
 .S38:
.S37:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 12, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S45, .S46	
 .S45:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 16, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S48, .S49	
 .S48:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 20, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S51, .S52	
 .S51:
	LOADI 0, %i0	
	RET 	
	JUMPI .S53	
 .S53:
.S52:
	JUMPI .S50	
 .S50:
.S49:
	JUMPI .S47	
 .S47:
.S46:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 12, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S54, .S55	
 .S54:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 16, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S57, .S58	
 .S57:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 20, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S60, .S61	
 .S60:
	LOADI 1, %i0	
	RET 	
	JUMPI .S62	
 .S62:
.S61:
	JUMPI .S59	
 .S59:
.S58:
	JUMPI .S56	
 .S56:
.S55:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 24, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S63, .S64	
 .S63:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 28, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S66, .S67	
 .S66:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 32, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S69, .S70	
 .S69:
	LOADI 0, %i0	
	RET 	
	JUMPI .S71	
 .S71:
.S70:
	JUMPI .S68	
 .S68:
.S67:
	JUMPI .S65	
 .S65:
.S64:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 24, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S72, .S73	
 .S72:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 28, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S75, .S76	
 .S75:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 32, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S78, .S79	
 .S78:
	LOADI 1, %i0	
	RET 	
	JUMPI .S80	
 .S80:
.S79:
	JUMPI .S77	
 .S77:
.S76:
	JUMPI .S74	
 .S74:
.S73:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 0, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S81, .S82	
 .S81:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 12, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S84, .S85	
 .S84:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 24, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S87, .S88	
 .S87:
	LOADI 0, %i0	
	RET 	
	JUMPI .S89	
 .S89:
.S88:
	JUMPI .S86	
 .S86:
.S85:
	JUMPI .S83	
 .S83:
.S82:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 0, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S90, .S91	
 .S90:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 12, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S93, .S94	
 .S93:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 24, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S96, .S97	
 .S96:
	LOADI 1, %i0	
	RET 	
	JUMPI .S98	
 .S98:
.S97:
	JUMPI .S95	
 .S95:
.S94:
	JUMPI .S92	
 .S92:
.S91:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 4, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S99, .S100	
 .S99:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 16, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S102, .S103	
 .S102:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 28, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S105, .S106	
 .S105:
	LOADI 0, %i0	
	RET 	
	JUMPI .S107	
 .S107:
.S106:
	JUMPI .S104	
 .S104:
.S103:
	JUMPI .S101	
 .S101:
.S100:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 4, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S108, .S109	
 .S108:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 16, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S111, .S112	
 .S111:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 28, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S114, .S115	
 .S114:
	LOADI 1, %i0	
	RET 	
	JUMPI .S116	
 .S116:
.S115:
	JUMPI .S113	
 .S113:
.S112:
	JUMPI .S110	
 .S110:
.S109:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 8, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S117, .S118	
 .S117:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 20, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S120, .S121	
 .S120:
 !#if-guard:
	LOADI 1, %l2	
	MOV %l1, %l3	
	LOADI 32, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S123, .S124	
 .S123:
	LOADI 0, %i0	
	RET 	
	JUMPI .S125	
 .S125:
.S124:
	JUMPI .S122	
 .S122:
.S121:
	JUMPI .S119	
 .S119:
.S118:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 8, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S126, .S127	
 .S126:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l3	
	LOADI 20, %g1	
	LOADAI %l3, %g1, %l3	
	LOADI 1, %g1	
	MOV %g0, %l4	
	COMP %l3, %l2, %icc	
	MOVEQ %icc, %g1, %l4	
	LOADI 1, %g1	
	COMP %l4, %g1, %icc	
	CBREQ %icc, .S129, .S130	
 .S129:
 !#if-guard:
	LOADI 2, %l2	
	MOV %l1, %l1	
	LOADI 32, %g1	
	LOADAI %l1, %g1, %l1	
	LOADI 1, %g1	
	MOV %g0, %l0	
	COMP %l1, %l2, %icc	
	MOVEQ %icc, %g1, %l0	
	LOADI 1, %g1	
	COMP %l0, %g1, %icc	
	CBREQ %icc, .S132, .S133	
 .S132:
	LOADI 1, %i0	
	RET 	
	JUMPI .S134	
 .S134:
.S133:
	JUMPI .S131	
 .S131:
.S130:
	JUMPI .S128	
 .S128:
.S127:
	LOADI 1, %l0	
	LOADI -1, %l1	
	MULT %l0, %l1, %i0	
	RET 	
 !#function-exit:
 !#function-entry:
placePiece:
	SAVE 	
	STOREINARGUMENT %i0, %l3	
	STOREINARGUMENT %i1, %l2	
	STOREINARGUMENT %i2, %l1	
 !#function-body:
 !#if-guard:
	LOADI 1, %l4	
	MOV %l1, %l5	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l5, %l4, %icc	
	MOVEQ %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S0, .S1	
 .S0:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 0, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S2	
 .S2:
 .S1:
 !#if-guard:
	LOADI 2, %l4	
	MOV %l1, %l5	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l5, %l4, %icc	
	MOVEQ %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S3, .S4	
 .S3:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 4, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S5	
 .S5:
	JUMPI .S2	
 .S4:
 !#if-guard:
	LOADI 3, %l4	
	MOV %l1, %l5	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l5, %l4, %icc	
	MOVEQ %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S6, .S7	
 .S6:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 8, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S8	
 .S8:
	JUMPI .S5	
 .S7:
 !#if-guard:
	LOADI 4, %l4	
	MOV %l1, %l5	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l5, %l4, %icc	
	MOVEQ %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S9, .S10	
 .S9:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 12, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S11	
 .S11:
	JUMPI .S8	
 .S10:
 !#if-guard:
	LOADI 5, %l4	
	MOV %l1, %l5	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l5, %l4, %icc	
	MOVEQ %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S12, .S13	
 .S12:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 16, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S14	
 .S14:
	JUMPI .S11	
 .S13:
 !#if-guard:
	LOADI 6, %l4	
	MOV %l1, %l5	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l5, %l4, %icc	
	MOVEQ %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S15, .S16	
 .S15:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 20, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S17	
 .S17:
	JUMPI .S14	
 .S16:
 !#if-guard:
	LOADI 7, %l4	
	MOV %l1, %l5	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l5, %l4, %icc	
	MOVEQ %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S18, .S19	
 .S18:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 24, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S20	
 .S20:
	JUMPI .S17	
 .S19:
 !#if-guard:
	LOADI 8, %l4	
	MOV %l1, %l5	
	LOADI 1, %g1	
	MOV %g0, %l6	
	COMP %l5, %l4, %icc	
	MOVEQ %icc, %g1, %l6	
	LOADI 1, %g1	
	COMP %l6, %g1, %icc	
	CBREQ %icc, .S21, .S22	
 .S21:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 28, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S23	
 .S23:
	JUMPI .S20	
 .S22:
 !#if-guard:
	LOADI 9, %l4	
	MOV %l1, %l1	
	LOADI 1, %g1	
	MOV %g0, %l0	
	COMP %l1, %l4, %icc	
	MOVEQ %icc, %g1, %l0	
	LOADI 1, %g1	
	COMP %l0, %g1, %icc	
	CBREQ %icc, .S24, .S25	
 .S24:
	MOV %l2, %l1	
	MOV %l3, %l0	
	LOADI 32, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
	JUMPI .S26	
 .S26:
.S25:
	JUMPI .S23	
 !#function-exit:
 !#function-entry:
printMoveBoard:
	SAVE 	
 !#function-body:
	LOADI 123, %l0	
	PRINTLN %l0	
	LOADI 456, %l0	
	PRINTLN %l0	
	LOADI 789, %l0	
	PRINTLN %l0	
 !#function-exit:
 !#function-entry:
printBoard:
	SAVE 	
	STOREINARGUMENT %i0, %l0	
 !#function-body:
	MOV %l0, %l1	
	LOADI 0, %g1	
	LOADAI %l1, %g1, %l1	
	PRINT %l1	
	MOV %l0, %l1	
	LOADI 4, %g1	
	LOADAI %l1, %g1, %l1	
	PRINT %l1	
	MOV %l0, %l1	
	LOADI 8, %g1	
	LOADAI %l1, %g1, %l1	
	PRINTLN %l1	
	MOV %l0, %l1	
	LOADI 12, %g1	
	LOADAI %l1, %g1, %l1	
	PRINT %l1	
	MOV %l0, %l1	
	LOADI 16, %g1	
	LOADAI %l1, %g1, %l1	
	PRINT %l1	
	MOV %l0, %l1	
	LOADI 20, %g1	
	LOADAI %l1, %g1, %l1	
	PRINTLN %l1	
	MOV %l0, %l1	
	LOADI 24, %g1	
	LOADAI %l1, %g1, %l1	
	PRINT %l1	
	MOV %l0, %l1	
	LOADI 28, %g1	
	LOADAI %l1, %g1, %l1	
	PRINT %l1	
	MOV %l0, %l0	
	LOADI 32, %g1	
	LOADAI %l0, %g1, %l0	
	PRINTLN %l0	
 !#function-exit:
 !#function-entry:
cleanBoard:
	SAVE 	
	STOREINARGUMENT %i0, %l0	
 !#function-body:
	LOADI 0, %l1	
	MOV %l0, %l2	
	LOADI 0, %g1	
	LOADAI %l2, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l2, %g1	
	LOADI 0, %l1	
	MOV %l0, %l2	
	LOADI 4, %g1	
	LOADAI %l2, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l2, %g1	
	LOADI 0, %l1	
	MOV %l0, %l2	
	LOADI 8, %g1	
	LOADAI %l2, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l2, %g1	
	LOADI 0, %l1	
	MOV %l0, %l2	
	LOADI 12, %g1	
	LOADAI %l2, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l2, %g1	
	LOADI 0, %l1	
	MOV %l0, %l2	
	LOADI 16, %g1	
	LOADAI %l2, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l2, %g1	
	LOADI 0, %l1	
	MOV %l0, %l2	
	LOADI 20, %g1	
	LOADAI %l2, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l2, %g1	
	LOADI 0, %l1	
	MOV %l0, %l2	
	LOADI 24, %g1	
	LOADAI %l2, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l2, %g1	
	LOADI 0, %l1	
	MOV %l0, %l2	
	LOADI 28, %g1	
	LOADAI %l2, %g1, %l3	
	MOV %l1, %l3	
	STOREAI %l3, %l2, %g1	
	LOADI 0, %l1	
	MOV %l0, %l0	
	LOADI 32, %g1	
	LOADAI %l0, %g1, %l2	
	MOV %l1, %l2	
	STOREAI %l2, %l0, %g1	
 !#function-exit:
 