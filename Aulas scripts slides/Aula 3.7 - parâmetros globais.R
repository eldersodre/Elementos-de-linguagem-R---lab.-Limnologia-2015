###########################################################
###########################################################
############### Aula 3.7 - par�metros globais #############
###########################################################
###########################################################

#### Preparando os dados ####
#Para a aula de hoje, usaremos como exemplo alguns dados com os quais voc�s
#j� devem estar acostumados das �ltimas aulas.

setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Dados do ecolagoas de 2008:
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)

#Dados de zoopl�ncton do lago Batata em 1998:
batata <- read.csv2("zoobatata1998.csv",row.names=1)
zoo <- batata[,3:53] #apenas as colunas com as densidades

#Vari�veis x e y:
x <- 1:20
set.seed(635)
y <- 1:20 + rnorm(20,sd=3)

#Vari�vel a:
set.seed(60)
a <- rnorm(123)


# A fun��o par() altera par�metros globais de gr�ficos. Isto significa que,
#uma vez alterados, eles afetar�o todos os gr�ficos daquele momento em diante.

#A fun��o par(), sem argumentos, retorna uma lista com todos os par�metros e seus valores atuais:
par()
?par

#Por exemplo, bg � o fundo do gr�fico.
#Podemos alterar este par�metro com o comando abaixo:

par(bg="lightblue")
#De agora em diante, todos os gr�ficos que fizermos ter�o um fundo azul claro.

plot(x,y)
hist(a,col="green")

#IMPORTANTE: N�o existe nenhuma fun��o que retorne automaticamente os par�metros
#globais ao default. Para retornar ao default, voc� precisa fazer isso manualmente.

par(bg="white")
plot(x,y)


#Outro par�metro global � mar, que especifica o tamanho das margens.
#Ele � um vetor com 4 elementos, na f�rmula: c(embaixo,esquerda,acima,direita).
#Seu default � c(5, 4, 4, 2) + 0.1.
#Vejamos o que acontece quando mexemos nele:

par(mar=c(1,4,4,2))  #Diminu� as margens abaixo do gr�fico.
plot(x,y)
hist(a)
#Observe que eixos e t�tulos podem ser cortados ao diminuir o tamanho das margens.

par(mar=c(3,0,1,7))  #Diminu� as margens abaixo do gr�fico.
plot(x,y)
hist(a)

par(mar=c(5,4,4,2)+0.1)



#### Alterando o n�mero de linhas e colunas ####
#H� muitos par�metros globais, mas os mais importantes s�o provavelmente mfrow e mfcol.
#mfrow e mfcol fazem exatamente a mesma coisa. S�o usados : mfrow=c(linhas,colunas)
#No default, mfrow=c(1,1), ou seja, um gr�fico apenas.

#Vamos brincar um pouco:
par(mfrow=c(2,1)) #Duas linhas e uma coluna, ou seja, um gr�fico em cima do outro.
plot(x,y)
hist(a)

par(mfrow=c(1,2)) #Uma linha e duas colunas, ou seja, um gr�fico ao lado do outro.
plot(x,y)
hist(a)

#Quando o espa�o dos gr�ficos est� dividido, cada novo gr�fico criado ocupa um espa�o dispon�vel, se houver
#(Em vez de apagar o anterior)


#Vejamos mais um exemplo:
par(mfcol=c(2,3)) #Duas linhas e tr�s colunas

plot(x,y,type="b",pch=17,col="red")
hist(a,col="blue")
stripchart(ecolagoas$chl.a ~ ecolagoas$lagoa,v=T)
pie(c(45,32,85,63,90,23,43),col=rainbow(7))
hist(runif(100,-1,1),col="yellow")
plot(1:100,200:101+rnorm(100),type="l",col="olivedrab")

#No exemplo acima, vemos que os gr�ficos s�o plotados pelas colunas;
#quando uma coluna enche, passa-se para a pr�xima.

par(mfrow=c(1,1))
