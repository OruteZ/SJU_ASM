; =================
; 학번 : 21011759
; 이름 : 오재오
;
; [Q3-2] 위 출력을 LOOP 명령으로 다시 작성
; - msg 배열에 문자를 나열하고, CX만큼 반복 출력
; - 0Ah(Line Feed) 포함
; =================

.MODEL SMALL
.STACK
.DATA
    msg     db 'K','I','M',0Ah,'Y','O','U','N','G',0Ah,'G','A','B'
    MSG_LEN EQU ($ - msg)          ; msg의 바이트 길이(=출력할 문자 개수)

.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax

    mov ah, 02h                   ; [핵심] 문자 1개 출력 서비스
    mov si, offset msg
    mov cx, MSG_LEN

PRINT_LOOP:
    mov dl, [si]                  ; 출력할 문자 1바이트
    int 21h
    inc si
    loop PRINT_LOOP               ; CX--, 0 아니면 반복

    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
