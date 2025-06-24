#-----------------------------------------------------------------------------#
#                        N RAINHAS COM BUSCA TABU                             #

# Roberto de Morais Junior                                                    #
# RA:0072757                                                                  #
# rmoraisjunior@gmail.com                                                     #
#-----------------------------------------------------------------------------#

 
calcular_conflitos <- function(c){
#começo determinando os conflitos como 0 
  conflitos <- 0 
  n <- length(c)
#crio o loop de 1 em 1 calculando os conflitos até o penultimo item da matriz 
  for (i in 1:(n-1)){
#coloco outra rainha na frente da "i" para calcular
    for (j in (i+1):n){
#conta para calcular se as diagonais sao as mesmas (diferença da coluna da primeira - coluna da segunda == a diferença da linha da primeira e linha da segunda coluna)
      if (abs(c[i] - c[j]) == abs(i - j)) {
#caso for da mesma diagonal acrescento 1 no contador de conflitos        
        conflitos <- conflitos + 1
      }
    }
  }
  return(conflitos)
}

#funçao de gerar vizinhos
gerar_vizinhos <- function(v){
#crio uma lista vazia para armazenar todos meus vizinhos gerados  
  vizinhos <- list()
  n <- length(v)
#faço um loop de 1 em 1 ate o penultimo item da matriz novamente
  for (i in 1:(n-1)){
    #para cada rainha i, o laço j vai pegar uma rainha a frente de i (para evitar trocas repetidas) e fazer a troca com a rainha i.    
    for (j in (i + 1):n){
#armazena v para variavel vizinho      
      vizinho <- v
#cria uma variavel temporaria para armazenar a rainha "i"
      temp <- vizinho[i]
#troca rainha "j" com rainha "i"    
      vizinho[i] <- vizinho[j]
#troca rainha "i" com rainha "j"      
      vizinho[j] <- temp
#aplica essa nova solucao ao vetor 
      vizinhos <- append(vizinhos, list(vizinho))
    }
  }
  return(vizinhos)
}

#funçao de atualizaçao da lista tabu
atualizar_tabu <- function(lista_tabu, solucao, tamanho_tabu){
#adiciona a nova solucao a lista tabu  
  lista_tabu <- append(lista_tabu, list(solucao))
#remove o elemento mais antigo se a lista tabu passar o tamanho  
  if (length(lista_tabu) > tamanho_tabu){  
    lista_tabu <- lista_tabu[-1]
  }
  return(lista_tabu)
}

#função principal da busca tabu
busca_tabu <- function(n, max_interacoes, tamanho_tabu){ 
#crio uma solucao primaria aleatoria, onde depois ja a defino como a melhor opçao
  s_atual <- sample(1:n, n)
  melhor_solucao <- s_atual
#chamo o calcular conflitos para calcular os conflitos dessa minha primeira solução 
  melhor_custo <- calcular_conflitos(s_atual)
  lista_tabu <- list()
#crio um loop para rodar o numero determinado de interacoes 
  for (interacao in 1:max_interacoes){
#gera todas as soluções vizinhas à solução atual, trocando duas rainhas de posição   
    vizinhos <- gerar_vizinhos(s_atual)
#crio a variavel melhor vizinho como vazia, sem nada inicialmente 
    melhor_vizinho <- NULL
#crio a variavel melhor custo, inicialmente definida como infinito
    melhor_custo_vizinho <- Inf
    
#crio outro loop que percorre de vizinho em vizinho 
    for (vizinho in vizinhos){  # Corrigido: o loop deveria percorrer 'vizinhos'
#calcula o numero de conflitos do vizinho atual     
      custo_vizinho <- calcular_conflitos(vizinho)
#crio uma condicao para verificar se o vizinho atual já está na lista tabu (O ! antes de any inverte o resultado. A condição passa se o vizinho não estiver na lista tabu)
# O ! antes de any inverte o resultado. A condição passa se o vizinho não estiver na lista tabu.
      if (!(any(sapply(lista_tabu, function(x) all(x == vizinho)))) && custo_vizinho < melhor_custo_vizinho) {
#caso verdade, atualiza as variaveis     
        melhor_vizinho <- vizinho
        melhor_custo_vizinho <- custo_vizinho
      }
    }
#atualizo a sulucao atual para a melhor encontrada
    s_atual <- melhor_vizinho
#crio uma condicao procurando a melhor solucao
    if (melhor_custo_vizinho < melhor_custo){
      melhor_solucao <- melhor_vizinho
      melhor_custo <- melhor_custo_vizinho
    }
#atualiza a lista tabu
    lista_tabu <- atualizar_tabu(lista_tabu, s_atual, tamanho_tabu)
    
#exibe na tela o progresso           
    cat("INTERAÇÃO:", interacao, " | SOLUÇÃO:", toString(s_atual), " | CONFLITOS:", melhor_custo, "\n")
#se nao ha mais conflitos entao solucao perfeita
    if (melhor_custo == 0){
      break
    }
  }
  return(melhor_solucao)
}

#definindo parametros 
n <- 100
max_interacoes <- 50
tamanho_tabu <- 100

#rodando o algoritmo
solucao <- busca_tabu(n, max_interacoes, tamanho_tabu)
print("Melhor solução encontrada:")
print(solucao)
print("Conflitos finais:")
print(calcular_conflitos(solucao))



