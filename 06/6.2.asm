; Author: Zejian Zhong
; UserID: zzz0065

TITLE Arrays
INCLUDE Irvine32.inc
LengthOfArray = LENGTHOF Oranges
TypeOfArray = TYPE Oranges
.data
Oranges SWORD   15  DUP(?)
.code
main PROC				
CALL PopulateArray
CALL DisplayArray
CALL WaitMsg
    EXIT
main ENDP

PopulateArray PROC
.data
PromptUser	BYTE "Please enter a value:", 0
.code
mov edx, OFFSET PromptUser
mov ecx, LengthOfArray
mov ebx, 0
LP1:
	CALL WriteString
	CALL ReadInt
	mov [Oranges + ebx], ax
	add ebx, TYPE Oranges
Loop LP1
ret
PopulateArray ENDP

DisplayArray PROC
.data
DisplayMsg BYTE "ARRAY MAP",0
ElementMsg BYTE "Oranges[",0
ElementMsg2 BYTE "]: ",0
.code
mov ecx, LengthOfArray
mov ebx, 0
	Call Clrscr
	mov edx, OFFSET DisplayMsg 
	Call WriteString
	Call Crlf
LP2:
	mov edx, OFFSET ElementMsg
	Call WriteString
	mov eax, ebx	 
	Call WriteInt
	mov edx, OFFSET ElementMsg2
	Call WriteString
	movsx eax, [Oranges + ebx]
	Call WriteInt
	Call Crlf
	add ebx, TYPE Oranges
Loop LP2
ret
DisplayArray ENDP
END main