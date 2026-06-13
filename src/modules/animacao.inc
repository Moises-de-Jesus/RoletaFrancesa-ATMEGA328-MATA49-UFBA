start_anim:
    MOV UNIDADE, GANHADOR_UNIDADE       ; Copia o valor atual do ganhador para a unidade
    MOV DEZENA, GANHADOR_DEZENA         ; Copia o valor atual do ganhador para a dezena
    LDI LOOP, 10                        ; Inicializa o contador do loop principal com 10 iterações
    PUSH GANHADOR_UNIDADE               ; Salva GANHADOR_UNIDADE na pilha
    PUSH GANHADOR_DEZENA                ; Salva GANHADOR_DEZENA na pilha
    LDI GANHADOR_DEZENA, 0              ; Reseta o registrador GANHADOR_DEZENA
    LDI GANHADOR_UNIDADE, 2             ; Inicializa GANHADOR_UNIDADE com o valor 2

main_anim:
    CPI LOOP, 0x00                      ; Verifica se o contador do loop chegou a zero
    DEC LOOP                            ; Decrementa o contador do loop
    BRNE add_unidade                    ; Se LOOP != 0, desvia para a lógica de soma
    POP GANHADOR_DEZENA                 ; Se LOOP == 0, restaura GANHADOR_DEZENA original
    POP GANHADOR_UNIDADE                ; Restaura GANHADOR_UNIDADE original
    RET                                 ; Retorna da subrotina


add_unidade:
    LDI TEMP, 0x05                      ; Carrega o valor constante 5 em TEMP
    ADD UNIDADE, TEMP                   ; Adiciona 5 ao registrador UNIDADE
    CPI UNIDADE, 0x0A                   ; Verifica se UNIDADE >= 10 (Estouro de dígito)
    BRGE diminuir_unidade               ; Se maior ou igual a 10, desvia para ajustar unidade

add_dezena:
    LDI TEMP, 0x02                      ; Carrega o valor constante 2 em TEMP
    ADD DEZENA, TEMP                    ; Adiciona 2 ao registrador DEZENA
    CPI DEZENA, 0x03                    ; Verifica se DEZENA é igual a 3
    BREQ check_unidade                  ; Se DEZENA == 3, realiza validação extra da unidade
check:
    CPI DEZENA, 0x04                    ; Verifica se DEZENA >= 4
    BRGE diminuir_dezena                ; Se maior ou igual a 4, desvia para ajustar dezena
    RJMP trocar_cor                     ; Caso contrário, avança para a atualização dos LEDs

check_unidade:
    CPI UNIDADE, 0x07                   ; Verifica se UNIDADE < 7
    BRLO pula                           ; Se UNIDADE < 7, ignora a subtração
    SUBI UNIDADE, 0x06                  ; Se UNIDADE >= 7, subtrai 6 da unidade
pula:
    RJMP check                          ; Retorna para o fluxo de checagem da dezena

diminuir_unidade:
    SUBI UNIDADE, 0x09                  ; Ajusta o valor da unidade (subtrai 9) após estouro
    RJMP add_dezena                     ; Prossegue para incrementar a dezena

diminuir_dezena:
    SUBI DEZENA, 0x03                   ; Ajusta o valor da dezena (subtrai 3) após estouro
    RJMP trocar_cor                     ; Prossegue para a atualização dos LEDs


mostrar_anim:
    LDI R16, 100                        ; Carrega o contador de iterações do delay (100 vezes)
loop_atraso_mux:
    RCALL start_mux                     ; Chama a subrotina externa de multiplexação do display
    DEC R16                             ; Decrementa o contador de delay
    BRNE loop_atraso_mux                ; Repete até que R16 chegue a zero
    RJMP main_anim                      ; Retorna para o fluxo principal da animação


trocar_cor:
    RCALL LIGAR_LED                     ; Chama a subrotina externa para acionar/atualizar os LEDs

    INC GANHADOR_UNIDADE                ; Incrementa o registrador de controle
    CPI GANHADOR_UNIDADE, 3             ; Verifica se o contador atingiu o limite de 3
    BRLO mostrar_anim                   ; Se menor que 3, salta para exibir a animação
    LDI GANHADOR_UNIDADE, 0             ; Se igual a 3, reinicia o contador (Garante valores: 0, 1, 2)
    RJMP mostrar_anim                   ; Salta para exibir a animação