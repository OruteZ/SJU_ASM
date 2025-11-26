; =================
; 학번 : 21011759
; 이름 : 오재오
;
; MESSAGE에 있는 문장을 09 instruction을 통해서 콘솔로 출력하는 코드 
; =================

.MODEL SMALL
.STACK
.DATA
MESSAGE DB "HELLO EVERYBODY ! I AM LEARNING ASSEMBLY LANGUAGE!", "$"

.CODE

MAIN PROC
    ; data 세그먼트의 영역을 ax를 통해서 ds로 옮김
    mov ax, @data
    mov ds, ax
    
    
    mov ah, 09      ;09 = dx 레지스터가 가리키는 문자열 $가 나올 때 까지 출력
    lea dx, MESSAGE ; dx로 MESSAGE의 시작 주소 전달 : lea 사용
    int 21h         ;instruction 실행
    
    mov ax, 4c00h   ; AH 레지스터에 4c값을 넣고 AL 레지스터를 00으로 초기화
    int 21h         ; Instruction 실행 : 4c는 프로그램 종료를 의미
MAIN ENDP
END MAIN