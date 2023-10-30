
# Apollo23 - Grupo 7

## Engajamento em eventos [4]

Organizar eventos de tecnologia é uma tarefa desafiadora, que envolve diversos aspectos, desde a logística e a programação até o engajamento dos participantes. Com o crescimento constante da indústria de tecnologia, a realização de eventos bem-sucedidos tornou-se essencial para a disseminação de conhecimento, a promoção de networking e o fortalecimento das comunidades de tecnologia. No entanto, muitas vezes, as equipes de organização enfrentam obstáculos que podem dificultar a comunicação eficiente e o engajamento dos participantes.

## Problema

Levamos em consideração o problema que a Blusoft enfrenta:

* As pessoas se inscrevem para palestras gratuitas e acabam não indo, o que gera diversos transtornos.

## Solução

Incluir uma camada de gameficação e iteração ao se inscrever em uma palestra.

* O usuário irá ler QRCodes durante a palestra, essas leituras geram pontos que podem ser utilizados da forma que o organizador achar melhor (sorteios, descontos, prioridade em eventos). Além disso, o histórico de leituras cria uma base de dados que poderá ser utilizada para definição de estratégias.
* O usuário podera postar perguntas que serão escolhidas para serem feitas ao palestrante. Como as perguntas ficam visiveis no aplicativo, é possível que o palestrante já se prepare baseado no que a platéia tem interesse em saber.

## Prototipação

[FIGMA](https://www.figma.com/file/aWGcKf3YTUa0rftvKffON3/telas?type=design&node-id=0-1&mode=design&t=2gJd1BDUM5JiBfKI-0)

[TELAS IMAGEM PNG](https://drive.google.com/file/d/1SSvon0sl6rdno8qCs9r42tzvduIxA7sq/view?usp=drive_link)

![Telas Figma](telas_figma.png?raw=true "Telas")

## Requisitos

### Funcionais

* O sistema deverá ler os QR codes
* O sistema deverá informar ao usuário se aquele QR code já foi lido
* O sistema deverá informar ao usuário se aquele QR code é válido
* O sistema deverá armazenar as perguntas feitas pelos usuários

### Não funcionais

* Front-end será desenvolvido em Flutter (Mobile/Android)
* Back-end será desenvolvido em Java utilizando Spring
* Persistência dos dados será feita utilizando banco de dados Postgres

## Equipe

* Allan Zimmermann
* Antônio Carlos Schwanke Zipf
* Endrigo Gustavo de Oliveira Knetsch
* Everton Wesley da Silva
* João Vinícius Rosá
* Lucas Raulino dos Santos
* Tiago Martins Speckart
* Vinícius dos Santos Guimarães
