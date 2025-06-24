# Problema das N-Rainhas com Busca Tabu

O problema das N-Rainhas é um clássico da computação. Imagine um tabuleiro de xadrez de tamanho N×N. O desafio consiste em posicionar N rainhas nesse tabuleiro de forma que nenhuma delas possa atacar outra. No jogo de xadrez, uma rainha ataca outra quando ambas estão na mesma linha, coluna ou diagonal.

Os principais objetivos deste projeto são desenvolver métodos para resolver esse problema de forma eficaz, calculando os conflitos entre as rainhas e buscando sempre o mínimo possível de conflitos em uma dada configuração.

##  Técnica utilizada

Este projeto utiliza o algoritmo de **Busca Tabu**, uma heurística baseada em memória, que evita que o algoritmo caia em ciclos e melhora a busca local. A ideia é explorar soluções vizinhas por meio de trocas entre rainhas e evitar repetições armazenando posições anteriores em uma lista tabu.

## Como executar

1. Tenha o R instalado no seu computador.
2. Abra o script `n_rainhas_tabu.R` (ou equivalente).
3. Execute o código em um ambiente como RStudio ou diretamente no console R.
4. Os parâmetros que podem ser ajustados são:
   - `n`: número de rainhas.
   - `max_interacoes`: número máximo de iterações da busca.
   - `tamanho_tabu`: tamanho da lista tabu usada pelo algoritmo.

## 📄 Estrutura do código

- `calcular_conflitos`: função que avalia quantos pares de rainhas estão em conflito.
- `gerar_vizinhos`: gera soluções vizinhas a partir da troca de posições entre rainhas.
- `atualizar_tabu`: atualiza a lista tabu com as soluções já exploradas.
- `busca_tabu`: função principal que executa o algoritmo.

Trabalho acadêmico desenvolvido por Roberto Junior como parte da disciplina de Inteligência Artificial.


