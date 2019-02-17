; Author: Zejian Zhong
; UserID: zzz0065

INCLUDE Irvine32.inc
.data
str1 BYTE "Zejian Zhong", 0
str2 BYTE 20 DUP(?)
msg1 BYTE "The source string is: ", 0
msg2 BYTE "The target string is: ", 0
.code
main PROC
mov edx, OFFSET msg1
call WriteString
mov edx, OFFSET str1
call WriteString
call Crlf
mov edx, OFFSET msg2
call WriteString
cld
mov ecx, LENGTHOF str1
mov esi, OFFSET str1
mov edi, OFFSET str2
rep movsb
mov edx, OFFSET str2
call WriteString
call Crlf
    EXIT
main ENDP
END main