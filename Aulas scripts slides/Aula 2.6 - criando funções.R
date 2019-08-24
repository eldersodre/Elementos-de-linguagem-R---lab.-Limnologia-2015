#############################################
#############################################
####### Aula 2.6 - criando funções ##########
#############################################
#############################################


#Funções são um tipo especial de objeto do R. Assim como outros objetos,
#elas são criadas com o sinal de atribuição:  <- 
#Elas são criadas, obviamente, por uma função: function()

#A estutura báscia é a seguinte:
minha.função <- function(argumentos) {
  ## Corpo da função
}

#Vamos olhar alguns exemplos simples para entender como criar funções:
somar <- function(x,y) { #Esta função leva dois argumentos.
  x+y   #Aqui não é necessário usar a função print. IMPORTANTE: as funções sempre retornarão a útlima expressão da última linha da função. 
}

somar(3,6)     #Funcionou!
somar(-12,387) #Funcionou!
somar(2)       #Não funcionou, pois falta um argumento.


#

maior  <-  function(x,n){
  ss <- x>n  #OBS: objetos criado dentro de uma função são criados apenas durante o cálculo da função e não ficam salvos no R posteriormente.
  x[ss]
}

vetor <- rnorm(20,sd=10)
maior(vetor,8)
maior(vetor,2)

#Às vezes, é interessante que um argumento tenha um vetor, ou seja, um valor
#pré estabelecido que funcione bem na maiorira dos casos, mas que pode ser alterado
#se o usuário assim quiser.

maior2 <- function (x, n=0) {    #O sinal de igual significa que eu estou atribuindo um valor default para o argumento n.
  ss <- x>n
  x[ss]
}

maior2(vetor)
maior2(-5:10)
maior2(-5:10,-2)


#### uma função um pouco mais complicada ... ####
#Em estatística, o coeficiente de variação é uma medida de dispersão dos dados
  #representada pelo desvio padrão dividido pela média. Vamos criar uma função 
  #que calcule o coeficiente de variação.

#Dica: quando for criar suas funções no R, antes de pensar em códigos,
#pense em português como a sua função vai funcionar.
#Se pergunte: quais tipos de argumentos a minha função vai ter?
#Com que tipo de dados ela vai trabalhar? Vetores? Matrizes?
#E que tipo de objeto a função vai retornar? Um valor único? Um vetor? Um data frame? De que tipo?

#Digamos que você quer calcular o CV de dados ecológicos; neste caso, é provável
#que seu seus dados estejam em um dataframe ou matriz, com as variáveis nas colunas.
#Provavelmente, você irá querer que o resultado seja um vetor, com cada elemento
#representando o CV de uma coluna.

CV <- function(x) {
  res <- numeric(length=ncol(x))
  names(res) <- colnames(x)
  res
}

#Por enquanto a função acima não faz nada, apenas cria o vetor de resultados.

#Vamos carregar os dados do ecolagoas para testar a função.
setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)

CV(ecolagoas)

#Falta ainda os cálculos, certo?

CV <- function (x) {
  res <- numeric(length=ncol(x))
  names(res) <- colnames(x)
  for (i in 1:ncol(x)) {
    desvpad <- sd(x[,i])
    média <- mean(x[,i])
    res[i] <- desvpad/média
  }
  res
}

CV(ecolagoas) #Funcionou!

#Agora, vamos tornar a função um pouco mais complicada. Algumas colunas retornaram
#NA porque não é possível calcular a média e o desvio padrão quando há NAs nos dados.
#Vamos criar um argumento remover.NA que remove os NAs antes do cálculo.

CV <- function (x,remover.NA=FALSE) {
  res <- numeric(length=ncol(x))
  names(res) <- colnames(x)
  for (i in 1:ncol(x)) {
    desvpad <- sd(x[,i],na.rm=remover.NA)
    média <- mean(x[,i],na.rm=remover.NA)
    res[i] <- desvpad/média
  }
  res
}

CV(ecolagoas,remover.NA=TRUE) #Funcionou!
#mês e lagoa continuam resultando em NAs pois não são dados numéricos.

#Nós calculamos o CV das colunas dos dados. Vamos adicionar um argumento
#que transpõe a matriz antes dos cálculos, de modo que teremos o CV das linhas:

CV <- function (x,remover.NA=FALSE,transpor=FALSE) {
  if (transpor==TRUE) {
    x <- t(x)
  }
  res <- numeric(length=ncol(x))
  names(res) <- colnames(x)
  for (i in 1:ncol(x)) {
    desvpad <- sd(x[,i],na.rm=remover.NA)
    média <- mean(x[,i],na.rm=remover.NA)
    res[i] <- desvpad/média
  }
  res
}


CV(ecolagoas[,3:22], remover.NA=T,transpor=T)


#Agora tente crias as suas próprioas funções!


