/*
 * File: newmain3.c
 * Author: RENAN CARDOSO
 *
 * Created on 10 de Junho de 2019, 23:02
 */

#define _XTAL_FREQ 4000000
#include <xc.h>

void decrease_10m(void);
void init_count(void);
void alarm_activate(void);
void delay_1min(void);
void decrement_disp(void);

int msb = 6; // Bit mais significativo do contador [6 .. 0]
int lsb = 0; // Bit menos significativo do contador [9 .. 0]

void main(void) {
    
    TRISD = 0x03; 
    PORTD = 0x00;
    TRISB = 0x00;
    PORTB = 0x60; // Representa o 60 (decimal) exibido no display

    while(1) {
        // Caso o botão em RD0 for acionado, decrementar 10 no display
        if (PORTDbits.RD0) {
            decrease_10m();
            while (PORTDbits.RD0) __delay_ms(100); // Dispositivo para assegurar apenas um 'push'
        }
        // Caso o botão em RD0 for acionado, iniciar a contagem
        if (PORTDbits.RD1) init_count();
    }
    return;
}


void decrease_10m(void) {
    msb--;
    if (!msb) msb = 6; // Quando no display estiver em 1 e o botão for apertado
    PORTB = (msb << 4) | lsb; // Atualiza display
}


void init_count(void) {
    for (int min = msb * 10; min > 0 ; min--) { // Executa a quantidade de minutos selecionado pelo usuário
        decrement_disp(); // Decrementa e atualiza o valor no display
        delay_1min(); 
    }
    alarm_activate();
    PORTB = 0x60; // Após o acionamento do alarme, retorna ao valor inicial
    
    //Fim do programa
}


// Core do programa
//  Aqui é calculado o valor do bit mais e menos significativo para ser inserido no display
void decrement_disp(){ 
    // Lógica Decimal
    if (lsb) lsb--;
    else {
       lsb = 9;
       msb--;
    }
    PORTB = (msb << 4) | lsb; // Insere no display
}


void alarm_activate(){
    PORTDbits.RD2 = 1;
    __delay_ms(5000);
    PORTDbits.RD2 = 0;
}


void delay_1min(){
    for (int sec = 60 ; sec > 0 ; sec--) {            
        __delay_ms(10);   
        PORTDbits.RD3 ^= 1; // O pino 3 do PORTD existe um led para indicar os segundos corridos
    }
}
