.nolist
.include "m328Pdef.inc"
.list

; Definições de hardware
.equ DEZENA_PIN = PC3
.equ UNIDADE_PIN = PC4
.equ DISPLAY = PORTB
.equ DISPLAY_G_PIN = PD3

.equ LED_BRANCO = PC0
.equ LED_VERDE = PC1
.equ LED_VERMELHO = PC2


; Registradores utilizados
.def UNIDADE = R17
.def DEZENA = R18

.def GANHADOR_UNIDADE = R20
.def GANHADOR_DEZENA = R21

.def SALTO_DEZENAS = R22
.def RESULTADO_COR = R23

.def TEMP = R25
.def LOOP = R24

; Vetor de reset

.ORG 0x0000 		 
JMP main  

; Vetor da interrupção INT0

.ORG 0x0002 		  
JMP interruptRoutine  

main:
    ; Valor utilizado na lógica de conversão das dezenas
    LDI SALTO_DEZENAS, 0xA

    ; Inicialização da pilha (stack)
    LDI R16,HIGH(RAMEND)  
    OUT SPH,R16  
    LDI R16,LOW(RAMEND)  
    OUT SPL,R16 		 

    ; Configura INT0 para disparar na borda de descida
    ; (quando o botão é pressionado)
    LDI R16,0x02 		  
    STS EICRA,R16		

    ; Habilita a interrupção externa INT0
    LDI R16,0x01		
    OUT EIMSK,R16		
    SEI 				  

    ; PD2 = botão (entrada)
    ; PD3 = segmento G do display (saída)
	LDI R16,0b000001000
	OUT DDRD,R16  

    ; Ativa resistor pull-up interno do botão 
    LDI R16,0b000000100 
    OUT PORTD,R16 

    ; Configura display e LEDs como saída
    LDI R16,0xFF
	OUT DDRB,R16
    OUT DDRC,R16 

	; Inicializa os displays
	LDI UNIDADE,0
	LDI DEZENA,0
	RCALL start_mux

	RJMP start_sort	

; Executada quando o botão é pressionado
interruptRoutine:	
	; Executa animação visual do sorteio
	RCALL start_anim

    ; Copia o número sorteado para os displays
	MOV UNIDADE,GANHADOR_UNIDADE
	MOV DEZENA,GANHADOR_DEZENA

    ; Acende o LED correspondente à cor sorteada
	RCALL LIGAR_LED   

    RETI

; Inclusão dos módulos do projeto
.nolist
.include "display.asm"
.include "corLed.asm"
.include "sorteio.asm"
.include "animacao.asm"
.list	