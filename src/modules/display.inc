start_mux:
	PUSH R16
	RCALL decodifica_mux
	POP R16
	RET

decodifica_mux:
	LDI R16,0

	RCALL exibeUnidade_mux
	RCALL atraso_curto_mux
	RCALL exibeDezena_mux
	RCALL atraso_curto_mux
	RET

exibeUnidade_mux:
	SBI PORTB,DEZENA_PIN
	SBI PORTB,UNIDADE_PIN

	LDI ZH,HIGH(TabelaMux << 1)
	LDI ZL,LOW(TabelaMux << 1)

	ADD ZL,UNIDADE
	BRCC le_tab_mux
	INC ZH

le_tab_mux:
	LPM R0,Z
	OUT DISPLAY,R0
	CBI PORTB,UNIDADE_PIN
	RET

exibeDezena_mux:
	SBI PORTB,DEZENA_PIN
	SBI PORTB,UNIDADE_PIN

	LDI ZH,HIGH(TabelaMux << 1)
	LDI ZL,LOW(TabelaMux << 1)

	ADD ZL,DEZENA
	BRCC le_tab2_mux
	INC ZH

le_tab2_mux:
	LPM R0,Z
	OUT DISPLAY,R0
	CBI PORTB,DEZENA_PIN
	RET

atraso_curto_mux:
	PUSH R16
    LDI R16,32      
volta_curto_mux:
    DEC R2
    BRNE volta_curto_mux
    DEC R16
    BRNE volta_curto_mux
	POP R16
    RET

TabelaMux: .db 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
