.nolist
.include "m328Pdef.inc"
.list

.equ DEZENA_PIN = PB5
.equ UNIDADE_PIN = PB4
.equ DISPLAY = PORTC

.def UNIDADE = R17
.def DEZENA = R18

main:


.nolist
.include "display.inc"
.list
