; =================
; 학번 : 21011759
; 이름 : 오재오
;
; LOOP을 사용해서 INT 21h (AH=02h)로 A~Z 출력
; 출력 결과: ABCDEFGHIJKLMNOPQRSTUVWXYZ
; =================

.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    mov ax, @data
    mov ds, ax

    ; [핵심] AH=02h : DL 문자 1개 출력
    mov ah, 02h

    mov dl, 41h      ; 시작 문자 'A'
    mov cx, 26        ; A~Z 총 26개 출력

PRINT_LOOP:
    int 21h           ; DL 출력
    inc dl            ; 다음 문자로
    loop PRINT_LOOP   ; CX-- 후, CX!=0이면 점프

    ; 종료
    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
