ORG 0H
LJMP MAIN
ORG 120H
MAIN:

MOV 50H, #08H
MOV 51H, #10H
MOV 52H, #20H  // Loading The Data
MOV 53H, #02H

MOV P1 , 50H       // First 4 bits
ACALL delay_1s
MOV A ,P1
SWAP A             // Next 4 bits
MOV P1, A
ACALL delay_1s

MOV A, #255       // This is for /
MOV P1, A
ACALL delay_1s

// The Program Continues With Same Logic

MOV P1 , 51H
ACALL delay_1s
MOV A, P1
SWAP A
MOV P1, A
ACALL delay_1s

MOV A, #255
MOV P1, A
ACALL delay_1s

MOV P1 , 52H
ACALL delay_1s
MOV A, P1
SWAP A
MOV P1, A
ACALL delay_1s

MOV P1 , 53H
ACALL delay_1s
MOV A, P1
SWAP A
MOV P1, A
ACALL delay_1s

MOV A, #255
MOV P1, A
ACALL delay_1s

SJMP MAIN

delay_1s:    // 1 s Delay
push 00h
mov r0, #5
h4: acall delay_200ms
djnz r0, h4
pop 00h
ret

delay_200ms:  // 200ms Delay
push 00h
mov r0, #200
h3: acall delay_1ms
djnz r0, h3
pop 00h
ret

delay_1ms:  // 1ms Delay
push 00h
mov r0, #4
h2: acall delay_250us
djnz r0, h2
pop 00h
ret

delay_250us:    // 250us Delay
push 00h
mov r0, #244
h1: djnz r0, h1
pop 00h
ret

END