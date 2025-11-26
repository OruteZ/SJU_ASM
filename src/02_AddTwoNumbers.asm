; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 두 숫자를 입력받아 세번째 변수에 저장하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
    FLDD DW 215     ;첫 숫자 215
    FLDE DW 125     ;두번째 숫자 125
    FLDF DW ?       ; 더한 결과값을 저장할 변수, 초기값 비어있음
.CODE
MAIN PROC
    ; data 세그먼트의 영역을 ax를 통해서 ds로 옮김
    mov ax, @data
    mov ds, ax

    mov ax, FLDD    ; ax로 FLDD의 값 215 이동
    add ax, FLDE    ; ax에 FLDE값 누산 덧셈
    mov FLDF, ax    ; 더한 결과를 FLDF로 이동

    ; AH에 4C 할당후 종료
    mov ax, 4c00h
    int 21h
MAIN ENDP
END MAIN