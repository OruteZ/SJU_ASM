; =================
; 학번 : 21011759
; 이름 : 오재오
;
; [Q3-1] 0Ah(Line Feed)만 사용해서
; Oh
;     Jae
;         O
; 처럼 아래로 내려가되(0Ah) "열 이동(0Dh)"은 하지 않게 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    mov ax, @data
    mov ds, ax

    mov ah, 02h          ; DL 문자 1개 출력

    ; 1) "Oh"
    mov dl, 'O'
    int 21h
    mov dl, 'h'
    int 21h

    mov dl, 0Ah          ; 다음 줄로만 이동(현재 x좌표 유지)
    int 21h

    ; 2) "Jae" 
    mov dl, 'J'
    int 21h
    mov dl, 'a'
    int 21h
    mov dl, 'e'
    int 21h

    mov dl, 0Ah
    int 21h

    ; 3) "O"
    mov dl, 'O'
    int 21h

    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
