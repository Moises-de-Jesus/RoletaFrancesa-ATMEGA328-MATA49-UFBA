# Animação do Sorteio

Quando o número do sorteado é definido, a animação é executada. Ela tem o objetivo criar a sensação de uma roleta real e enganar o usuário como se o sorteio estivesse acontecendo na hora.

## Estrutura do módulo

- **start_anim:** responsável pela inicialização da animação. Salva a dezena e unidade vencedora na pilha, inicializa os registradores Unidade e Dezena.

- **main_anim:** controla o loop. Quando acaba, recupera os valores da pilha.

- **add_unidade:** Incrementa a constante 7 na unidade.

- **add_dezena:** Incrementa a constante 3 na dezena.

- **check_unidade:** verifica se a unidade ultrapassa 6 caso a dezena for 3.

- **diminuir_unidade:** corrige o valor da unidade quando ultrapassa 9 em casos comuns.

- **diminuir_dezena:** corrige o valor da dezena quando ultrapassa 3.

- **trocar_cor:** liga o próximo led colorido na ordem.

- **mostrar_anim:** executa o módulo de multiplexação para mostrar o número novo no display.

## Funcionamento

O módulo de animação guarda o valor ganhador da unidade e dezena na pilha. Então, os registradores que representam o resultado mostrado nos displays são resetados para um valor inicial que corresponde aos valores ganhadores incrementados em constante.

A animação é um loop com 10 repetições. A cada ciclo, os valores que aparecem nos displays são modificados por meio da adição de constantes e os leds vão acendendo e apagando em ordem. Cada ciclo tem em média 300ms. 

Embora cada número da roleta tenha uma cor correspondente, visualmente seria pouco interessante conectar os LEDs aos valores exibidos temporariamente. Assim, para se tornar "gamificável", as cores seguem uma sequência de branco, verde e vermelho.

Quando o loop da animação atinge o fim de suas iterações, os valores originalmente ganhadores são recuperados da pilha e passam a ser exibidos nos displays como resultado definitivo do sorteio, assim como a cor correspondente a eles.

