############################################################################
############################################################################
##### AUla 3.5 - alguns parâmetros comuns a várias funções de gráficos #####
############################################################################
############################################################################

#### Preparando os dados ####
#Para a aula de hoje, usaremos como exemplo alguns dados com os quais vocês
#já devem estar acostumados das últimas aulas.

setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Dados do ecolagoas de 2008:
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)

#Variáveis x e y:
x <- 1:20
set.seed(635)
y <- 1:20 + rnorm(20,sd=3)

#Variável a:
set.seed(60)
a <- rnorm(123)


#Já aprendemos a criar gráficos básicos. Agora, vamos aprender a alterar sua aparência.
#Há alguns argumentos que são comuns a diversos tipos de gráficos.


#### Alterando o tipo e o tamanho dos pontos ####
#O argumento pch permite alterar o tipo de ponto.
#Os valores de pch são definidos por números inteiros de 1 a 25.
#Por default, pch=1, que corresponde ao círculo vazado.

plot(x,y)
plot(x,y,pch=2)
plot(x,y,pch=10)
plot(x,y,pch=23)

#Curioso para ver todos os 25 tipos de pontos? Rode o código abaixo:
plot(x=1:25,y=rep(1,25),pch=1:25)


#O argumento cex altera o tamanho do ponto. Quando não especificado, cex=1.
plot(x,y,cex=1)
plot(x,y,cex=0.5)
plot(x,y,cex=2)
plot(x,y,cex=1.3,pch=8)


#### Alterando tipos e tamanhos de linhas ####
#O argumento lty permite alterar o tipo de linha (cheia, pontilhada, tracejada...)
#O default é lty=1, que corresponde à linha cheia.

plot(x,y,type="l")
plot(x,y,type="l",lty=2)
plot(x,y,type="l",lty=6)

#Há seis tipos de linhas disponíveis. Quer vê-los? Rode o código abaixo.
plot(x,y,xlim=c(0,5),ylim=c(0,7),type="n")
for (i in 1:6) {
  lines(x=-1:6,y=rep(i,8),lty=i)
}


#O argumento lwd altera a espessura da linha. Por default, lwd=1.
plot(x,y,type="l",lwd=1)
plot(x,y,type="l",lwd=2)
plot(x,y,type="l",lty=4,lwd=5)



#### Cores ####
#As cores dos gráficos podem ser escolhidas por meio do argumento col.
#O argumento col pode ser definido de 3 formas diferentes:
#1- Por números inteiros de 1 a 8
#2- Por uma sequência de caracteres (nome das cores em inglês)
#3- Código RGB


#1- A cor pode ser definida por números inteiros de 1 a 8, de forma semelhante
#à escolha dos tipos de pontos ou tipos de linhas.

plot(x,y,pch=15,cex=1.3,col=3)
plot(x,y,pch=15,cex=1.3,col=7)

#Use o código abaixo para ver as 8 cores possíveis:
plot(x=1:8,y=rep(1,8),pch=16,cex=5,col=1:8)


#2- A cor também pode ser definida por seu nome em inglês.
plot(x,y,col="blue")
plot(x,y,col="lightgreen")

hist(a,col="red")


#Para conferir todas as cores possíveis, use a função colors().
colors()
colors(distinct=T) #Elimina as cores idênticas

#Com isso, vemos que há 502 cores distintas possíveis! Algumas tem nomes normais,
#como "blue", "yellow, "green". Mas muitas tem nomes bem peculiares, como "darkgoldenrod","firebrick2" e "papayawhip".
#A função example() provê uma interessante demonstração das cores.
example(colors)


boxplot(ecolagoas$secchi~ecolagoas$lagoa,col="maroon4")
barplot(c(10,4,12,9),col="navy")


#3- Código RGB
#O código RGB contrói cores a partir das três cores básicas que o olho humano enxerga:
#vermelho, verde e azul. Cada cor básica adquire um cavlor de 0 a 255, num total de 
#256 x 256 x 256 = 16777216 cores possíveis.
#Não vou entrar em detalhes aqui; maiores detalhes podem ser vistos em diversos 
#sites da internet, entre eles:
http://www.rapidtables.com/web/color/RGB_Color.htm


#Alguns exemplos:
barplot(c(10,4,12,9),col="#32E6B4")
plot(x,y,pch=16,col="#336600")



#### Trabalhando com diversas cores ####
#Vamos refazer o gráfico de pizza das eleições:
eleições <- c(Juca=789,Maria=502,Zé=95,Rosinha=636,"Ana Júlia"=261)

pie(eleições)

#Quando escolhemos apenas uma cor, todo o gráfico fica com a mesma cor.
pie(eleições,col="gold")

#Para que o gráfico tenha cores diferentes, basta usar um vetor de cores:
pie(eleições,col=c(2,5,8,3,6))
plot(x,y,col=c("green","yellow"))



#Porém, há algumas funções que escolhem as cores automaticamente para você.
rainbow(n)
#A função acima escolhe automaticamente n cores espaçadas igualmente da palheta de cores escolhidas (arco-íris, no caso).

rainbow(3) #A função retorna códigos RGB.

#Vamos ver esta e outras funções em ação:
pie(eleições,col=rainbow(5))
barplot(c(10,4,12,9),col=heat.colors(4))
plot(x,y,pch=16,cex=2,col=terrain.colors(20))
pie(eleições,col=topo.colors(5))
pie(eleições,col=cm.colors(5))



#### Título e subtítulo dos gráficos ####
# O argumento main cria um título para o gráfico, enquanto o argumento sub cria o subtítulo.
plot(x,y,main="Título",sub="Subtítulo")

plot(x,y,main="Gráfico de dispersão")

#### Nome dos eixos ####
#xlab e ylab alteram o nome dos eixos.
plot(x,y,xlab="Eixo X", ylab="Eixo Y")

#Vamos plotar as concentrações de clorofila a pelo fósforo total nas lagoas costeiras:
plot(ecolagoas$P.total,ecolagoas$chl.a)

plot(ecolagoas$P.total,ecolagoas$chl.a,xlab="Fósforo Total",ylab="Clorofila  a")
#Melhor assim, não?


#### Definindo os intervalos dos eixos x e y. ####
#No gráfico acima, outliers fazem com que a maioria dos pontos fique espremida e difícil de ver.
#Os parâmetros xlim e ylim permitem alterar os intervalos dos eixos.
#Eles funcionam assim: xlim/ylim=c(min,max)

plot(ecolagoas$P.total,ecolagoas$chl.a)
plot(ecolagoas$P.total,ecolagoas$chl.a,xlim=c(0,0.3),ylim=c(0,50))
#No gráfico acima, o eixo x ficou definido entre 0 e 0.3, e o eixo y entre 0 e 50.
#Isto deixou alguns pontos fora do gráfico, mas facilitou a visualização.

#Talvez, fosse interessante "dar um zoom" maior ainda:
plot(ecolagoas$P.total,ecolagoas$chl.a,xlim=c(0,0.1),ylim=c(0,20))


#### Marcações do gráfico ####
#Os parâmetros xaxp e yaxp permitem alterar as marcações dos eixos.
#xaxp/yaxp=c(min,max,n), n==número de espaços.

plot(y~x,yaxp=c(0,20,20)) #Especifiquei que deve haver 20 marcações no eixo y, do 0 ao 20.
plot(y~x,xaxp=c(5,15,11)) #11 espeços no eixo x, do 5 ao 15.


