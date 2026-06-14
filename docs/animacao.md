# Animação do Sorteio

Após a geração do número vencedor pelo módulo de sorteio, é executada uma animação responsável por simular o comportamento visual de uma roleta em movimento antes de exibir o resultado final ao usuário. O objetivo dessa etapa é tornar a experiência mais agradável esteticamente, apesar das cores não seguirem o funcionamento de uma roleta real.

## Estrutura do módulo

O módulo foi dividido utilizando as seguintes labels:

- **start_anim:** responsável pela inicialização da animação. Salva o número vencedor original, configura o contador principal e define os valores iniciais da sequência animada.

- **main_anim:** controla o número total de ciclos da animação. Ao término do contador, restaura o resultado sorteado originalmente e encerra a execução do módulo.

- **add_unidade:** realiza o avanço da unidade dentro da sequência utilizada pela animação.

- **add_dezena:** realiza o avanço da dezena quando necessário, garantindo que os números exibidos permaneçam dentro dos limites válidos da roleta.

- **check_unidade:** executa validações adicionais quando a dezena assume determinados valores.

- **diminuir_unidade:** corrige o valor da unidade quando ultrapassa 9 em casos comuns ou 6 caso a dezena seja 3.

- **diminuir_dezena:** corrige o valor da dezena quando ultrapassa 3.

- **trocar_cor:** atualiza a cor exibida pelos LEDs durante a animação.

- **mostrar_anim:** executa a multiplexação dos displays por diversas iterações para criar um atraso visível entre as etapas da animação.

## Funcionamento

O módulo de animação recebe inicialmente o número vencedor gerado pelo sistema e o armazena temporariamente. Em seguida, os registradores responsáveis por representar o resultado exibido nos displays são reinicializados para um valor de partida.

Depois é executado um loop de animação com 10 iterações. Durante cada ciclo, os valores exibidos nos displays são alterados adicionando constantes. Dessa forma, o usuário visualiza diversos números sendo exibidos rapidamente antes da revelação do resultado final.

Ao longo da animação, também ocorre a atualização dos LEDs de cor. Cada número da roleta possui uma cor associada, mas visualmente iria ser desinteressante associar os LEDs aos valores temporariamente exibidos, então para se tornar "gamificável" as cores seguem uma sequência de branco, verde e vermelho.

Para tornar a animação perceptível ao olho humano, após cada atualização dos valores é executada uma rotina de multiplexação dos displays diversas vezes. Esse procedimento gera um pequeno atraso controlado sem interromper o funcionamento normal da multiplexação.

Quando o contador principal da animação atinge o fim de suas iterações, os valores originalmente sorteados são recuperados da pilha e passam a ser exibidos nos displays como resultado definitivo do sorteio, assim como a cor correspondente a eles.

