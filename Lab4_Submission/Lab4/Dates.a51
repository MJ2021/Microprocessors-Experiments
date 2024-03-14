ORG 0H
LJMP MAIN
ORG 120H
MAIN:

MOV 50H, #25H
MOV 51H, #06H
MOV 52H, #19H    // Loading The Data
MOV 53H, #83H

MOV P1 , 50H      // First 4 bits
ACALL delay_200ms
MOV A ,P1
SWAP A            // Next 4 bits
MOV P1, A
ACALL delay_200ms

MOV A, #255        // This is for /
MOV P1, A
ACALL delay_200ms

// The Program Continues With Same Logic

MOV P1 , 51H
ACALL delay_200ms
MOV A, P1
SWAP A
MOV P1, A
ACALL delay_200ms

MOV A, #255
MOV P1, A
ACALL delay_200ms

MOV P1 , 52H
ACALL delay_200ms
MOV A, P1
SWAP A
MOV P1, A
ACALL delay_200ms

MOV P1 , 53H
ACALL delay_200ms
MOV A, P1
SWAP A
MOV P1, A
ACALL delay_200ms

MOV A, #255
MOV P1, A
ACALL delay_200ms

SJMP MAIN

delay_200ms:     // 200ms Delay
push 00h
mov r0, #200
h3: acall delay_1ms
djnz r0, h3
pop 00h
ret

delay_1ms:      // 1ms Delay
push 00h
mov r0, #4
h2: acall delay_250us
djnz r0, h2
pop 00h
ret

delay_250us:   // 250us Delay
push 00h
mov r0, #244
h1: djnz r0, h1
pop 00h
ret

END