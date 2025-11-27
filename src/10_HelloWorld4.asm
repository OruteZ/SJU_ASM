; =================
; 학번 : 21011759
; 이름 : 오재오
;
; INT 21h / AH=09h 로 '$'가 나올 때까지 문자열을 한 번에 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    message DB "Hello, World! $"

.CODE
MAIN PROC
    ; DS 초기화 (data 세그먼트 사용 준비)
    mov ax, @data
    mov ds, ax
    mov es, ax              ; 사실상 es는 사용 안함

MAIN_LOOP:                  ; 사실상 사용 안함
    mov ah, 09h             ; 09h = DX가 가리키는 문자열을 '$'까지 출력
    mov dx, offset message
    int 21h

    ; 프로그램 종료
    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
