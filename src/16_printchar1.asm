; ==============================
; 학번 : 21011759
; 이름 : 오재오
;
; Q1-1. LOOP 명령어 없이(A~Z 출력)
; 방법: CX 감소, CMP/JNE로 반복(수동 루프)
; ==============================

.MODEL SMALL
.STACK
.DATA
.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax

    mov cx, 26          ; 26회 반복할 것이기 때문에, cx에 26할당
    mov dl, 41h         ; 'A'

PRINT_NEXT:
    mov ah, 02h
    int 21h
 
    inc dl              ; 다음 문자 (dl ++)
    dec cx              ; 카운트 감소 (cx--)
    cmp cx, 0
    jne PRINT_NEXT      ; CX != 0 이면 계속

    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
