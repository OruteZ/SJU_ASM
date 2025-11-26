; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 코드 설명
; =================

.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    ; data 세그먼트의 영역을 ax를 통해서 ds로 옮김
    mov ax, @data
    mov ds, ax
    
    ; 여기서 할거 하셈
    
    mov ax, 4c00h   ; AH 레지스터에 4c값을 넣고 AL 레지스터를 00으로 초기화
    int 21h         ; Instruction 실행 : 4c는 프로그램 종료를 의미
MAIN ENDP
END MAIN