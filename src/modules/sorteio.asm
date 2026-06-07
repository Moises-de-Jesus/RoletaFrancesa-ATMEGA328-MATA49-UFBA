start_sort:
    PUSH R17
    RCALL loop_sorteio
    POP R17

loop_sort:
    INC R17
    CMP R17, 37
    BREQ zerar
    CMP R17,0
    BRGE norm
    RJMP zerar
    norm:
        RJMP loop_sorteio

zerar:
    LDI R17,0x00
    RJMP loop_sort

loop_fim:
    MOV ganhador, R17
    RET
    




