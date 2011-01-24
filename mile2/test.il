!#function-entry:
main:
	SAVE 	
 !#function-body:
	NEW 8, %o0	
	MOV %o0, %l1	
	NEW 8, %o0	
	MOV %o0, %l2	
	LOADI 5, %l4	
	MOV %l1, %l3	
	STOREAI %l4, %l3, 0	
	LOADI 77, %l4	
	MOV %l2, %l3	
	STOREAI %l4, %l3, 0	
	MOV %l2, %l4	
	MOV %l1, %l3	
	STOREAI %l4, %l3, 4	
	MOV %l1, %l1	
	LOADAI %l1, %g0, %l1	
	PRINTLN %l1	
	MOV %l2, %l1	
	LOADAI %l1, %g0, %l1	
	PRINTLN %l1	
	LOADI 0, %i0	
	RET 	
 !#function-exit:
 