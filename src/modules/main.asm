.nolist
.include "m328Pdef.inc"
.list

.equ DEZENA_PIN = PB5
.equ UNIDADE_PIN = PB4
.equ DISPLAY = PORTC

.def UNIDADE = R17
.def DEZENA = R18

.def GANHADOR_UNIDADE = R20
.def GANHADOR_DEZENA = R21

.def SALTO_DEZENAS = R22
.def RESULTADO_COR = R23

.ORG 0x0000 		 
JMP main  

.ORG 0x0002 		  
JMP interruptRoutine  

main:
    LDI SALTO_DEZENAS, 0xA
    LDI R16,HIGH(RAMEND)  
    OUT SPH,R16  
    LDI R16,LOW(RAMEND)  
    OUT SPL,R16 		 

    LDI R16,0x02 		  
    STS EICRA,R16		

    LDI R16,0x01		
    OUT EIMSK,R16		
    SEI 				  

	LDI R16,0x00
	OUT DDRD,R16 ; botão como entrada
    LDI R16,0b000000100 
    OUT PORTD,R16 ; pull up do botão

    LDI R16,0xFF
	OUT DDRC,R16 ; configura display como saída
    OUT DDRB,R16 ; configurando leds e transitores como saída
	RJMP start_sort	

interruptRoutine:	
	MOV UNIDADE,GANHADOR_UNIDADE
	MOV DEZENA,GANHADOR_DEZENA
	RCALL LIGAR_LED
    ; RCALL AnimacaoSorteio
    ; RCALL MostrarGanhador 
    ; RCALL AcenderLed -> mudar nomes quarta       

    RETI

.nolist
.include "display.inc"
.include "corLed.inc"
.include "sorteio.inc"
.list	