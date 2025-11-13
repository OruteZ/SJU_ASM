.MODEL SMALL
.STACK
.DATA
.CODE

; for(int i = 1; i <= 10; i++) ax += i 를 어셈블리어로 구현한 과정
MAIN PROC
    ; FIXED ERROR : ds값을 데이터 세그먼트에 할당해주어야 함
    mov ax, @data
    mov ds, ax
    
    mov cx, 1   ;cx의 초기값 1로 설정
    mov ax, 0   ;ax의 초기값 0로 설정

LOOPS:
    add ax, cx  ;ax에 cx 더하기
    inc cx      ;cx++
    cmp cx, 10  
    jbe LOOPS   ;if(cx > 10) break;
    ; end loop
    
    mov sum, ax ;ax에 누산된 숫자 sum으로 이동

    mov ax, 4c00h ;정상적인 종료 코드 
    int 21h     ;21h 발동

    sum dw ?        ;실행의 결과값을 저장할 변수

MAIN ENDP
END