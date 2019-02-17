; Author: Zejian Zhong
; UserID: zzz0065

TITLE Arrays
INCLUDE Irvine32.inc
LengthOfArray = LENGTHOF Oranges
TypeOfArray = TYPE Oranges

.data
Oranges SWORD   15 DUP(?)
min     SWORD   7FFFh
minIndex    BYTE    ?
max     SWORD   8000h
maxIndex    BYTE    ?

Prompt  BYTE "Please input a value: ",0
minimum BYTE "Minimum is: ", 0
maximum BYTE "Maximum is: ", 0

.code
MinMax PROC
	 xor ebx, ebx
	 xor ecx, ecx
	 xor edx, edx
	 mov cx, LENGTHOF Oranges
	 LP1:
		  mov bx, SIZEOF Oranges
		  sub bx, cx
		  sub bx, cx

		  mov ax, Oranges[bx]
		  cmp ax, min
		  jl changeMin
		  jmp compareMax

		  changeMin:
		  mov min, ax
		  mov minIndex, bl
		  jmp compareMax

		  compareMax:
		  cmp ax, max
		  jg changeMax
		  jmp Nothing

		  changeMax:
		  mov max, ax
		  mov maxIndex, bl

		  Nothing:
	 loop LP1

	 xor eax, eax
	 mov ah, maxIndex
	 mov al, minIndex
	 mov ebx, 2
	 div ebx
	 mov maxIndex, ah
	 mov minIndex, al

	 ret
    
MinMax ENDP

main PROC
	 xor ebx, ebx
	 xor ecx, ecx

	 mov cl, LENGTHOF Oranges
	 LP2:
		  mov bx, SIZEOF Oranges
		  sub bx, cx
		  sub bx, cx

		  mov edx, OFFSET prompt
		  call WriteString

		  call ReadInt
		  mov Oranges[bx], ax
	 loop LP2

call MinMax

mov edx, OFFSET minimum
movsx eax, min
CALL WriteString
CALL WriteInt
CALL Crlf

mov edx, OFFSET maximum
movsx eax, max
CALL WriteString
CALL WriteInt
CALL Crlf

main ENDP
END main