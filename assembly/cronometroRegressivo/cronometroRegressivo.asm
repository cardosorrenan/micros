; PIC18F4550 Configuration Bit Settings

; Assembly source line config statements

#include "p18f4550.inc"

; CONFIG1L
  CONFIG  PLLDIV = 1            ; PLL Prescaler Selection bits (No prescale (4 MHz oscillator input drives PLL directly))
  CONFIG  CPUDIV = OSC1_PLL2    ; System Clock Postscaler Selection bits ([Primary Oscillator Src: /1][96 MHz PLL Src: /2])
  CONFIG  USBDIV = 1            ; USB Clock Selection bit (used in Full-Speed USB mode only; UCFG:FSEN = 1) (USB clock source comes directly from the primary oscillator block with no postscale)

; CONFIG1H
  CONFIG  FOSC = INTOSC_HS      ; Oscillator Selection bits (Internal oscillator, HS oscillator used by USB (INTHS))
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
  CONFIG  IESO = OFF            ; Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

; CONFIG2L
  CONFIG  PWRT = OFF            ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG  BOR = ON              ; Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))
  CONFIG  BORV = 3              ; Brown-out Reset Voltage bits (Minimum setting 2.05V)
  CONFIG  VREGEN = OFF          ; USB Voltage Regulator Enable bit (USB voltage regulator disabled)

; CONFIG2H
  CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
  CONFIG  WDTPS = 32768         ; Watchdog Timer Postscale Select bits (1:32768)

; CONFIG3H
  CONFIG  CCP2MX = ON           ; CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
  CONFIG  PBADEN = OFF          ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as digital I/O on Reset)
  CONFIG  LPT1OSC = OFF         ; Low-Power Timer 1 Oscillator Enable bit (Timer1 configured for higher power operation)
  CONFIG  MCLRE = OFF            ; MCLR Pin Enable bit (MCLR pin enabled; RE3 input pin disabled)

; CONFIG4L
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG  LVP = OFF             ; Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
  CONFIG  ICPRT = OFF           ; Dedicated In-Circuit Debug/Programming Port (ICPORT) Enable bit (ICPORT disabled)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

