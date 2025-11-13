.MODEL SMALL
.STACK
.DATA
    message DB "Hello, World!", 0
.CODE
MAIN PROC;
    ; 기본 : ds레지스터와 es레지스터에 @data 영역 세그먼트 옮기기
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov cx, 0

MAIN_LOOP:
    mov ax, offset message
    mov si, ax
    
    add si, ax
    add cx, 1 ; == inc cx
    
    mov ah, 02h
    mov dl, [si]
    int 21h
