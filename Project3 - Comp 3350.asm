
;OBJECTIVE:
; The objective of this assignment is to create a program that will read a value from an array, and
; then place this value in another array with the location shifted by a certain amount. The array
; may be of any length from 2 to 100. The program should then read each of the values from the array input
; and place the values into the output array but the location should be shifted by the amount in the shift
; variable. If the shift would cause a value to be outside of the bounds of output, then the values
; should loop to the front of output.
; Author: Chris CJ Young
; Date: March-2022

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data

; Create a BYTE array with the label ‘input’. ‘input’ should have eight elements. You
; should place values 1,2,3,4,5,6,7,8 in each of the elements of this array
input BYTE 1,2,3,4,5,6,7,8

;  Create a BYTE array with the label ‘output’. This array should be the same length as
; ‘input'
output BYTE LENGTHOF input dup(?)

;  Create a DWORD variable with the label ‘shift’. ‘shift’ should hold a single value. The
; value of ‘shift’ must be less than the length of ‘input’
shift DWORD 3
	
.code
	main proc
	; Initializes the registers to clear to 0
		mov eax, 0
		mov ebx, 0

	; Shifts the reading and execution of the array "shift" elements 
		mov ecx, shift
	
	; First part of the loop that reads in the values of the 'input'
	; and places them into the 'output' array
	A1:
		; Finds the two's complement to ensure proper execution for looping
		neg ecx

		; Move the value from the input to the al 
		mov al, input[LENGTHOF input + ecx]

		; Moves the value from the al to the output array
		mov output[ebx], al

		; Finds the two's complement of the associated values
		neg ecx

		; Increment the ebx register
		inc ebx
	loop A1

	; Initializes the execution at the length minus the shifted value
	mov ecx, LENGTHOF input

	; Takes care of the "wrapped around" case
	sub ecx, shift

	; Initializes the register to clear to 0
	mov edx, 0

	; Second part of the loop that reads in the values of the 'input'
	; and places them into the 'output' array
	A2:
		; Moves the value from input to the al
		mov al, input[edx]

		; Moves the value from value from the lower register into the ebx
		mov output[ebx], al

		; Increments the output index
		inc ebx

		; Increments the input index
		inc edx
	loop A2

		INVOKE ExitProcess, 0
	main ENDP
		end main
