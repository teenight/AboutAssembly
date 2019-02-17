; Author: Zejian Zhong
; UserID: zzz0065

INCLUDE Irvine32.inc
.data
val     DWORD   0A24E6C8Dh
str1    BYTE    "The value is: ", 0
str2    BYTE    "The numeric digits: ", 0
.code
main PROC
xor ebx, ebx				
mov eax, val
mov edx, OFFSET str1
call WriteString
call WriteHex
call crlf
xor edx, edx
mov ecx, 8
L1:
    mov bl, al
    and bl, 00001111b
    cmp bl, 9
    ja  skip
    add dl, bl
    shl edx, 4
    skip:
        shr eax, 4
loop L1
shr edx, 4
ror dx, 8
ror dh, 4
ror dl, 4

xor eax, eax
mov ax, dx
mov ebx, 2
mov edx, OFFSET str2
call WriteString
call WriteHex
call crlf
    EXIT
main ENDP
END main