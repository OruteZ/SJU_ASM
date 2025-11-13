.MODEL SMALL
.STACK
.DATA
.CODE

; 제대로 동작하지 않을 오류 코드. @data영역에 있어야 할 문자열이 .CODE 세그먼트로 넘어왔다.
; si와 di는 그 인덱스를 전달했으나, 세그먼트 레지스터인 ds와 es가 CODE세그먼트를 겨눌 수 없어
; 제대로 된 복사가 이루어지지 않게 되는 버그 예제
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