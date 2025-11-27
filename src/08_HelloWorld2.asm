; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 0으로 끝나는 문자열을
; 02H 로 한 글자씩 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    message DB "Hello, World!", 0     ; NULL로 문자열 끝을 표시

.CODE
MAIN PROC
    ; ds 세그먼트 레지스터로 @data 주소 옮기기
    mov ax, @data
    mov ds, ax
    mov es, ax                       

    mov cx, 0                        ; CX를 idx로 사용

MAIN_LOOP:
    mov ax, offset message           ; AX = message의 시작 offset
    mov si, ax                       ; SI = message 시작
    add si, cx                       ; SI = message + CX (현재 문자 위치)
    add cx, 1                        ; cx++

    ; AH =02h <- 문자 출력해라, DL=출력할 문자
    mov ah, 02h
    mov dl, [si]                   
    int 21h                        

    ; 문자열 끝(NULL)인지 검사해서 계속/종료 결정
    cmp dl, 0
    jne main_loop

    ; 프로그램 종료 
    mov ax, 4C00h
    int 21h

MAIN ENDP
END MAIN
