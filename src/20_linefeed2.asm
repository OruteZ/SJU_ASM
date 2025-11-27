; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 위 출력을 LOOP로 작성 (문자 배열 + 0Ah 포함)
; =================

.MODEL SMALL
.STACK
.DATA
    MSG     db "Oh",0Ah,"Jae",0Ah,"O"

.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax

    mov ah, 02h
    mov si, offset MSG
    mov cx, 8 ;OH(2) + 0Ah(1) + Jae(3) + 0Ah(1) + O(1) = 8

PRINT_LOOP:
    mov dl, [si]
    int 21h
    inc si
    LOOP PRINT_LOOP

    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
