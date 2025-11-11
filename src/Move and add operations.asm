; ADD TWO numbers and store the results into the third vatiable
TITLE A04ASM1 (EXE) Move and add operations

.MODEL SMALL

;------STACK------
.STACK
;------DATA-------
.DATA
    FLDD    DW 215
    FLDE    DW 125
    FLDF    DW ?
;------------------

.CODE
MAIN    PROC
    MOV AX, @DATA   ;DATA 시작주소 받기
    MOV DS, AX      ; DS 세그먼트 DATA로 맞추기
    
    MOV AX, FLDD    ; 첫 변수 215 AX로 전송
    ADD AX, FLDE    ; 두 번쨰 변수 AX 125 가져와서 ADD
    MOV FLDF, AX    ; ADD 결과 FLDF에 저장

    MOV AX,4C00H    ; 종료 코드 4C00H AX로 전송
    INT 21h         ; 끝
MAIN    ENDP
    END MAIN

