; =================
; 학번 : 21011759
; 이름 : 오재오
;
; 별 피라미드를 2중 FOR문처럼 작성하여 출력하는 코드
;  - 바깥 루프: 줄(1~5)
;  - 안쪽 루프: 별 개수만큼 '*' 출력
; =================

.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    mov ax, @data
    mov ds, ax

    mov ah, 02h         ; DL 문자 1개 출력 고정

    mov bl, 1           ; 현재 줄의 별 개수 (1부터 시작)
    mov bh, 5           ; 총 5줄을 BH에 저장 (외부 반복 카운터)

OUTER:
    mov cx, 0           ; 현재 줄의 별 개수만큼 반복할 카운터 설정
    mov cl, bl          ; CX = BL (현재 줄의 별 개수)
                        ; 비트 크기가 맞지 않아 MOV CL, BL 사용
INNER:
    mov dl, '*'
    int 21h
    loop INNER          ; CX-- 후, CX!=0이면 점프
; END INNER LOOP

    ; 줄바꿈 출력
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    inc bl              ; 다음 줄은 별 1개 증가
    dec bh              ; 외부 카운터 감소
    jnz OUTER           ; BH != 0 이면 반복

    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
