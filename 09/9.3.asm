; Author: Zejian Zhong
; UserID: zzz0065

TITLE 
INCLUDE Irvine32.inc
.data
height  DWORD   20
base    DWORD   12
msg1    BYTE "The sum of the first two of the series is: ", 0
msg2    BYTE "The sum of the series is: ", 0
msg3    BYTE "The difference in the two sums is: ", 0
.code
main PROC				
call SumOfA
call SumOfB
call Diff
main ENDP

SumOfA  PROC
mov eax, height
mov ebx, base
mul ebx
shr eax, 1  ; A = bh / 2
mov ebx, 5
mul ebx
shr eax, 2  ; A + A / 4 = 5 * A / 4
mov edx, OFFSET msg1
call WriteString
call WriteDec
call Crlf
SumOfA ENDP

SumOfB PROC
push eax
mov ebx, 5
xor edx, edx
div ebx
shl eax, 2  ; A = ((5 * A / 4) / 5) * 4

shl eax, 2
mov ebx, 3
xor edx, edx
div ebx     ; A / (1 - 1 / 4) = 4 * A / 3
mov edx, OFFSET msg2
mov ebx, eax
call WriteString
call WriteDec
call Crlf
pop eax
SumOfB ENDP

Diff PROC
sub ebx, eax
mov eax, ebx
mov edx, OFFSET msg3
call WriteString
call WriteDec
call Crlf
Diff ENDP
    Exit
END main