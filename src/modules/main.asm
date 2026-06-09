.nolist
.include "m328Pdef.inc"
.list

.equ DEZENA_PIN = PC3
.equ UNIDADE_PIN = PC4
.equ DISPLAY = PORTB
.equ DISPLAY_G_PIN = PD3

.equ LED_BRANCO = PC0
.equ LED_VERDE = PC1
.equ LED_VERMELHO = PC2

.def UNIDADE = R17
.def DEZENA = R18

.def GANHADOR_UNIDADE = R20
.def GANHADOR_DEZENA = R21

.def SALTO_DEZENAS = R22
.def RESULTADO_COR = R23

.def TEMP = R25
.def LOOP = R24

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

	LDI R16,0b000001000
	OUT DDRD,R16 ; botão como entrada e pin g do display como saída 
    LDI R16,0b000000100 
    OUT PORTD,R16 ; pull up do botão

    LDI R16,0xFF
	OUT DDRB,R16 ; configura display como saída
    OUT DDRC,R16 ; configurando leds e transitores como saída

	; Inicializa os displays
	LDI UNIDADE,0
	LDI DEZENA,0
	RCALL start_mux

	RJMP start_sort	

interruptRoutine:	
	RCALL start_anim
	MOV UNIDADE,GANHADOR_UNIDADE
	MOV DEZENA,GANHADOR_DEZENA
	RCALL LIGAR_LED   

    RETI

.nolist
.include "display.inc"
.include "corLed.inc"
.include "sorteio.inc"
.include "animacao.inc"
.list	