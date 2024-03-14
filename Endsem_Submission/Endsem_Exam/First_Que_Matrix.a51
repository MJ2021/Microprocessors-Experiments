ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL ADD_MATRIX
HERE: SJMP HERE
ORG 130H
// *****************


ADD_MATRIX: MOV A, 30H
			MOV B , 30H
			MUL AB       // NxN in B
			MOV B , A
			MOV R7, B
			
			MOV R0, #31H   // STARTING OF 1ST MATRIX
			MOV A, #31H
			ADD A, B
			MOV R1, A    // STARTING OF 2ND MATRIX
			ADD A, B
			MOV R2 , A  // STARTING OF SUM MATRIX
			MOV B , R2
			
SUM: MOV A, @R0
	 ADD A, @R1
	 MOV B, R0
	 MOV R0, 2
	 MOV @R0, A
	 
	 MOV R0, B
	 MOV A, R0
	 ADD A, #1
	 MOV R0, A
	 
	 MOV A, R1
	 ADD A, #1
	 MOV R1, A 
	 
	 MOV A, R2
	 ADD A, #1
	 MOV R2, A 
	 
	 DJNZ R7, SUM
	 
RET 
END
	 