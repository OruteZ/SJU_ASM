; =================
; 학번 : 21011759
; 이름 : 오재오
;
; [Q3-2] 위 출력을 LOOP로 작성 (문자 배열 + 0Ah 포함)
; =================

.MODEL SMALL
.STACK
.DATA
    msg     db "Oh",0Ah,"Jae",0Ah,"O"
    MSG_LEN EQU ($ - msg)

.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax

    mov ah, 02h
    mov si, offset msg
    mov cx, MSG_LEN

PRINT_LOOP:
    mov dl, [si]
    int 21h
    inc si
    loop PRINT_LOOP

    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
