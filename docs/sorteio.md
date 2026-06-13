# Loop de sorteio - Simulação de aleatoriedade

Para cumprir os requisitos do projeto, que envolve a produção de um sistema integrado a um circuito para emulação de uma roleta francesa, foi necessário a simulação de aleatoriedade a fim de gerar um número randomizado entre 0 e 36. O módulo responsável por tal condução é o sorteio.asm, no qual explicaremos o funcionamento.

# Funcionamento

Para simulação da aleatoriedade no sistema, o sorteio.asm faz o proveito da alta velocidade de clock do microcontrolador ATMEGA328, ocorre que, a velocidade é tanta, que em um loop contínuo onde determinada ação é executada, se torna impraticável determinar o estado final, principalmente, quando o início desse loop é condicionado a alguma ação humana como o apertar de um botão, em que uma leve mudança na forma de pressionar pode mudar completamente o resultado final do algoritmo caso se tente encontrá-lo de forma determinística (Com base no clock do processador e do tempo cronometrado por exemplo).

Portanto, o princípio fundamental utilizado no módulo de sorteio foi a realização de um loop contínuo, sem atraso, de forma que, dado todas as variáveis aleatórias envolvidas num possível processo de medição, o resultado se torne praticamente aleatório na perspectiva do usuário.

Dessa forma, o módulo foi divido utilizando os seguintes labels:

start_sort: responsável pelo começo do processo, fazendo a iniciação das variáveis da unidade e dezena resultadas do sorteio.

loop_sort: coração do módulo, é o loop principal em que o processo de sorteio ocorre na prática, se trata de uma série de comandos condicionais, para delimitar os intervalos dos números que podem ser sorteados (0 e 36), além do redirecionamento aos componentes responsáveis por incrementar ou zerar a unidade e dezena.

incr, incr2: responsáveis por incrementar as unidades, no caso do incr, quando a dezena for menor que 3, e no caso do incr2, quando a dezena for 3.

incre: responsável por incrementar a dezena e zerar a unidade.

zerar: responsável por zerar ambas unidade e dezena.

Obs: As 4 últimas labels também têm o papel de voltar ao loop principal, utilizando um jmp relativo,

# Circuito

O sorteio é aplicado na prática no circuito utilizando a interrupção causada ao pressionar o botão, quando este é pressionado o loop contínuo para, e o número resultante deste é informado nos displays após uma animação.