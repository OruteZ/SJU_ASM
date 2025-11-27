; =================
; 학번 : 21011759
; 이름 : 오재오
;
; DUP로 '*'를 여러 번 만들고,
; 0Ah, 0Dh을 끼워서 줄바꿈한 뒤
; 09H 로 '$'까지 한 번에 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    msg db 1 dup('*'), 0Ah, 0Dh         ; 0Ah=LF, 0Dh=CR 줄바꿈 조합
        db 2 dup('*'), 0Ah, 0Dh, '$'    ; 두 번째 줄 + 종료문자 '$'

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
