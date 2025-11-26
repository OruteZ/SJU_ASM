; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 0(Null)로 끝나는 문자열을 AH=02h로 한 글자씩 출력
; =================

.MODEL SMALL
.STACK
.DATA
    message DB "Hello, World!", 0

.CODE
main PROC
    mov ax, @data
    mov ds, ax

    mov si, offset message

print_loop:
    mov dl, [si]        ; 현재 문자
    cmp dl, 0           ; Null이면 종료
    je  done

    mov ah, 02h         ; 문자 1개 출력
    int 21h

    inc si              ; 다음 문자
    jmp print_loop

done:
    mov ax, 4C00h
    int 21h
main ENDP
END main
