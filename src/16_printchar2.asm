; ==============================
; 학번 : 21011759
; 이름 : 오재오
;
; Q1-2. LOOP를 사용해서 A~Z 출력하기
; 출력: AB..........YZ  (즉 A~Z 전부)
; 조건: int 21h / AH=02h, 출력 문자는 DL
; ==============================

.MODEL SMALL
.STACK
.DATA
.CODE
MAIN PROC
    ; DS 초기화
    mov ax, @data
    mov ds, ax

    mov cx, 26          ; 총 26글자 출력
    mov dl, 41h         ; 시작 문자 'A'

PRINT_NEXT:
    mov ah, 02h         ; 서비스 02h: DL 문자 출력
    int 21h

    inc dl              ; 다음 문자로 (A->B->...->Z)
    loop PRINT_NEXT     ; CX--, CX!=0이면 점프

    ; 프로그램 종료
    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
