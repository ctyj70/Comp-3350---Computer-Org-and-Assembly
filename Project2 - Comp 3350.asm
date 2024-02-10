; The objective of this assignment is to create a program that will read a value from an array, add another
; value to this, and save the sum of those two values into a specific register. 
; @Author Chris CJ Young
; @Version - 2/8/22

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
input BYTE 1,2,3,4,5,6,7,8
shift BYTE 2

.code
main PROC
; Clear the registers so that they start at 0.
mov EAX, 0
mov EBX, 0
mov ECX, 0
mov EDX, 0

; Add the values of each array 'input'
; Sums in the high position of the AX register
mov ah, [input]
add ah, shift

; Sums in the low position of the AX register
mov al, [input+1]
add al, shift

; Sums in the high position of the BX register
mov bh, [input+2]
add bh, shift

; Sums in the low position of the BX register
mov bl, [input+3]
add bl, shift

; Sums in the high position of the CX register
mov ch, [input+4]
add ch, shift

; Sums in the low position of the CX register
mov cl, [input+5]
add cl, shift

; Sums in the high position for the DX register
mov dh, [input+6]
add dh, shift

; Sums in the low position for the DX register
mov dl, [input+7]
add dl, shift
	INVOKE ExitProcess, 0
main ENDP
END main