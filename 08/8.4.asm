; Author: Zejian Zhong
; UserID: zzz0065
 
INCLUDE Irvine32.inc
.data
x   DWORD   -3
y   DWORD   6
z   DWORD   ?
valx    BYTE    "X = ", 0
valy    BYTE    "Y = ", 0
valz    BYTE    "Z = ", 0
p1  BYTE    "Z = X^2 + 2XY + Y^2", 0
p2  BYTE    "Z = (X + Y)^2", 0
.code
pone PROC
mov eax, x
imul x
mov z, eax
mov eax, 2
imul x
imul y
add z, eax
mov eax, y
imul y
add z, eax
ret
pone ENDP

ptwo PROC
mov eax, x
add eax, y
imul eax
mov z, eax
ret
ptwo ENDP

writedown PROC
mov edx, OFFSET valz
mov eax, z
call WriteString
call WriteInt
call crlf
ret
writedown ENDP

main PROC				
mov edx, OFFSET valx
mov eax, x
call WriteString
call WriteInt
call crlf

mov edx, OFFSET valy
mov eax, y
call WriteString
call WriteInt
call crlf

mov edx, OFFSET p1
call WriteString
call crlf
call pone
call writedown

call crlf
mov edx, OFFSET p2
call WriteString
call crlf
call ptwo
call writedown
    EXIT
main ENDP
END main