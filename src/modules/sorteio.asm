start_sort:
    PUSH R20
    PUSH R21
    LDI R20, 0xFF
    LDI R21, 0x00
    RCALL loop_sort
    POP R21
    POP R20

loop_sort:
    CMP R20, 0x0F
    BRNE inc
    CMP R21, 0x03
    BRNE incre
    CMP R20, 0x07
    BRNE inc
    RJMP zerar

inc:
    INC R20
    RJMP loop_sort

incre:
    INC R21
    LDI R20, 0xFF
    RJMP loop_sort

zerar:
    LDI R20, 0xFF
    RJMP loop_sort


    




