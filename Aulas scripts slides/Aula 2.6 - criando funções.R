#############################################
#############################################
####### Aula 2.6 - criando fun��es ##########
#############################################
#############################################


#Fun��es s�o um tipo especial de objeto do R. Assim como outros objetos,
#elas s�o criadas com o sinal de atribui��o:  <- 
#Elas s�o criadas, obviamente, por uma fun��o: function()

#A estutura b�scia � a seguinte:
minha.fun��o <- function(argumentos) {
  ## Corpo da fun��o
}

#Vamos olhar alguns exemplos simples para entender como criar fun��es:
somar <- function(x,y) { #Esta fun��o leva dois argumentos.
  x+y   #Aqui n�o � necess�rio usar a fun��o print. IMPORTANTE: as fun��es sempre retornar�o a �tlima express�o da �ltima linha da fun��o. 
}

somar(3,6)     #Funcionou!
somar(-12,387) #Funcionou!
somar(2)       #N�o funcionou, pois falta um argumento.


#

maior  <-  function(x,n){
  ss <- x>n  #OBS: objetos criado dentro de uma fun��o s�o criados apenas durante o c�lculo da fun��o e n�o ficam salvos no R posteriormente.
  x[ss]
}

vetor <- rnorm(20,sd=10)
maior(vetor,8)
maior(vetor,2)

#�s vezes, � interessante que um argumento tenha um vetor, ou seja, um valor
#pr� estabelecido que funcione bem na maiorira dos casos, mas que pode ser alterado
#se o usu�rio assim quiser.

maior2 <- function (x, n=0) {    #O sinal de igual significa que eu estou atribuindo um valor default para o argumento n.
  ss <- x>n
  x[ss]
}

maior2(vetor)
maior2(-5:10)
maior2(-5:10,-2)


#### uma fun��o um pouco mais complicada ... ####
#Em estat�stica, o coeficiente de varia��o � uma medida de dispers�o dos dados
  #representada pelo desvio padr�o dividido pela m�dia. Vamos criar uma fun��o 
  #que calcule o coeficiente de varia��o.

#Dica: quando for criar suas fun��es no R, antes de pensar em c�digos,
#pense em portugu�s como a sua fun��o vai funcionar.
#Se pergunte: quais tipos de argumentos a minha fun��o vai ter?
#Com que tipo de dados ela vai trabalhar? Vetores? Matrizes?
#E que tipo de objeto a fun��o vai retornar? Um valor �nico? Um vetor? Um data frame? De que tipo?

#Digamos que voc� quer calcular o CV de dados ecol�gicos; neste caso, � prov�vel
#que seu seus dados estejam em um dataframe ou matriz, com as vari�veis nas colunas.
#Provavelmente, voc� ir� querer que o resultado seja um vetor, com cada elemento
#representando o CV de uma coluna.

CV <- function(x) {
  res <- numeric(length=ncol(x))
  names(res) <- colnames(x)
  res
}

#Por enquanto a fun��o acima n�o faz nada, apenas cria o vetor de resultados.

#Vamos carregar os dados do ecolagoas para testar a fun��o.
setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)

CV(ecolagoas)

#Falta ainda os c�lculos, certo?

CV <- function (x) {
  res <- numeric(length=ncol(x))
  names(res) <- colnames(x)
  for (i in 1:ncol(x)) {
    desvpad <- sd(x[,i])
    m�dia <- mean(x[,i])
    res[i] <- desvpad/m�dia
  }
  res
}

CV(ecolagoas) #Funcionou!

#Agora, vamos tornar a fun��o um pouco mais complicada. Algumas colunas retornaram
#NA porque n�o � poss�vel calcular a m�dia e o desvio padr�o quando h� NAs nos dados.
#Vamos criar um argumento remover.NA que remove os NAs antes do c�lculo.

CV <- function (x,remover.NA=FALSE) {
  res <- numeric(length=ncol(x))
  names(res) <- colnames(x)
  for (i in 1:ncol(x)) {
    desvpad <- sd(x[,i],na.rm=remover.NA)
    m�dia <- mean(x[,i],na.rm=remover.NA)
    res[i] <- desvpad/m�dia
  }
  res
}

CV(ecolagoas,remover.NA=TRUE) #Funcionou!
#m�s e lagoa continuam resultando em NAs pois n�o s�o dados num�ricos.

#N�s calculamos o CV das colunas dos dados. Vamos adicionar um argumento
#que transp�e a matriz antes dos c�lculos, de modo que teremos o CV das linhas:

CV <- function (x,remover.NA=FALSE,transpor=FALSE) {
  if (transpor==TRUE) {
    x <- t(x)
  }
  res <- numeric(length=ncol(x))
  names(res) <- colnames(x)
  for (i in 1:ncol(x)) {
    desvpad <- sd(x[,i],na.rm=remover.NA)
    m�dia <- mean(x[,i],na.rm=remover.NA)
    res[i] <- desvpad/m�dia
  }
  res
}


CV(ecolagoas[,3:22], remover.NA=T,transpor=T)


#Agora tente crias as suas pr�prioas fun��es!


