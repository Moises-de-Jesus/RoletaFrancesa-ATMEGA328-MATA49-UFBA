start_mux:
	PUSH R16 ; guarda o valor do R16 na pilha para evitar sobrescrita
	RCALL decodifica_mux 
	POP R16 ; devolve o valor original que estava em R16 antes do mux
	RET

decodifica_mux:
	RCALL exibeUnidade_mux
	RCALL atraso_curto_mux
	RCALL exibeDezena_mux
	RCALL atraso_curto_mux
	RET

exibeUnidade_mux:
	; apaga ambos os displays
	CBI PORTC,DEZENA_PIN 
	CBI PORTC,UNIDADE_PIN

	; usa o ponteiro Z para referenciar a TabelaMux
	LDI ZH,HIGH(TabelaMux << 1)
	LDI ZL,LOW(TabelaMux << 1)

	; soma o valor (offset) que será mostrado no display ao ZL
	ADD ZL,UNIDADE
	
	; verifica se a soma ligou o bit de carry
	BRCC le_tab_mux
	INC ZH	; se deu carry, incrementa ZH para compensar o carry

le_tab_mux:
	LPM R0,Z	; move o número obtido na TabelaMux para R0
	OUT DISPLAY,R0	; envia o número para o display
	SBI PORTC,UNIDADE_PIN	; liga o display das unidades (a lógica é inversa, pois no circuito usa transistores)
	RCALL verifica_g	; verifica se precisa ligar o bit g do display
	RET

; as ideias do exibeDezena_mux e le_tab2_mux são análogos aos exibeUnidade_mux e le_tab_mux
exibeDezena_mux:
	CBI PORTC,DEZENA_PIN
	CBI PORTC,UNIDADE_PIN

	LDI ZH,HIGH(TabelaMux << 1)
	LDI ZL,LOW(TabelaMux << 1)

	ADD ZL,DEZENA
	BRCC le_tab2_mux
	INC ZH

le_tab2_mux:
	LPM R0,Z
	OUT DISPLAY,R0
	SBI PORTC,DEZENA_PIN
	RCALL verifica_g
	RET

; atraso rápido para não ser perceptível que os displays estão piscando
atraso_curto_mux:
    LDI R16,32      
volta_curto_mux:
    DEC R2
    BRNE volta_curto_mux
    DEC R16
    BRNE volta_curto_mux
    RET

verifica_g:
    MOV R16,R0	; o valor obtido na tabela está em R0, então R16 recebe esse valor
    ANDI R16,0x40	; deixa somente o bit g com seu respectivo valor, zerando os outros bits
    CPI R16,0x40	; verifica se o bit g está com: 1
    BREQ liga_g		; se o bit g = 1, então ele liga esse bit
    CBI PORTD,DISPLAY_G_PIN	; caso contrário, desliga o bit
    RET 

liga_g:
    SBI PORTD,DISPLAY_G_PIN ; liga o bit g do display
    RET

TabelaMux: .db 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
