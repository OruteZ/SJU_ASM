; =================
; 학번 : 21011759
; 이름 : 오재오
;
; DS:SI를 통해 string1을 포인팅하고, ES:DI를 사용해서 string2를 포인팅해 
; string1의 문자열을 string2로 옮기는 코드
; =================
.MODEL SMALL
.STACK
.DATA
STRING1 DB "string copy", "$"
STRING2 DB '?'

.CODE
MAIN    PROC
    MOV AX, @DATA   ; DATA의 시작지점AX로 이동
    MOV DS, AX      ; DS로 옮겨서 STRING 시작지점 포인팅
    MOV ES, AX      ; ES로 AX로 우선 세팅
    
    mov cx, 12      ; 수정사항 : 13->12 : $를 포함하여 총 카피 길이는 12다.
                    ; 13을 할당할경우 인덱스를 하나 넘어 String2에 들어간 'S' 가 추가로 복사되어 메모리 낭비 발생

    lea si, string1 ; ds:si와 대응되도록 si에 string1의 시작점 (인덱스0) 할당
    lea di, string2 ; es:di와 대응되는 di에 string2의 시작점 (인덱스0) 할당
    
stringloop:
    mov al,[si]     ; si가 가리키는 char를 al로 옮김
    mov [di], al    ; di가 가리키는 char를 al로 변경
    
    inc si          ; si++
    inc di          ; di++
    dec cx          ; cx-- (if cx < 0 break)
    jnz stringloop
    
    ; string2 복사 잘 되었는지 출력준비
    mov ah, 09h      ; string 출력 명령
    lea dx, string2 ; 09h의 명령은 dx에 있는 string을 출력하도록 명령
    int 21h
    .EXIT
MAIN  ENDP
END MAIN