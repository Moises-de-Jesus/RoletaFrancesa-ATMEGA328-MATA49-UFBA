start_sort:
    LDI GANHADOR_UNIDADE, 0xFF
    LDI GANHADOR_DEZENA, 0x00
    RJMP loop_sort
    

loop_sort:
    RCALL start_mux
    CMP GANHADOR_UNIDADE, 0x0F
    BRNE inc
    CMP GANHADOR_DEZENA, 0x03
    BRNE incre
    in_sort:
        CMP GANHADOR_UNIDADE, 0x07
        BRNE inc2
    RJMP zerar

inc:
    INC GANHADOR_UNIDADE
    RJMP loop_sort

inc2:
    INC GANHADOR_UNIDADE
    RJMP in_sort

incre:
    INC GANHADOR_DEZENA
    LDI GANHADOR_UNIDADE, 0xFF
    RJMP loop_sort

zerar:
    LDI RGANHADOR_UNIDADE, 0xFF
    RJMP loop_sort


    




