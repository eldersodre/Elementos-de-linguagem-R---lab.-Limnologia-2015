#############################################################
#############################################################
############  Aula 3.4 - criando gr�ficos no R  #############
#############################################################
#############################################################

#### Preparando os dados ####
#Para a aula de hoje, usaremos como exemplo alguns dados com os quais voc�s
#j� devem estar acostumados das �ltimas aulas.

setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Dados do ecolagoas de 2008:
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)


#### histogramas - Fun��o hist() ####
#O histograma � um tipo de gr�fico que serve para observar 
#a distribui��o dos dados.Pode ser considerado um tipo especial
#de gr�fico de barras, em que o valor das barras � a quantidade de observa��es
#dentro do intervalo especificado.

#Histogramas s�o criados com a fun��o hist(). Vejamos alguns exemplos:
set.seed(10)
x <- rnorm(1000)

hist(x)

set.seed(2)
y <- runif(100,0,10)

hist(y)

#Mais um exemplo:
secchi <- ecolagoas$secchi

hist(secchi)

#Um argumento da fun��o hist � breaks. Este argumento permite
#que voc� determine o n�mero de barras do histograma.

hist(x)
hist(x,breaks=4)  
hist(x,breaks=25)
hist(x,breaks=200)

hist(secchi)
hist(secchi,breaks=5)

#Breaks tamb�m pode ser um vetor especificando as posi��es dos intervalos:

hist(secchi,breaks=seq(0,2.6,by=0.2))

hist(x,breaks=c(-3.5,-2,-1.8,-1,1,1.3,1.8,2.5,3.55))



#### Gr�ficos de dispers�o: fun��o plot() ####
#A fun��o plot serve para gr�ficos de dispers�o. Sua f�rmula b�sica �:
#plot(x,y,...)

x <- 1:20

set.seed(32)
y <- 1:20 + rnorm(20,sd=3)

plot(x,y)

#Uma outra alternativa � escrever 
plot(y~x) 
#,que significa y em fun��o de x.

profundidade <- ecolagoas$profundidade
plot(profundidade,secchi)


#O argumento type permite que voc� escolha o tipo de gr�fico que ser� feito.

plot(x,y,type="p") #p--> Pontos. Este � o default.
plot(y~x,type="l") #l--> Linhas
plot(x,y,type="b") #b--> Linhas e pontos (both;ambos)
plot(x,y,type="n") #n--> Nada. Apenas os eixos, sem os dados.

#H� ainda outros tipos poss�veis. N�o se esque�a de conferir em ?plot.


#### Gr�ficos de boxplot ####
#A fun��o boxplot() permite criar gr�ficos de boxplot.

set.seed(55)
boxplot(rnorm(1000)) #Boxplot �nico

#Para fazer mais de um boxplot, a f�rmula � boxplot(y~grp),
#onde y � um vetor num�rico de dados, a serem divididos
#de acordo com o grp (normalmente, um fator)

boxplot(secchi~ecolagoas$lagoa)


#Boxplots s�o criados automaticamente com a fun��o plot() quando
#o valor de x � categ�rico.

plot(profundidade,secchi)    #X cont�nuo; gr�fico de dispers�o � criado.
plot(ecolagoas$lagoa,secchi) #X categ�rico; boxplot � criado.
#Observe que criando boxplots com a fun��o plot(), a f�rmula plot(grp,y) tamb�m funciona.



#### stripchart()  ####
#Gr�ficos de boxplots s�o �teis quando h� muitos dados.
#Quando h� poucos dados, � mais recomend�vel plotar todos os pontos.
#Isto � feito com a fun��o stripchart().

#Assim como na fun��o boxplot, sua f�rmula � stripchart(y~grp)


stripchart(secchi~ecolagoas$lagoa)

#Por defini��o, o gr�fico tem essa apar�ncia deitada. Isto pode ser alterado
#com o argumento vertical=TRUE
stripchart(secchi~ecolagoas$lagoa,vertical=T)


#Muitos pontos est�o sobrepostos, o que dificulta a sua visualiza��o.
#Use method="jitter" para contornar este problema.

stripchart(secchi~ecolagoas$lagoa,vertical=T,method="jitter")

#Quando escolhemos method="jitter", aos valores de x � acrescentada uma varia��o aleat�ria,
#que diminui a sobreposi��o. Use o argumento jitter para controlar a sobreposi��o.

stripchart(secchi~ecolagoas$lagoa,vertical=T,method="jitter",jitter=0.01)
stripchart(secchi~ecolagoas$lagoa,vertical=T,method="jitter",jitter=0.2)
stripchart(secchi~ecolagoas$lagoa,vertical=T,method="jitter",jitter=0.5)



#### Gr�ficos de pizza - fun��o pie ####
#Gr�ficos de pizza s�o criados com a fun��o pie().
#O principal argumento desta fun��o � um vetor num�rico.
#Vejamos alguns exemplos:

pie(c(10,4,12,9))

elei��es <- c(Juca=789,Maria=502,Z�=95,Rosinha=636,"Ana J�lia"=261)

pie(elei��es)



#### Gr�ficos de barra - fun��o barplot() ####
#Gr�ficos de barra podem ser feitos de forma similar aos gr�ficos de pizza.
barplot(c(10,4,12,9))
barplot(elei��es)


sec.lagoa <- tapply(secchi,ecolagoas$lagoa,mean)
barplot(sec.lagoa)

#O argumento horiz=TRUE faz com que as barras fiquem na horizontal.
barplot(elei��es,horiz=T)
barplot(sec.lagoa,horiz=T)


#Os dados de um boxplot tamb�m podem ser uma matriz.
prof.sec <- cbind(
  profundidade=tapply(ecolagoas$profundidade,ecolagoas$lagoa,mean),
  secchi=tapply(ecolagoas$secchi,ecolagoas$lagoa,mean)
  )

prof.sec <- t(prof.sec)

barplot(prof.sec) #Observe que os dados est�o empilhados nas barras.
#Se voc� quiser os dados lado a lado, use o argumento beside=TRUE.
barplot(prof.sec,beside=T)


#### Mais detalhes ####
#Para maiores detalhes sobre as possibilidades destes gr�ficos, uma dica � usar a
#fun��o example.
example(hist)
example(plot)
example(boxplot)
example(stripchart)
example(pie)
example(barplot)


#N�o deixe de visitar tamb�m o website abaixo:
http://rgraphgallery.blogspot.com.br/  #Blog com diversos exemplos de gr�ficos no R
  #e os scripts usados para cri�-los.
  

