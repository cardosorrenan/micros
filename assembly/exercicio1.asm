op1_high EQU 0	
op1_low EQU 1
op2_high EQU 3
op2_low EQU 4
ans_overflow EQU 6
ans_high EQU 7
ans_low EQU 8

#include "p18f4550.inc"

RES_VECT  CODE    0x0000           
    GOTO    START               

START
    ; op1 terá o valor: 24551 (01011111 11100111)
    ; op2 terá o valor: 41924 (10100011 11000100)
    MOVLW .95    
    MOVWF op1_high		
    MOVLW .231
    MOVWF op1_low		; portanto, (op1_high , op1_low) => (95, 231) 
    MOVLW .163                 
    MOVWF op2_high		
    MOVLW .196
    MOVWF op2_low		; portanto, (op2_high, op2_low) => (163, 196)

    MOVLW .0			
    ADDWF op1_low, w		
    ADDWFC op2_low, w		; W = op2_low + op2_high, e seta carry bit C se houve estouro
    MOVWF ans_low	
    MOVLW .0	
    
    BTFSC STATUS, C		; Testa o bit C, se setado, W é incrementado
    ADDLW .1
    ADDWFC op1_high, w
    ADDWFC op2_high, w		; W = W + op1_low + op2_high, e seta carry bit C se houve estouro
    MOVWF ans_high	
    
    BTFSC STATUS, C		;  Testa o bit C, se setado, ans_overflow é incrementado
    INCF ans_overflow
    
    ; Resposta = (ans_overflow, ans_high, ans_low) => (1, 00100000, 10101011)
    ; op1 + op2 = Resposta
    ; 24551 + 41924 = 66475
   
    GOTO $
    END
