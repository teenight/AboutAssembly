; Author: Zejian Zhong
; UserID: zzz0065

TITLE APPLE PEAR
INCLUDE Irvine32.inc
.data
apple   WORD    ?
pear    WORD    ?
val1    WORD    1
string1 BYTE    "Apple = 1", 0dh, 0ah, 0
string2 BYTE    "Pear = 1", 0dh, 0ah, 0
string3 BYTE    "Apple = 0", 0dh, 0ah, 0
string4 BYTE    "Pear = 0", 0dh, 0ah, 0
.code
main PROC
mov cx, 1
mov bx, 1				
cmp cx, bx
je  label1
jne label2

label1:
cmp cx, val1
jae label2
mov apple, 1
mov edx, OFFSET string1
call WriteString
jmp pearP

label2:
mov apple, 0
mov edx, OFFSET string3
call WriteString
jmp pearP

pearP:
mov cx, 1
mov bx, 1
cmp bx, cx
je  label3
jae label3
mov pear, 0
mov edx, OFFSET string4
call WriteString
jmp exitP

label3:
mov pear, 1
mov edx, OFFSET string2
call WriteString
jmp exitP

exitP:
exit
main ENDP
END main