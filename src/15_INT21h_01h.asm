; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 01h 로 문자 1개를 AL로 입력받고,
; 그 문자를 AH=02h 로 다시 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    msg1 db "Enter the char: ", '$'
    msg2 db 0Ah, 0Dh, "The char you entered is: ", '$'  ; 줄바꿈 후 안내문

.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax

    ; 09h = DX가 가리키는 문자열을 '$'이 나올 때까지 출력
    mov ah, 09h
    mov dx, offset msg1
    int 21h

    ; 키 입력
    mov ah, 01h
    int 21h
    mov bl, al                 
    ; 입력받은 문자를 잠깐 bl에 보관


    ; 결과출력
    mov ah, 09h
    mov dx, offset msg2
    int 21h

    ; 02h = dl로 들어간 입력한 문자를 한 글자 출력
    mov ah, 02h
    mov dl, bl                 
    int 21h

    ; 프로그램 종료
    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
