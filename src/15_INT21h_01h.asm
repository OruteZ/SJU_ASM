; =================
; 학번 : 21011759
; 이름 : 오재오
;
; INT 21h / AH=01h 로 문자 1개를 입력받고(AL에 들어옴),
; 그 문자를 AH=02h 로 다시 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    msg1 db "Enter the char: ", '$'
    msg2 db 0Ah, 0Dh, "The char you entered is: ", '$'  ; 줄바꿈(0Ah=LF, 0Dh=CR) 후 안내문

.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax

    ; 안내문 출력 (AH=09h : '$'까지 문자열 출력)
    mov ah, 09h
    mov dx, offset msg1
    int 21h

    ; 문자 1개 입력 (AH=01h : 키 입력 1개를 AL로 받음)
    mov ah, 01h
    int 21h
    mov bl, al                 ; 입력 문자 보관

    ; 결과 안내문 출력
    mov ah, 09h
    mov dx, offset msg2
    int 21h

    ; 입력한 문자 1개 출력 (AH=02h : DL의 문자 1개 출력)
    mov ah, 02h
    mov dl, bl                 
    int 21h

    ; 종료
    mov ax, 4C00h
    int 21h
main ENDP
END main
