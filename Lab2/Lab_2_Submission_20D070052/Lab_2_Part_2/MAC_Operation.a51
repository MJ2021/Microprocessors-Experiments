ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL MAC
HERE: SJMP HERE
ORG 130H
// *****************
MAC:

MOV A, 70H
MOV B, 73H
MUL AB // A1B1
MOV R2, A
MOV R3, B

MOV A, 71H
MOV B, 74H
MUL AB //A2B2
MOV R4, A
MOV R5, B

CALL ADD16 // ADDING A1B1 AND A2B2

MOV R6, 50H // Carry into R6

MOV A, 72H
MOV B, 75H
MUL AB //A3B3
MOV R2, A
MOV R3, B

CALL ADD16 // ADDING THE RESULT OF A1B1 AND A2B2 WITH A3B3

MOV A, 50H
ADD A, R6 // ADDING THE CARRIES OF THE TWO ADD16'S
MOV 50H, A 

// MAC OPERATION, CALL THE ADDITION SUBROUTINE USING "CALL ADD16"
RET
ADD16:

CLR C
MOV A, R2
ADD A, R4
MOV R4, A
MOV A, R3
ADDC A, R5
MOV R5, A

MOV 52H, R4
MOV 51H, R5

MOV A, #00H
ADDC A, #00H
MOV 50H, A
//16 BIT ADDITION CODE
RET
END