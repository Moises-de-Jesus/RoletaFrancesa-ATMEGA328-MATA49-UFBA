start_sort:
    LDI GANHADOR_UNIDADE, 0xFF
    LDI GANHADOR_DEZENA, 0x00
    RJMP loop_sort
    

loop_sort:
    RCALL start_mux
    CPI GANHADOR_UNIDADE, 0x09
    BRNE incr
    CPI GANHADOR_DEZENA, 0x03
    BRNE incre
    in_sort:
        CPI GANHADOR_UNIDADE, 0x07
        BRNE incr2
    RJMP zerar

incr:
    INC GANHADOR_UNIDADE
    RJMP loop_sort

incr2:
    INC GANHADOR_UNIDADE
    RJMP in_sort

incre:
    INC GANHADOR_DEZENA
    LDI GANHADOR_UNIDADE, 0xFF
    RJMP loop_sort

zerar:
    LDI RGANHADOR_UNIDADE, 0xFF
    RJMP loop_sort


    




