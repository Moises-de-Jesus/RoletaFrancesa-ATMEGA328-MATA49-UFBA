# RoletaFrancesa-ATMEGA328-MATA49-UFBA

Projeto desenvolvido para a disciplina **MATA49 - Programação de Software Básico** da **Universidade Federal da Bahia (UFBA)**, com o objetivo de simular uma **Roleta Francesa La Partage** utilizando o microcontrolador **ATMEGA328P** e programação em **Assembly AVR**.

## Autores

- [Moises de Jesus Teixeira Santos](https://github.com/Moises-de-Jesus): Módulo sorteio e simulação de aleatoriedade
- [Iury Sena](https://github.com/iuryyxd): Módulo display e execução da lógica de multiplexação no circuito
- [Ícaro Correia do Sacramento](https://github.com/IcaroS299): Módulo corLed e execução da lógica para acender o led indicativo da cor do número sorteado
- [Thayfe Souza](https://github.com/ThayfeS): Módulo animação e execução da animação após pressionamento do botão para indicar o sorteio do número
- [Pedro Simões](https://github.com/pedrohpmsdev): Label main do módulo main e execução da lógica de interrupção

## Funcionalidades

- Sorteio de números entre **0 e 36** utilizando uma técnica de pseudoaleatoriedade baseada no clock do microcontrolador.
- Exibição do resultado em **dois displays de 7 segmentos multiplexados**.
- **Animação visual** antes da revelação do número vencedor, simulando o movimento da roleta.
- Indicação da cor do número sorteado através de **LEDs (vermelho, verde e branco)**.
- Acionamento do sorteio por meio de **interrupção externa** utilizando um botão conectado ao ATMEGA328P.

## Estrutura do Projeto

- [sorteio.asm](src/modules/sorteio.asm): Responsável pela geração do número vencedor.
- [animacao.asm](src/modules/animacao.asm): Responsável pela animação exibida antes do resultado final.
- [display.asm](src/modules/display.asm): Implementação da multiplexação dos displays de 7 segmentos.
- [corLed.asm](src/modules/corLed.asm): Controle dos LEDs correspondentes às cores da roleta.
- [main.asm](src/modules/main.asm): Parte principal do projeto onde contém a interrupção.

## Documentação Adicional e Recursos

### Documentação dos Módulos

- [Documentação do Sorteio](docs/sorteio.md)
- [Documentação da Animação](docs/animacao.md)
- [Documentação do Display](docs/display.md)
- [Documentação do Controle de Leds](docs/corLed.md)
- [Documentação da Interrupção](docs/interrupcao.md)

### Circuitos e Hardware

- [Componentes e Materiais Utilizados](docs/materiais.md): Lista de todos os componentes eletrônicos usados no projeto.
- [Circuito Físico](docs/circuito_fisico.md): Fotos do circuito físico.
- [Arquivo do SimulIDE](circuit/CIRCUITO.sim1)

## Guia prático de uso

Ao pressionar o botão de sorteio, uma animação é exibida nos displays simulando o giro da roleta. Após o término da animação, o número vencedor é apresentado juntamente com sua respectiva cor.
