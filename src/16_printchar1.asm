; =================
; 학번 : 21011759
; 이름 : 오재오
;
; LOOP 없이,
; CX를 카운터로 사용해서 A~Z를 출력하는 코드
; (dec cx / jnz 로 반복)
; =================

.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    mov ax, @data
    mov ds, ax

    mov ah, 02h        ; DL 문자 1개 출력
    mov dl, 41h        ; 시작 문자 'A'
    mov cx, 26         ; 총 26글자

PRINT_LOOP:
    int 21h            ; DL 출력
    inc dl             ; 다음 문자
    dec cx             ; 카운터 감소
    jnz PRINT_LOOP     ; 0이 아니면 계속

    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
