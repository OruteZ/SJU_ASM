; =================
; 학번 : 21011759
; 이름 : 오재오
;
; [Q3-1] 0Ah(Line Feed)만 사용해서
; KIM
;    YOUNG
;        GAB
; 처럼 다음 줄로 내려가되 "열 이동(0Dh)"은 안 하게 출력하는 코드
; =================

.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    mov ax, @data
    mov ds, ax

    mov ah, 02h            ; [핵심] DL에 있는 문자 1개 출력

    mov dl, 'K'            ; KIM 출력
    int 21h
    mov dl, 'I'
    int 21h
    mov dl, 'M'
    int 21h

    mov dl, 0Ah            ; [핵심] Line Feed: 줄만 바꾸고 column은 유지
    int 21h

    mov dl, 'Y'            ; YOUNG 출력 (KIM 끝 column에서 시작)
    int 21h
    mov dl, 'O'
    int 21h
    mov dl, 'U'
    int 21h
    mov dl, 'N'
    int 21h
    mov dl, 'G'
    int 21h

    mov dl, 0Ah            ; 다음 줄로 (column 유지)
    int 21h

    mov dl, 'G'            ; GAB 출력 (YOUNG 끝 column에서 시작)
    int 21h
    mov dl, 'A'
    int 21h
    mov dl, 'B'
    int 21h

    mov ax, 4C00h
    int 21h
MAIN ENDP
END MAIN
