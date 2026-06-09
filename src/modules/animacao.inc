start_anim:
    LDI UNIDADE, 0
    LDI DEZENA, 0
    LDI LOOP, 10
    PUSH GANHADOR_UNIDADE
    PUSH GANHADOR_DEZENA
    LDI GANHADOR_DEZENA, 0
    LDI GANHADOR_UNIDADE, 2
    main_anim:
    CPI LOOP, 0x00
    DEC LOOP
    BRNE add_unidade
    POP GANHADOR_DEZENA
    POP GANHADOR_UNIDADE
    RET

add_unidade:
    LDI TEMP, 0x05
    ADD UNIDADE, TEMP
    CPI UNIDADE, 0x0A
    BRGE diminuir_unidade

add_dezena:
    LDI TEMP, 0x02
    ADD DEZENA, TEMP
    CPI DEZENA, 0x03
    BREQ check_unidade
    check:
    CPI DEZENA, 0x04
    BRGE diminuir_dezena
    RJMP trocar_cor

check_unidade:
    CPI UNIDADE, 0x07
    BRLO pula
    SUBI UNIDADE, 0x06
    pula:
    RJMP check

diminuir_unidade:
    SUBI UNIDADE, 0x09
    RJMP add_dezena

diminuir_dezena:
    SUBI DEZENA, 0x03
    RJMP trocar_cor
    
mostrar_anim:
    LDI R16, 100
    loop_atraso_mux:
    RCALL start_mux  
    DEC R16
    BRNE loop_atraso_mux
    RJMP main_anim

trocar_cor:
    RCALL LIGAR_LED

    INC GANHADOR_UNIDADE
    CPI GANHADOR_UNIDADE, 3
    BRLO mostrar_anim
    LDI GANHADOR_UNIDADE, 0
    RJMP mostrar_anim
