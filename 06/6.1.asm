; Author: Zejian Zhong
; UserID: zzz0065

TITLE Arithmetic Expression
INCLUDE Irvine32.inc
.data
Dog     SWORD   8
Cat     SWORD   -25
Mouse   SWORD   -36
Horse   SWORD   -102
.code
main PROC	
    movsx   eax, Dog
    movsx   ebx, Cat
    add     eax, ebx
    movsx   ebx, Mouse
    neg     ebx	
    add     eax, ebx
    movsx   ebx, Horse
    add     eax, ebx
    EXIT
main ENDP
END main