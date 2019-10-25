TITLE The sum of first n odd number(s)
INCLUDE Irvine32.inc
.code
main PROC
    call Prompt
    mov ecx, eax            ; put the value in eax into ecx
    call OddNumber          ; input is ecx
    call SumOfOdd           ; input is eax
    EXIT
main ENDP

Prompt PROC
.data
    string1 BYTE "Type in an integer: ", 0
.code
    mov edx, OFFSET string1
    call WriteString
    call ReadInt
    ret
Prompt ENDP

OddNumber PROC USES ecx edx esi
    mov eax, 2h             ; a multiplier
    mov esi, 1h             ; another multiplier
    mov ebx, 0h             ; the sum
    L1:
        push eax
        mul esi
        sub eax, 1          ; because it needs to be odd
        add ebx, eax
        pop eax
        inc esi
        loop L1
    mov eax, ebx
    ret
OddNumber ENDP

SumOfOdd PROC USES edx
.data
    string2 BYTE "The sum is: ", 0
.code
    mov edx, OFFSET string2
    call WriteString
    call WriteInt
    call Crlf
    ret
SumOfOdd ENDP
END main
