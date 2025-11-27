; =================
; 학번 : 21011759
; 이름 : 오재오
;
; DUP로 별(*) 1~5개 + 줄바꿈 문자열을 만들어두고
; 09h 로 '$'까지 한 번에 출력
; =================

.MODEL SMALL
.STACK
.DATA
    ; 별(*) 1~5개 + 줄바꿈(0Dh,0Ah) + 종료문자('$')
    msg db 1 dup('*'), 0Dh, 0Ah
        db 2 dup('*'), 0Dh, 0Ah
        db 3 dup('*'), 0Dh, 0Ah
        db 4 dup('*'), 0Dh, 0Ah
        db 5 dup('*'), 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    ; DS 초기화
    mov ax, @data
    mov ds, ax

    ; 09H = DX가 가리키는 문자열을 '$'까지 출력
    mov ah, 09h
    mov dx, offset msg
    int 21h

    ; 프로그램 종료
    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
