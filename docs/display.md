# Display - Multiplexação

Conforme os requisitos do roteiro desse projeto, é necessário implementar técnicas de multiplexação nos displays do projeto. Portanto, ao decorrer dessa documentação, será explicado o que é a multiplexação e como ela foi implementada no projeto.

## O que é a multiplexação?

É uma técnica que permite que vários sinais sejam transmitidos através de um único meio de transmissão. Isso faz com que a complexidade em relação aos fios diminua, pois sem essa técnica seria necessário um fio para cada sinal/dado que será transmitido.

### Circuito

No circuito, isso foi feito utilizando a porta "PORTB" do ATMEGA328P ligada nos pinos (a-f) de ambos os displays de 7 segmentos cátodo comum. Além disso, para o pino g de ambos os displays, eles foram ligados no pino PD3 do ATMEGA328P.

> Essa decisão se deu, pois o pino PB6, que seria o pino ligado ao pino g dos displays, não está disponível para uso no Arduíno Uno, pois o mesmo é usado para o clock do microcontrolador.

Dessa forma, os pinos (a-g) de ambos os displays estariam ligados cada um em um mesmo fio, caracterizando a multiplexação. Entretanto, como seria possível exibir dois números distintos em ambos os displays se os pinos (a-g) de cada um estão interligados?

A ideia abordada foi manipular os pinos de cátodo comum de cada display através de transistores atuando como chaves. Basicamente, o pino do cátodo comum só seria ligado ao terra, se o seu respectivo display fosse o display correspondente ao número que queríamos que fosse mostrado. No contexto do projeto:

- Exemplo: Mostrar o número 01
  - Mostrar unidade: Desliga ambos os displays -> Envia o número 1 para as portas que os pinos (a-g) dos displays estão conectados, -> Liga somente o cátodo comum do display da unidade
  - Mostrar dezena: Desliga ambos os displays -> Envia o número 0 para as portas que os pinos (a-g) dos displays estão conectados -> Liga somente o cátodo comum do display da dezena

A ideia por trás é basicamente ligar somente o display em que queremos que o determinado número seja exibido. Contudo, isso não seria perceptível a olho nu? A resposta é não, pois o clock do microcontrolador é tão rápido que o olho humano não consegue perceber que os displays estão ligando e desligando. Além disso, entre cada acionamento é acionado um atraso curto para que seja possível observar os números em cada display, devido a velocidade do clock do microcontrolador.

### Diagrama

Abaixo está o circuito virtual desenvolvido pelo SimulIDE. Nele é possível visualizar os pinos (a-g) dos dois displays ligados nos mesmos pinos do microcontrolador. Além disso, é possível visualizar os pinos do catódo comum de cada display ligados em pinos diferentes do ATMEGA328P para realizar a multiplexação.

![Diagrama do Circuito no SimulIDE](../assets/image_mux.png)
