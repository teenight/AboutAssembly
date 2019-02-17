; Author: Zejian Zhong
; UserID: zzz0065

TITLE POSITIVE EVEN
INCLUDE Irvine32.inc

.data
myArray1 SWORD -2,-4,-6,-8
sentinel SWORD 0
message1 BYTE "positive even number found",0
message2 BYTE "no postive even number found",0

.code
main PROC
mov ecx, LENGTHOF myArray1
mov ebx, 0

L1:
mov ax, [myArray1 + ebx]
mov dl, 2
idiv dl
cmp ah, 0
jz L2
add ebx, TYPE myArray1
LOOP L1

MSG2:
mov edx, OFFSET message2
CALL WriteString
CALL Crlf
jmp exitThis

L2:
mov ax, [myArray1 + ebx]
test ax, 8000h
jz MSG1
add ebx, TYPE myArray1
LOOP L2

jmp MSG2

MSG1:
mov edx, OFFSET message1
CALL WriteString
CALL Crlf

exitThis:
exit
main ENDP
END main