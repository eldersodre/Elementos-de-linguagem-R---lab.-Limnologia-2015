###########################################################
###########################################################
############### Aula 3.7 - parâmetros globais #############
###########################################################
###########################################################

#### Preparando os dados ####
#Para a aula de hoje, usaremos como exemplo alguns dados com os quais vocês
#já devem estar acostumados das últimas aulas.

setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Dados do ecolagoas de 2008:
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)

#Dados de zooplâncton do lago Batata em 1998:
batata <- read.csv2("zoobatata1998.csv",row.names=1)
zoo <- batata[,3:53] #apenas as colunas com as densidades

#Variáveis x e y:
x <- 1:20
set.seed(635)
y <- 1:20 + rnorm(20,sd=3)

#Variável a:
set.seed(60)
a <- rnorm(123)


# A função par() altera parâmetros globais de gráficos. Isto significa que,
#uma vez alterados, eles afetarão todos os gráficos daquele momento em diante.

#A função par(), sem argumentos, retorna uma lista com todos os parâmetros e seus valores atuais:
par()
?par

#Por exemplo, bg é o fundo do gráfico.
#Podemos alterar este parâmetro com o comando abaixo:

par(bg="lightblue")
#De agora em diante, todos os gráficos que fizermos terão um fundo azul claro.

plot(x,y)
hist(a,col="green")

#IMPORTANTE: Não existe nenhuma função que retorne automaticamente os parâmetros
#globais ao default. Para retornar ao default, você precisa fazer isso manualmente.

par(bg="white")
plot(x,y)


#Outro parâmetro global é mar, que especifica o tamanho das margens.
#Ele é um vetor com 4 elementos, na fórmula: c(embaixo,esquerda,acima,direita).
#Seu default é c(5, 4, 4, 2) + 0.1.
#Vejamos o que acontece quando mexemos nele:

par(mar=c(1,4,4,2))  #Diminuí as margens abaixo do gráfico.
plot(x,y)
hist(a)
#Observe que eixos e títulos podem ser cortados ao diminuir o tamanho das margens.

par(mar=c(3,0,1,7))  #Diminuí as margens abaixo do gráfico.
plot(x,y)
hist(a)

par(mar=c(5,4,4,2)+0.1)



#### Alterando o número de linhas e colunas ####
#Há muitos parâmetros globais, mas os mais importantes são provavelmente mfrow e mfcol.
#mfrow e mfcol fazem exatamente a mesma coisa. São usados : mfrow=c(linhas,colunas)
#No default, mfrow=c(1,1), ou seja, um gráfico apenas.

#Vamos brincar um pouco:
par(mfrow=c(2,1)) #Duas linhas e uma coluna, ou seja, um gráfico em cima do outro.
plot(x,y)
hist(a)

par(mfrow=c(1,2)) #Uma linha e duas colunas, ou seja, um gráfico ao lado do outro.
plot(x,y)
hist(a)

#Quando o espaço dos gráficos está dividido, cada novo gráfico criado ocupa um espaço disponível, se houver
#(Em vez de apagar o anterior)


#Vejamos mais um exemplo:
par(mfcol=c(2,3)) #Duas linhas e três colunas

plot(x,y,type="b",pch=17,col="red")
hist(a,col="blue")
stripchart(ecolagoas$chl.a ~ ecolagoas$lagoa,v=T)
pie(c(45,32,85,63,90,23,43),col=rainbow(7))
hist(runif(100,-1,1),col="yellow")
plot(1:100,200:101+rnorm(100),type="l",col="olivedrab")

#No exemplo acima, vemos que os gráficos são plotados pelas colunas;
#quando uma coluna enche, passa-se para a próxima.

par(mfrow=c(1,1))
