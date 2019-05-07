
## Descrição
  O repo contém as práticas e projetos desenvolvidos no decorrer da disciplina de **Microcontroladores**, ministrada pelo professor [Marcelo M. S. Souza](https://github.com/mmssouza) em 2019.1.
  
---

## Material

 ### Práticas
   * **1º Prática**: [PiscaLed](https://github.com/cardosorrenan/microcontroladores-pic/tree/master/src/pratica01)

   * **2º Prática**: [PiscaLedSwitch](https://github.com/cardosorrenan/microcontroladores-pic/tree/master/src/pratica02)
   
---

## Instruções Assembly

### Manipular bits em registro

||Parâmetros|Descrição|Mais sobre|
|:-:|:-:|:-:|:-:|
|**BCF**| file register f, nº do bit b | Zera o bit b em f | [BCF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BCF.html)
|**BSF**|  file register f, nº do bit b | Ativa o bit b em f | [BSF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BSF.html)
|**BTG**|  file register f, nº do bit b | Troca o valor do bit b em f | [BTG](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BTG.html)
|**INCF**|  file register f | Incrementa f | [INCF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/INCF.html)
|**DECF**|  file register f | Decrementa f | [DECF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/DECF.html)

### Movimentação de dados 

||Parâmetros|Descrição|Mais sobre|
|:-:|:-:|:-:|:-:|
|**MOVLW**| constante c | Move c de 8 bits para o registrador w* | [MOVLW](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/MOVLW.html)|
|**MOVWF**| file register f | Move o conteúdo de w para f | [MOVWF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/MOVWF.html)
|**MOVFF**| file register f1, f2 | Move o conteúdo de f1 para f2 | [MOVFF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/MOVFF.html)|
|**MOVF**| file register f | Move o conteúdo de f para o registrador w | [MOVF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/MOVWF.html)

###### Registrador W*: O *registrator Work* age como um intermediador para troca de dados entre registradores. A arquitetura do PIC exige que ele seja usado.

### Desvio de execução

||Parâmetros|Descrição|Mais sobre|
|:-:|:-:|:-:|:-:|
|**BTFSS**|  file register f, nº do bit b | Pula próx instrução se o bit b em f for 1 | [BTFSS](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BTFSS.html)
|**BTFSC**|  file register f, nº do bit b | Pula próx instrução se o bit b em f for 0 | [BTFSC](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BTFSC.html)
|**INCFSZ**| file register f | Incrementa f e salta se f for 0 | [INCFSZ](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/INCFSZ.html)
|**DECFSZ**| file register f | Decrementa f e salta se f for 0 | [DECFSZ](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/DECFSZ.html)
|**BRA**| file register f | Desvio relativo ao endereço f | [BRA](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BRA.html)
|**GOTO**| file register f | Desvio absoluto ao endereço f | [GOTO](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/GOTO.html)
|**CALL**| file register f | Desvio ao endereço f e guarda o endereço de retorno na pilha | [CALL](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/CALL.html)
|**RETURN**| | Volta para o endereço de retorno na pilha | [RETURN](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/RETURN.html)|

### Outros

||Parâmetros|Descrição|Mais sobre|
|:-:|:-:|:-:|:-:|
|**NOP**| | Gasta um ciclo | [NOP](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/NOP.html)|
|**EQU**| n, a | Associa um nome n a um endereço de memória | [EQU](http://www.keil.com/support/man/docs/armasm/armasm_dom1361290008953.htm)

[Acesso Datasheet MPASM Assembler](http://ww1.microchip.com/downloads/en/devicedoc/33014j.pdf)

