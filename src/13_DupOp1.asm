; =================
; 학번 : 21011759
; 이름 : 오재오
;
; DUP로 '*' 문자를 N번 반복해서 배열로 만들고,
; 09H 로 '$'가 나올 때까지 한 번에 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    msg db 1 dup('*'), '$'      ; '*'를 1번 반복하고, 09h 종료문자 '$'를 뒤에 붙임

.CODE
MAIN PROC
    ; DS 초기화
    mov ax, @data
    mov ds, ax

    ; 09h = DX가 가리키는 문자열을 '$'까지 출력
    mov ah, 09h
    mov dx, offset msg
    int 21h

    ; 프로그램 종료
    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
