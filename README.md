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

## ENGLISH: 
# N-Queens Problem with Tabu Search

The N-Queens problem is a classic in computer science. Imagine an N×N chessboard. The challenge consists of placing N queens on this board in such a way that no two queens can attack each other. In the game of chess, a queen attacks another when they are both on the same row, column, or diagonal.

The main objectives of this project are to develop effective methods to solve this problem, by calculating the conflicts between queens and always seeking the minimum possible number of conflicts in a given configuration.

## Technique Used

This project uses the **Tabu Search** algorithm, a memory-based heuristic that prevents the algorithm from getting stuck in cycles and improves the local search. The idea is to explore neighboring solutions by swapping queen positions and to avoid repetition by storing previous moves in a tabu list.

## How to Run

1.  Have R installed on your computer.
2.  Open the `n_rainhas_tabu.R` script (or equivalent).
3.  Run the code in an environment like RStudio or directly in the R console.
4.  The parameters that can be adjusted are:
    -   `n`: number of queens.
    -   `max_interacoes`: maximum number of search iterations.
    -   `tamanho_tabu`: size of the tabu list used by the algorithm.

## 📄 Code Structure

-   `calcular_conflitos`: a function that evaluates how many pairs of queens are in conflict.
-   `gerar_vizinhos`: generates neighboring solutions by swapping the positions of queens.
-   `atualizar_tabu`: updates the tabu list with the already explored solutions.
-   `busca_tabu`: the main function that runs the algorithm.

Academic work developed by Roberto Junior as part of the Artificial Intelligence course.


