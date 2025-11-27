; =================
; 학번 : 21011759
; 이름 : 오재오
;
; INT 21h의 02h 기능을 사용해서,
; DL 레지스터에 넣은 아스키 문자들을 한 글자씩 출력하여
; "Hello, World!" 를 콘솔에 출력
; =================

.MODEL SMALL
.STACK
.DATA               
.CODE

MAIN PROC
    mov ah, 02h     ; 02h = DL 레지스터 값 출력

    ; "Hello, World!"
    mov dl, 48h     ; 'H' 
    int 21h

    mov dl, 65h     ; 'e' 
    int 21h

    mov dl, 6Ch     ; 'l' 
    int 21h

    mov dl, 6Ch     ; 'l'
    int 21h

    mov dl, 6Fh     ; 'o' 
    int 21h

    mov dl, 2Ch     ; ',' 
    int 21h

    mov dl, 20h     ; ' ' 
    int 21h

    mov dl, 57h     ; 'W' 
    int 21h

    mov dl, 6Fh     ; 'o' 
    int 21h

    mov dl, 72h     ; 'r' 
    int 21h

    mov dl, 6Ch     ; 'l' 
    int 21h

    mov dl, 64h     ; 'd' 
    int 21h

    mov dl, 21h     ; '!'
    int 21h

    mov ah, 4Ch
    int 21h

MAIN ENDP
END MAIN
