; =================
; 학번 : 21011759
; 이름 : 오재오
;
; CMP로 두 값을 비교한 뒤
; (signed 비교) 크면 '>' 출력, 크지 않으면 '<=' 출력
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

    ; JG/JLE 계열은 SIGNED 값 비교 점프
    ; ah > al 이면 GREATER로, 아니면 NOT_GREATER로
    cmp ah, al
    jg  GREATER

NOT_GREATER:
    mov ah, 02h
    mov dl, 3Ch        ; '<'
    int 21h
    
    mov dl, 3Dh        ; '='
    int 21h
    jmp DONE

GREATER:
    mov ah, 02h
    mov dl, 3Eh        ; '>'
    int 21h
    ;jmp DONE          ; 예제에는 있지만 어짜피 DONE으로 이동하기 떄문에 주석터리

DONE:
    mov ax, 4C00h      ; AL값이 0이 아니기 때문에 AX를 전체다 바꿈
    int 21h

MAIN ENDP
END MAIN
