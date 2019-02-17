TITLE Indirect addressing
INCLUDE Irvine32.inc
.data
Array1  BYTE 7h, 2h, 1h, 5h, 4h, 6h, 8h, 9h, 8h, 9h
Array2  BYTE 4h, 1h, 1h, 3h, 3h, 5h, 6h, 7h, 4h, 3h
Array3  BYTE 10 DUP (?)
.code
main PROC
    mov ecx, LENGTHOF Array1        ; loop counter
    mov esi, 0                      ; zero index

    ; get Array3
    L1:
        mov al, Array1[esi]         ; get number at esi in Array1
        sub al, Array2[esi]         ; subtract Array2[esi]
        mov [Array3 + esi], al      ; store it in Array3
        add esi, TYPE Array1        ; do the same for next one
        loop L1
   
    mov edi, OFFSET Array1          ; address of Array1
    mov ecx, LENGTHOF Array1        ; loop counter
    mov esi, 0                      ; zero index
    mov al, 0                       ; zero al

    ; print Array1
    L2:
        mov al, Array1[esi]         ; get number at esi in Array1
        call WriteHex               ; print it as a hex number
        call Crlf                   ; add a new line so it's easier to see
        add esi, TYPE Array1        ; do the same for next one
        loop L2
    call Crlf
    
    ; print Array2
    mov edi, OFFSET Array2          ; address of Array2
    mov ecx, LENGTHOF Array2        ; loop counter
    mov esi, 0                      ; zero index
    mov al, 0                       ; zero al
    L3:
        mov al, Array2[esi]         ; get number at esi in Array2
        call WriteHex               ; print it as a hex number
        call Crlf                   ; add a new line so it's easier to see
        add esi, TYPE Array2        ; do the same for next one
        loop L3
    call Crlf

    ; print Array3
    mov edi, OFFSET Array3          ; address of Array3
    mov ecx, LENGTHOF Array3        ; loop counter
    mov esi, 0                      ; zero index
    mov al, 0                       ; zero al
    L4:
        mov al, Array3[esi]         ; get number at esi in Array3
        call WriteHex               ; print it as a hex number
        call Crlf                   ; add a new line so it's easier to see
        add esi, TYPE Array3        ; do the same for next one
        loop L4
    EXIT
main ENDP
END main