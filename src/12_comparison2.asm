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

main PROC
    mov ax, @data
    mov ds, ax

    ; 비교할 값 준비 (원본: 99 vs 1)
    mov bl, 99
    mov al, 1

    ; JG/JLE 계열은 "부호 있는(signed)" 비교 점프
    ; bl > al 이면 GREATER로, 아니면 NOT_GREATER로
    cmp bl, al
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

DONE:
    mov ax, 4C00h
    int 21h

main ENDP
END main
