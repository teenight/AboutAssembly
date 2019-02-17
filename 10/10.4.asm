; Author: Zejian Zhong
; UserID: zzz0065

INCLUDE Irvine32.inc
.data
MAX = 100
str0 BYTE "The string is: ", 0
str1 BYTE MAX+1 DUP(?)
str2 BYTE "Trying to find character 'i'.", 0
found BYTE "Result: Found", 0
notfound BYTE "Result: Not found", 0
.code
main PROC
push edx	
mov edx, OFFSET str0
call WriteString	
mov edx, OFFSET str1
mov ecx, MAX
call ReadString
mov edx, OFFSET str2
call WriteString
call Crlf
mov edi, OFFSET str1
mov al, 'i'
mov ecx, LENGTHOF str1
cld
repne scasb
jnz cannotfound
dec edi
mov edx, OFFSET found
call WriteString
call Crlf
jmp quit

cannotfound:
mov edx, OFFSET notfound
call WriteString
call Crlf

quit:
exit
main ENDP
END main