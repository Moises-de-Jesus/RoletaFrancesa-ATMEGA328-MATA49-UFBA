; Começa o processo de sorteio do número entre 0 e 36

start_sort:
    LDI GANHADOR_UNIDADE, 0x00 ; Inicialização da variável da unidade
    LDI GANHADOR_DEZENA, 0x00   ; Inicialização da variável da dezena
    RJMP loop_sort
    
; Loop principal do processo de sorteio, responsável fazer a continua contagem dos valores entre 0 e 36, até que ocorra a interrupção, como a contagem é muito rápida, o processo simula aleatoriedade

loop_sort:
    RCALL start_mux
    CPI GANHADOR_UNIDADE, 0x09
    BRNE incr ; Caso a unidade seja 9, pula pra incrementação da dezena, caso contrário, incrementa a unidade
    CPI GANHADOR_DEZENA, 0x02
    BRNE incre ; Caso a dezena seja 2, pula pra incrementação da unidade no caso em que a dezena é 3, caso contrário, incrementa a dezena e zera a unidade
    INC GANHADOR_DEZENA
    LDI GANHADOR_UNIDADE, 0x00
    in_sort: ; Parte condicional que só ocorre quando a dezena é 3
        RCALL start_mux
        CPI GANHADOR_UNIDADE, 0x06
        BRNE incr2 ; Caso a unidade seja 6, zera a dezena e a unidade, caso contrário, incrementa a unidade
    RJMP zerar

; Incrementa unidade

incr:
    INC GANHADOR_UNIDADE
    RJMP loop_sort

; Incrementa unidade no caso em que a dezena é 3

incr2:
    INC GANHADOR_UNIDADE
    RJMP in_sort

; Incrementa a dezena e zera a unidade

incre:
    INC GANHADOR_DEZENA
    LDI GANHADOR_UNIDADE, 0x00
    RJMP loop_sort

; Zera ambas dezenas e unidades

zerar:
    LDI GANHADOR_UNIDADE, 0x00
    LDI GANHADOR_DEZENA, 0x00
    RJMP loop_sort