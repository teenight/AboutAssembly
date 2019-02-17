; Author: Zejian Zhong
; UserID: zzz0065

INCLUDE Irvine32.inc
.code
main PROC				
mov eax, 2h
push eax
mov ebx, eax
shl eax, 5
shl ebx, 1
add eax, ebx
shr eax, 1
    EXIT
main ENDP
END main