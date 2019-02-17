; Author: Zejian Zhong
; UserID: zzz0065

TITLE 
INCLUDE Irvine32.inc
.data
count = 10
fibArray WORD 0 , 9 DUP(?)
.code
main PROC
push OFFSET fibArray
push count
call DisplayArray

push OFFSET fibArray
push count
call ArraySeries

push OFFSET fibArray
push count
call DisplayArray
exit
main ENDP

ArraySeries PROC
push ebp
mov ebp, esp
mov esi, [ebp+12]
mov ecx, [ebp+8]
mov ebx, 0
L2:
mov eax, [esi + ebx]
add eax, [esi + ebx - 2]
add ebx, TYPE fibArray
mov [esi + ebx], eax
.IF ecx > 9
    add eax, 1
    mov [esi + ebx], eax
.ENDIF
loop L2
pop ebp
ret
ArraySeries ENDP

DisplayArray PROC
push ebp
mov ebp, esp
mov esi, [ebp+12]
mov ecx, [ebp+8]
mov ebx, 0
L1:
movsx eax, WORD PTR [esi + ebx]
add ebx, TYPE fibArray
call Crlf
call WriteInt
Loop L1
call Crlf
pop ebp
ret 8
DisplayArray ENDP

END main