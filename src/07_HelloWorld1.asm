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

main PROC
    MOV AH, 02h     ; 02h = DL 레지스터 값 출력

    ; "Hello, World!"
    MOV DL, 48h     ; 'H' (0x48)
    INT 21h

    MOV DL, 65h     ; 'e' (0x65)
    INT 21h

    MOV DL, 6Ch     ; 'l' (0x6C)
    INT 21h

    MOV DL, 6Ch     ; 'l' (0x6C)
    INT 21h

    MOV DL, 6Fh     ; 'o' (0x6F)
    INT 21h

    MOV DL, 2Ch     ; ',' (0x2C)
    INT 21h

    MOV DL, 20h     ; ' ' (0x20)
    INT 21h

    MOV DL, 57h     ; 'W' (0x57)
    INT 21h

    MOV DL, 6Fh     ; 'o' (0x6F)
    INT 21h

    MOV DL, 72h     ; 'r' (0x72)
    INT 21h

    MOV DL, 6Ch     ; 'l' (0x6C)
    INT 21h

    MOV DL, 64h     ; 'd' (0x64)
    INT 21h

    MOV DL, 21h     ; '!' (0x21)
    INT 21h

    MOV AH, 4Ch
    INT 21h

main ENDP
END main