; CONFIG5L
  CONFIG  CP0 = OFF             ; Code Protection bit (Block 0 (000800-001FFFh) is not code-protected)
  CONFIG  CP1 = OFF             ; Code Protection bit (Block 1 (002000-003FFFh) is not code-protected)
  CONFIG  CP2 = OFF             ; Code Protection bit (Block 2 (004000-005FFFh) is not code-protected)
  CONFIG  CP3 = OFF             ; Code Protection bit (Block 3 (006000-007FFFh) is not code-protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot block (000000-0007FFh) is not code-protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM is not code-protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection bit (Block 0 (000800-001FFFh) is not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection bit (Block 1 (002000-003FFFh) is not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection bit (Block 2 (004000-005FFFh) is not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection bit (Block 3 (006000-007FFFh) is not write-protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) are not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot block (000000-0007FFh) is not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM is not write-protected)

; CONFIG7L
  CONFIG  EBTR0 = OFF           ; Table Read Protection bit (Block 0 (000800-001FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection bit (Block 1 (002000-003FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection bit (Block 2 (004000-005FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection bit (Block 3 (006000-007FFFh) is not protected from table reads executed in other blocks)

; CONFIG7H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot block (000000-0007FFh) is not protected from table reads executed in other blocks)

i EQU 0
j EQU 1
k EQU 2
contador EQU 3
 
RES_VECT  CODE    0x0000           
    GOTO    START               
   
START
    NOP
    MOVLW b'00000011'
    MOVWF TRISD   
    MOVLW b'00000000' 
    MOVWF TRISB
    MOVLW b'01100000' ; inicia contagem em 60 minutos
    MOVWF PORTB
   
; Loop principal do programa
LOOP
    BTFSC PORTD,0	; botao responsável por definir o tempo de contagem
    CALL INCREASE_10
    BTFSC PORTD,1	; botao responsável por iniciar a contagem
    CALL START_COUNT   
    BRA LOOP

; Decrementa 10 minutos, -1 na casa das dezenas. 
;   Para realizar a subtraçao, os nibbles são trocados, pois o valor que queremos 
; decrementar são os mais significativos.
INCREASE_10
    SWAPF PORTB
    DECF PORTB
    SWAPF PORTB
    CALL FIT_MSB_REG_CRO
; volta ao programa principal somente quando o botão for despressionado
LOCK 
    BTFSC PORTD,0
    BRA LOCK
    RETURN
    
; O botão de iniciar a contagem foi pressionado
START_COUNT
    MOVLW .60
    MOVWF contador
    DECF PORTB
    CALL FIT_LSB_REG
    CALL FIT_MSB_REG
ATRASO_1min ; realiza 60 vezes o atraso de 1 segundo
    CALL ATRASO_1s
    BTG PORTD,3
    DECFSZ contador
    BRA ATRASO_1min
    MOVLW .0		; variavel contador de segundos iniciado em 60 chegou em 0
    CPFSEQ PORTB
    BRA START_COUNT	 
    BRA ALARM		
    
; contagem chegou em 0, dispara o alarme e espera que um botao seja pressionado
; para reiniciar o cronometro
ALARM
    BTFSC PORTD,0
    BRA RESTART
    BTFSC PORTD,1
    BRA RESTART
    BTG PORTD,2
    CALL ATRASO_25ms
    BRA ALARM
    
; volta ao programa principal somente quando o botão for despressionado
RESTART
    BTFSC PORTD,0
    BRA RESTART
    BTFSC PORTD,1
    BRA RESTART
    BRA START
    
; Faz com que o display das dezenas exiba de 1 à 6.
;   Se os bits mais significativos chegarem em FF na contagem regressiva do cro-
;  nometro, ou seja, quando houve o estouro, será desviado para o valor 6.
FIT_MSB_REG_CRO
    BTFSC PORTB,7
    RETURN
    BTFSC PORTB,6
    RETURN
    BTFSC PORTB,5
    RETURN
    BTFSC PORTB,4
    RETURN
    BSF PORTB,6
    BSF PORTB,5
    RETURN

; Faz com que o display das unidades exiba de 0 à 9.
;   Se os bits menos significativos chegarem em FF na contagem regressiva, ou 
; seja, quando houve o estouro, o valor será desviado para 9.
FIT_LSB_REG
    BTFSS PORTB,3
    RETURN
    BTFSS PORTB,2
    RETURN
    BTFSS PORTB,1
    RETURN
    BSF PORTB,3
    BCF PORTB,2
    BCF PORTB,1
    RETURN

; Faz com que o display das dezenas exiba de 0 à 6.
;   Se os bits mais significativos chegarem em FF na contagem regressiva, ou 
; seja, quando houve o estouro, o valor será desviado para 6.
FIT_MSB_REG
    BTFSS PORTB,7
    RETURN
    BTFSS PORTB,6
    RETURN
    BTFSS PORTB,5
    RETURN
    BTFSS PORTB,4
    RETURN
    BCF PORTB,7
    BSF PORTB,6
    BCF PORTB,5
    BSF PORTB,4
    RETURN
       
; Atraso de 1ms. 
ATRASO_1ms
    MOVLW .30
    MOVWF i
LOOP_1ms
    NOP
    NOP
    NOP
    NOP
    NOP
    DECFSZ i
    BRA LOOP_1ms
    RETURN
    
; Atraso de 25ms
ATRASO_25ms
    MOVLW .25
    MOVWF j
LOOP_25ms
    RCALL ATRASO_1ms
    DECFSZ j
    BRA LOOP_25ms
    RETURN        

; Atraso de 1s
ATRASO_1s
    MOVLW .40
    MOVWF k
LOOP_1s
    RCALL ATRASO_25ms
    DECFSZ k
    BRA LOOP_1s
    RETURN        
    END
