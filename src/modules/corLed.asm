; principal, chama as outras rotinas
LIGAR_LED:
    RCALL OBTER_RESULTADO
	RCALL DECODIFICADOR_NUMERO_COR
	RCALL EXIBIR_COR
	RET

; pega os resultados do registrador da dezena e da unidade para retornar o número correspondente em um único registrador
OBTER_RESULTADO: ; 
    MUL GANHADOR_DEZENA, SALTO_DEZENAS ; multiplica o número do registrador da dezena por 10
    MOV RESULTADO_COR, R0 ; passa o resultado do número correspondente à dezena 
    ADD RESULTADO_COR, GANHADOR_UNIDADE ; adiciona o resultado do número correspondente à unidade 
    RET

; retorna o código da cor de acordo com o resultado obtido
DECODIFICADOR_NUMERO_COR: 
	; usa o ponteiro Z para apontar para a TABELA_CORES
	LDI ZH, HIGH(TABELA_CORES << 1)
	LDI ZL, LOW (TABELA_CORES << 1)

	; offset para buscar a posição na tabela correspondente ao resultado obtido
	ADD ZL, RESULTADO_COR
	CLR R5 ; garantir que R5 esteja nulo
	ADC ZH, R5 ; aumenta ZH caso ocorra carry na soma de ZL com RESULTADO_COR
	RET

; cuida das partes relacionadas a exibição
EXIBIR_COR:
    RCALL DESLIGA_LEDS
	RCALL DECODIFICADOR_COR_LED
	RET

; decodifica o código da cor e acende a cor correspondente
DECODIFICADOR_COR_LED:
	LPM R0, Z ; pega o código da cor
	MOV R19, R0 ; passa o código da cor para o registador que vai fazer as comparações
	
	; "switch-case" para determinar qual cor acender
	CPI R19,1
    BREQ acende_branco
    CPI R19,2
    BREQ acende_verde
    CPI R19,3
    BREQ acende_vermelho
    CLR RESULTADO_COR
	RET

	; blocos responsáveis por acender a cor de fato
	acende_branco:
		SBI PORTC, LED_BRANCO ; acende o led branco
		RET
	acende_verde:
		SBI PORTC, LED_VERDE ; acende o led verde
		RET
	acende_vermelho:
		SBI PORTC, LED_VERMELHO ; acende o led vermelho
		RET

; apaga todos os leds
DESLIGA_LEDS:
	CBI PORTC, LED_BRANCO
    CBI PORTC, LED_VERDE
    CBI PORTC, LED_VERMELHO
	RET

; tabela para obter o código da cor de acordo com o número obtido
TABELA_CORES: .db 2, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 1, 3, 1, 3, 1, 3, 1, 3, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 1, 3, 1, 3, 1, 3, 1, 3, 0