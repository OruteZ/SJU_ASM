.MODEL SMALL
.STACK
.DATA
.CODE

MAIN PROC;
    mov ah, 02h ;
    
    mov dl, 48h ; 'H' (0x48)
    int 21h
    
    mov 