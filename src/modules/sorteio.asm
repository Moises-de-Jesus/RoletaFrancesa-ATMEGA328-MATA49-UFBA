start_sort:
    PUSH R17
    LDI R17, 0xFF
    RCALL loop_sort
    POP R17

loop_sort:
    INC R17
    CMP R17, 37
    BREQ zerar
    RJMP loop_sort

zerar:
    LDI R17, 0xFF
    RJMP loop_sort


    




