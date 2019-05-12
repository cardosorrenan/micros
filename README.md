
## Descrição
  O repo contém as atividades e projetos desenvolvidos no decorrer da disciplina **Microcontroladores**, ministrada pelo professor [Marcelo M. S. Souza](https://github.com/mmssouza) em 2019.1.
  
## Instruções para Assembly

### Manipular bits em registro

|Instrução|Parâmetros|Descrição|Mais sobre|
|:-:|:-:|:-:|:-:|
|**BCF**| file register f, nº do bit b | Zera o bit b em f | [BCF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BCF.html)
|**BSF**|  file register f, nº do bit b | Ativa o bit b em f | [BSF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BSF.html)
|**BTG**|  file register f, nº do bit b | Troca o valor do bit b em f | [BTG](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BTG.html)
|**INCF**|  file register f | Incrementa f | [INCF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/INCF.html)
|**DECF**|  file register f | Decrementa f | [DECF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/DECF.html)
|**RLCF**|  file register f | Rotaciona f à esquerda com Carry bit | [RLCF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/RLCF.html)
|**RRCF**|  file register f | Rotaciona f à direita com Carry bit | [RRCF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/RRCF.html)
|**SWAPF**| file register f  | Troca os MSB com LSB de f (nibbles) | [SWAPF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/SWAPF.html)

### Movimentação de dados 

|Instrução|Parâmetros|Descrição|Mais sobre|
|:-:|:-:|:-:|:-:|
|**MOVLW**| constante c | Move c de 8 bits para o registrador w* | [MOVLW](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/MOVLW.html)|
|**MOVWF**| file register f | Move o conteúdo de w para f | [MOVWF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/MOVWF.html)
|**MOVFF**| file register f1, f2 | Move o conteúdo de f1 para f2 | [MOVFF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/MOVFF.html)|
|**MOVF**| file register f | Move o conteúdo de f para o registrador w | [MOVF](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/MOVWF.html)

###### Registrador W*: O *registrator Work* age como um intermediador para troca de dados entre registradores. A arquitetura do PIC exige que ele seja usado.

### Desvio de execução

|Instrução|Parâmetros|Descrição|Mais sobre|
|:-:|:-:|:-:|:-:|
|**BTFSS**|  file register f, nº do bit b | Pula próx instrução se o bit b em f for 1 | [BTFSS](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BTFSS.html)
|**BTFSC**|  file register f, nº do bit b | Pula próx instrução se o bit b em f for 0 | [BTFSC](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BTFSC.html)
|**INCFSZ**| file register f | Incrementa f e salta se f for 0 | [INCFSZ](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/INCFSZ.html)
|**DECFSZ**| file register f | Decrementa f e salta se f for 0 | [DECFSZ](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/DECFSZ.html)
|**CPFSEQ**| file register f | Compara f com W, salta se igualdade | [CPFSEQ](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/CPFSEQ.html)
|**BRA**| Rótulo L | Desvio relativo ao endereço de L | [BRA](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/BRA.html)
|**GOTO**| Rótulo L | Desvio absoluto ao endereço de L | [GOTO](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/GOTO.html)
|**CALL**| Rótulo L | Desvio ao endereço de L e guarda o endereço de retorno na pilha | [CALL](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/CALL.html)
|**RCALL**| Rótulo L | Alguém explica | [RCALL](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/RCALL.html)
|**RETURN**| | Volta para o endereço de retorno na pilha | [RETURN](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/RETURN.html)|

### Outros

|Instrução|Parâmetros|Descrição|Mais sobre|
|:-:|:-:|:-:|:-:|
|**NOP**| | Gasta um ciclo | [NOP](http://technology.niagarac.on.ca/staff/mboldin/18F_Instruction_Set/NOP.html)|
|**EQU**| n, a | Associa um nome n a um endereço de memória | [EQU](http://www.keil.com/support/man/docs/armasm/armasm_dom1361290008953.htm)


[Acesso Datasheet MPASM Assembler](http://ww1.microchip.com/downloads/en/devicedoc/33014j.pdf)

