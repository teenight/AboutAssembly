; Author: Zejian Zhong
; UserID: zzz0065

INCLUDE Irvine32.inc
.data
cel BYTE "Celsius = ", 0
fah BYTE "Fahrenheit = ", 0
denominator BYTE "/5", 0
space BYTE " ", 0
.code
main proc
mov edx, OFFSET cel
call WriteString
call ReadInt
push eax
call converter
call Crlf
exit
main ENDP

converter proc
push ebp
mov ebp, esp
mov eax, [ebp+8]
imul eax, 9
mov ebx, +5
cdq
idiv ebx
add eax, 32
push edx
mov edx, OFFSET fah
call WriteString
pop edx
call WriteInt
push edx
mov edx, OFFSET space
call WriteString
pop edx
push eax
mov eax, edx
test eax, eax
jns NonNeg
theNeg:
neg eax
NonNeg:
cmp eax, 0
je fract
call WriteDec
pop eax
push edx
mov edx, OFFSET denominator
call WriteString
pop edx
jmp endexit
fract:
pop eax
endexit:
pop ebp
ret 4
converter ENDP
END main