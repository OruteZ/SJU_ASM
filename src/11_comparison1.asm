; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 두 값을 CMP로 비교한 뒤
; 같으면 '=' 출력, 다르면 '!=' 출력
; =================

.MODEL SMALL
.STACK
.DATA
.CODE

main PROC
    mov ax, @data
    mov ds, ax

    ; 비교할 값 준비 (원본: 99 vs 1)
    mov bl, 99
    mov al, 1

    ; CMP 결과로 ZF가 결정됨 (같으면 ZF=1)
    cmp bl, al
    jne NOT_EQUAL

EQUAL:
    mov ah, 02h
    mov dl, 3Dh        ; '='
    int 21h
    jmp DONE           ; NOT_EQAUL에 닿지 않도록 DONE으로 점프

NOT_EQUAL:
    mov ah, 02h        ; DL 레지스터 값 출력
    mov dl, 21h        ; '!'
    int 21h

    mov dl, 3Dh        ; '='
    int 21h

DONE:
    mov ax, 4C00h
    int 21h

main ENDP
END main
