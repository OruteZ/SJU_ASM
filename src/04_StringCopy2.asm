; =================
; 학번 : 21011759
; 이름 : 오재오
;
; DS:SI를 통해 string1을 포인팅하고, ES:DI를 사용해서 string2를 포인팅해 
; string1의 문자열을 string2로 옮기는 코드
; String Copy 1과 다르게 CODE 영역에 해당 변수들이 존재하는 차이점이 있다
; =================
.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC
    mov ax, @data    ;data영역 세그먼트 ax로 당겨와서
    mov ds, ax      ;ds로 넣기
    mov es, ax      ;es에도 넣기
    
    mov cx, 12      ; 12번 돌거임
    lea si, string1 ; string1의 시작점 idx si로 넣기
    lea di, string2  ; string2의 .. .

BEGINLOOP:
    mov al, [si]    ;si가 가리키는 값 al로 발사
    mov [di], al    ;al 경유시켜서 di가 표시하는 영역으로 발사

    inc si  ; si와 di모두 1만큼 위치 증가
    inc di
    dec cx  ; cx 감소
    jnz BEGINLOOP   ; if (cx == 0) break

    ; 복사결과 출력해보기 : ah에 09h명령, dx에 출력할 string2의 시작 인덱스 전달
    mov ah,09h  
    lea dx, string2

    int 21h
    .exit

STRING1 DB "String Copy", "$"
STRING2 DB '?'

MAIN ENDP
END MAIN