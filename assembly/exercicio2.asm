var1 EQU 0x00  
contador EQU 0x01
resultado EQU 0x02
 
#include p18f4550.inc
 
RES_VECT  CODE    0x0000           
    GOTO    START               

MAIN_PROG CODE                 

START
    MOVLW .60	
    MOVWF var1			; registrador a ser percorrido
    MOVLW .8
    MOVWF contador  	; utilizado como critério de parada do loop
    
LOOP
    RLCF var1			; desloca a variável à esquerda e C recebe o valor mais significativo
    BTFSC STATUS, C		; testa o bit C
    INCF resultado		; se setado, incrementa resultado	
    DECFSZ contador		; decrementa contador em todo loop, se chegar em zero, programa é encerrado
    BRA LOOP			
    GOTO $
   
    END
