; Author: Zejian Zhong
; UserID: zzz0065

INCLUDE Irvine32.inc
.data
score BYTE "Enter your score (0 - 100): ", 0
msg1 BYTE "The original score is: ", 0
msg2 BYTE "The letter grade is: ", 0
out1 BYTE "A", 0
out2 BYTE "B", 0
out3 BYTE "C", 0
out4 BYTE "D", 0
out5 BYTE "F", 0
.code
main PROC
mov edx, OFFSET score
call WriteString
call ReadDec
mov edx, OFFSET out1
cmp eax, 89
jae LBX
mov edx, OFFSET out2
cmp eax, 79
jae LBX
mov edx, OFFSET out3
cmp eax, 69
jae LBX
mov edx, OFFSET out4
cmp eax, 59
jae LBX
mov edx, OFFSET out5
cmp eax, 0
jae LBX
LBX:
push edx
mov edx, OFFSET msg1
call WriteString
call WriteDec
call Crlf
pop edx
push edx
mov edx, OFFSET msg2
call WriteString
pop edx
call WriteString
call Crlf
exit
main ENDP
END main