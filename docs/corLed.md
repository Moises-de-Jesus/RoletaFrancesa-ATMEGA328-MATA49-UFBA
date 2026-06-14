# Cores da Roleta
Para uma simulação mais completa da Roleta Francesa La Partage e permitir a possibilidade da aposta externa por cor, foram adicionadas cores por meio de leds que acendem de acordo com o resultado obtido na roleta.

Por padrão, as cores na Roleta Francesa La Partage são verde, vermelha e preta, mas, por não existir led preto, a cor preta foi substituída pela cor branca. As cores verde e vermelha não foram alteradas.

## Funcionamento
O número sorteado na parte do sorteio, o qual está separado em dois registradores para representar a casa das dezenas e das unidades, é passado para um registrador único por meio da soma do número correspondente à casa das dezenas número multiplicado por 10 (0xA) com o número correspondente à casa das unidades.

Após isso, ocorre uma etapa de decodificação onde o número sorteado, agora em um único registrador, é usado como um offset de um ponteiro que aponta para o início de uma tabela com códigos de cor. Cada posição da tabela corresponde a um dos números de 0 a 36.

O código de cor obtido é então passado por uma segunda etapa de decodificação que irá ligar o led da cor adequada. Quando o código de cor recebido é igual a 1, liga-se a cor branca, para o código igual a 2, liga-se a cor verde e, por fim, para o código igual a 3, liga-se a cor vermelha.

Após a animação do resultado do sorteio, antes de um led ser ligado, todos são apagados para garantir que o led de um resultado anterior não permaneça ligado no sorteio mais recente, evitando, assim, que mais de um led fique ligado ao exibir o número sorteado.

## Circuito

No circuito, estão presentes três leds ligados a pinos da porta "PORTC", um de cor branca ligado ao pino "PC0", um de cor verde ligado ao pino "PC1" e o outro de cor vermelha ligado ao pino "PC2". Isso pode ser melhor visualizado com uma foto do circuito digital feito no SimulIDE a seguir:

### Diagrama
![Diagrama do Circuito no SimulIDE](../assets/image_mux.png)

Na parte superior, da esquerda para a direita, os leds de cor branca, verde e vermelha.