bit EQU 0
low_bit EQU 1
high_bit EQU 2
sum EQU 3
 
RES_VECT  CODE    0x0000       
    GOTO    START                 

#include "p18f4550.inc"
    
MAIN_PROG CODE        

START
    MOVLW .156	
    MOVWF bit		
    CALL set_lowbit	; despeja no endereço 1 os bits menos significativos 
    CALL set_highbit	; despeja no endereço 2 os bits mais significativos 
    CALL sum_bits	; realiza a soma das duas variáveis

    goto $
   
set_lowbit
    RRCF bit		; desloca a variável à direita e C recebe o valor menos significativo
    BTFSC STATUS, C	; testa o bit C
    BSF low_bit,0	; se setado, ativa o bit 0 da variavel low_bit
    ; repete o processo mais três vezes
    RRCF bit
    BTFSC STATUS, C
    BSF low_bit,1  
    RRCF bit
    BTFSC STATUS, C
    BSF low_bit,2
    RRCF bit
    BTFSC STATUS, C 
    BSF low_bit,3
    RETURN
    
set_highbit
    RRCF bit		; desloca a variável à direita e C recebe o valor menos significativo
    BTFSC STATUS, C	; testa o bit C
    BSF high_bit,0	; se setado, ativa o bit 0 da variavel high_bit
    ; repete o processo mais três vezes
    RRCF bit		
    BTFSC STATUS, C
    BSF high_bit,1   
    RRCF bit
    BTFSC STATUS, C
    BSF high_bit,2
    RRCF bit
    BTFSC STATUS, C
    BSF high_bit,3
    RETURN
   
sum_bits
    MOVLW .0
    ADDWF high_bit, W
    ADDWF low_bit, W
    MOVWF sum
    ;	como a variável bit (0x00) acaba mudando de valor devido aos deslocamentos
    ; ela será setada com seu valor original para melhor visualização no File Registers
    MOVLW .255		
    MOVWF bit	
    RETURN

    
END
