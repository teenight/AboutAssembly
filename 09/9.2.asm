; Author: Zejian Zhong
; UserID: zzz0065

TITLE 
INCLUDE Irvine32.inc
.data
myAuburnID BYTE 0h, 9h, 0h, 3h, 9h, 0h, 7h, 9h, 7h, 7h
myAuburnIDRev BYTE 10 DUP(?)
Result BYTE 10 DUP(0)
MSG1 BYTE "Result", 0
MSG2 BYTE "MyAuburnID", 0
.code
main PROC
mov esi, 0
mov ecx, 10
L3:
mov al, myAuburnID[esi]
mov edx, 9
sub edx, esi
mov myAuburnIDRev[edx], al
inc esi
loop L3

mov edx, OFFSET MSG2
call WriteString
mov edx, 0
call Crlf
push OFFSET myAuburnID
push 10
call DisplayArray
call Crlf

mov edx, OFFSET MSG1
call WriteString
mov edx, 0

call Crlf
mov ecx, 10
mov edx, 9
mov esi, OFFSET myAuburnID
mov edi, OFFSET myAuburnIDRev
mov ebx, OFFSET Result

L1:
	mov al, [esi + edx]
	mov ah, [edi + edx]
	add al, ah
	daa
	mov byte ptr [ebx + edx], al
	dec edx
loop L1

push OFFSET Result
push 10
CALL DisplayArray
exit
main ENDP

DisplayArray PROC
push ebp
mov ebp, esp
mov esi, [ebp+12]
mov ecx, [ebp+8]
mov ebx, 0

L2:
movzx eax, BYTE PTR [esi + ebx]
add ebx, TYPE BYTE
CALL WriteHex
call Crlf
Loop L2
pop ebp
ret 8
DisplayArray ENDP

END main