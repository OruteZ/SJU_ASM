; =================
; 학번 : 21011759
; 이름 : 오재오
;
; DL 레지스터에 'A' 문자를 할당하고 콘솔로 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    mov dl, 'A' ; or mov dl, 41h

    mov ah, 2   ; int 21 + ah 2 : DL 레지스터의 값을 CHAR로 콘솔로 출력
    int 21h
    
    mov ax, 4c00h   ; AH 레지스터에 4c값을 넣고 AL 레지스터를 00으로 초기화
    int 21h         ; Instruction 실행 : 4c는 프로그램 종료를 의미
MAIN ENDP
END MAIN