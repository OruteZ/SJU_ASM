; =================
; 학번 : 21011759
; 이름 : 오재오
;
; DUP 지시어로 '*'를 여러 번 만들고,
; 0Ah(LF), 0Dh(CR)을 끼워서 줄바꿈(처럼) 출력한 뒤
; INT 21h / AH=09h 로 '$'까지 한 번에 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    msg db 1 dup('*'), 0Ah, 0Dh      ; 0Ah=LF, 0Dh=CR (ASCII 제어문자)
    db  2 dup('*'), 0Ah, 0Dh, '$'    ; 두 번째 줄 + 종료문자 '$' (09h는 '$'까지 출력)

.CODE
main PROC
    ; DS 초기화
    mov ax, @data
    mov ds, ax

    ; DOS 문자열 출력 (AH=09h): DX가 가리키는 문자열을 '$'까지 출력
    mov ah, 09h
    mov dx, offset msg
    int 21h

    ; 프로그램 종료
    mov ax, 4C00h
    int 21h
main ENDP
END main
