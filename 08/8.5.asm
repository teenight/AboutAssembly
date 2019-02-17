; Author: Zejian Zhong
; UserID: zzz0065

INCLUDE Irvine32.inc
.data
Apple   WORD    1214h, 3423h, 6578h, 5699h, 2005h
Berry   WORD    4125h, 2345h, 12BCh, 0CDF1h, 1009h
Cherry  WORD    5   DUP(0)
vala    BYTE    "A: ", 0
valb    BYTE    "B: ", 0
valc    BYTE    "C: ", 0
.code
Extended_Sub PROC				
clc
pushfd
L1:
    mov ax, [esi]
    mov dx, [edi]
    neg dx
    popfd
    adc ax, dx
    pushfd
    mov [ebx], ax
    add esi, 2
    add edi, 2
    add ebx, 2
loop L1
mov byte ptr [ebx], 0
adc byte ptr [ebx], 0
popfd
ret
Extended_Sub ENDP

Display PROC
mov ebx, TYPE WORD
mov ecx, 5
L2:
    mov ax, [esi]
    call WriteHexB
    call crlf
    add esi, TYPE WORD
loop L2

call crlf
ret
Display ENDP

main PROC
mov esi, OFFSET Apple
mov edi, OFFSET Berry
mov ebx, OFFSET Cherry
mov ecx, lengthof Apple
call Extended_Sub

mov edx, OFFSET vala
call WriteString
call crlf
mov esi, OFFSET Apple
mov ecx, sizeof Apple
call Display

mov edx, OFFSET valb
call WriteString
call crlf
mov esi, OFFSET Berry
mov ecx, sizeof Berry
call Display

mov edx, OFFSET valc
call WriteString
call crlf
mov esi, OFFSET Cherry
mov ecx, sizeof Cherry
call Display
    EXIT
main ENDP
END main