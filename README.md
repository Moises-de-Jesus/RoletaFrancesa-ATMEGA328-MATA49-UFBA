# RoletaFrancesa-ATMEGA328-MATA49-UFBA

Projeto desenvolvido para a disciplina **MATA49 - Programação de Software Básico** da **Universidade Federal da Bahia (UFBA)**, com o objetivo de simular uma **Roleta Francesa La Partage** utilizando o microcontrolador **ATMEGA328P** e programação em **Assembly AVR**.

## Autores

- [Moises de Jesus Teixeira Santos](https://github.com/Moises-de-Jesus): Módulo sorteio e simulação de aleatoriedade
- [Iury Sena](https://github.com/iuryyxd): Módulo display e execução da lógica de multiplexação no circuito
- [Ícaro Correia do Sacramento](https://github.com/IcaroS299): Módulo corLed e execução da lógica para ascensão do led indicativo da cor do número sorteado
- [Thayfe Souza](https://github.com/ThayfeS): Módulo animacao e execução da animação após pressionamento do botão para indicar o sorteio do número
- [Pessoa que não importa](https://github.com/pedrohpmsdev): Nada importante

## Funcionalidades

- Sorteio de números entre **0 e 36** utilizando uma técnica de pseudoaleatoriedade baseada no clock do microcontrolador.
- Exibição do resultado em **dois displays de 7 segmentos multiplexados**.
- **Animação visual** antes da revelação do número vencedor, simulando o movimento da roleta.
- Indicação da cor do número sorteado através de **LEDs (vermelho, verde e branco)**.
- Acionamento do sorteio por meio de **interrupção externa** utilizando um botão conectado ao ATMEGA328P.

## Tecnologias Utilizadas

- Assembly AVR
- Microcontrolador ATMEGA328P
- SimulIDE
- Arduino Uno (como plataforma de desenvolvimento)

## Estrutura do Projeto

- `sorteio.asm`: Responsável pela geração do número vencedor.
- `animacao.asm`: Responsável pela animação exibida antes do resultado final.
- `display.asm`: Implementação da multiplexação dos displays de 7 segmentos.
- `corLed.asm`: Controle dos LEDs correspondentes às cores da roleta.
- `interrupcao.asm`: Configuração e tratamento da interrupção do botão de sorteio.

## Objetivo Acadêmico

O projeto foi desenvolvido para aplicar conceitos fundamentais de programação de baixo nível e arquitetura de computadores, incluindo:

- Manipulação de registradores.
- Uso de interrupções.
- Controle de periféricos.
- Multiplexação de displays.
- Estruturas de controle em Assembly.
- Integração entre software e hardware.

## Demonstração

Ao pressionar o botão de sorteio, uma animação é exibida nos displays simulando o giro da roleta. Após o término da animação, o número vencedor é apresentado juntamente com sua respectiva cor.
