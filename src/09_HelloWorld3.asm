; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 0로 끝나는 문자열을
; SI를 1씩 증가시키며 INT 21h / AH=02h 로 한 글자씩 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    message DB "Hello, World!", 0     ; 0(= NULL)로 문자열 끝 표시

.CODE
MAIN PROC
    ; ds 세그먼트 레지스터로 @data 주소 옮기기
    mov ax, @data
    mov ds, ax
    mov es, ax                       

    ;  SI를 message 시작주소로 잡고, dec si 해둔 뒤
    ;  루프 첫 줄에서 inc si 하여 첫 글자부터 읽음
    mov si, offset message
    dec si

MAIN_LOOP:
    inc si                           ; 다음(현재) 문자 위치로 이동

    ; 02h = 문자 출력, DL=출력할 문자 1개
    mov ah, 02h
    mov dl, [si]                     ; [si]로 하면 알아서 DS:SI에서 읽음
    int 21h                          ; DL의 문자를 콘솔에 출력

    ; 반복문 종료 조건으로 NULL 검사
    cmp dl, 0
    jne MAIN_LOOP

    ; 프로그램 종료
    mov ax, 4C00h
    int 21h

MAIN ENDP
END MAIN
