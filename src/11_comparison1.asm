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

MAIN PROC
    mov ax, @data
    mov ds, ax

    ; 비교할 값 준비 (원본: 99 vs 1)
    mov ah, 99
    mov al, 1

    ; 같을경우 아래 줄 EQUAL로 이동함
    ; 그게 아니라면 NOT EQUAL로 이동
    cmp ah, al
    jne NOT_EQUAL

EQUAL:
    mov ah, 02h        ; DL 레지스터 값 출력
    mov dl, 3Dh        ; '='
    int 21h
    int 21h            ; '==' 출력할려고 두 번 함

    jmp DONE           ; NOT_EQAUL에 닿지 않도록 DONE으로 점프

NOT_EQUAL:
    mov ah, 02h        ; DL 레지스터 값 출력
    mov dl, 21h        ; '!'
    int 21h

    mov dl, 3Dh        ; '='
    int 21h
    ;jmp DONE          ; 예제에는 있지만 어짜피 DONE으로 이동하기 떄문에 주석터리

DONE:
    mov ax, 4C00h
    int 21h

MAIN ENDP
END MAIN
