############################################################################
############################################################################
##### AUla 3.5 - alguns par�metros comuns a v�rias fun��es de gr�ficos #####
############################################################################
############################################################################

#### Preparando os dados ####
#Para a aula de hoje, usaremos como exemplo alguns dados com os quais voc�s
#j� devem estar acostumados das �ltimas aulas.

setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Dados do ecolagoas de 2008:
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)

#Vari�veis x e y:
x <- 1:20
set.seed(635)
y <- 1:20 + rnorm(20,sd=3)

#Vari�vel a:
set.seed(60)
a <- rnorm(123)


#J� aprendemos a criar gr�ficos b�sicos. Agora, vamos aprender a alterar sua apar�ncia.
#H� alguns argumentos que s�o comuns a diversos tipos de gr�ficos.


#### Alterando o tipo e o tamanho dos pontos ####
#O argumento pch permite alterar o tipo de ponto.
#Os valores de pch s�o definidos por n�meros inteiros de 1 a 25.
#Por default, pch=1, que corresponde ao c�rculo vazado.

plot(x,y)
plot(x,y,pch=2)
plot(x,y,pch=10)
plot(x,y,pch=23)

#Curioso para ver todos os 25 tipos de pontos? Rode o c�digo abaixo:
plot(x=1:25,y=rep(1,25),pch=1:25)


#O argumento cex altera o tamanho do ponto. Quando n�o especificado, cex=1.
plot(x,y,cex=1)
plot(x,y,cex=0.5)
plot(x,y,cex=2)
plot(x,y,cex=1.3,pch=8)


#### Alterando tipos e tamanhos de linhas ####
#O argumento lty permite alterar o tipo de linha (cheia, pontilhada, tracejada...)
#O default � lty=1, que corresponde � linha cheia.

plot(x,y,type="l")
plot(x,y,type="l",lty=2)
plot(x,y,type="l",lty=6)

#H� seis tipos de linhas dispon�veis. Quer v�-los? Rode o c�digo abaixo.
plot(x,y,xlim=c(0,5),ylim=c(0,7),type="n")
for (i in 1:6) {
  lines(x=-1:6,y=rep(i,8),lty=i)
}


#O argumento lwd altera a espessura da linha. Por default, lwd=1.
plot(x,y,type="l",lwd=1)
plot(x,y,type="l",lwd=2)
plot(x,y,type="l",lty=4,lwd=5)



#### Cores ####
#As cores dos gr�ficos podem ser escolhidas por meio do argumento col.
#O argumento col pode ser definido de 3 formas diferentes:
#1- Por n�meros inteiros de 1 a 8
#2- Por uma sequ�ncia de caracteres (nome das cores em ingl�s)
#3- C�digo RGB


#1- A cor pode ser definida por n�meros inteiros de 1 a 8, de forma semelhante
#� escolha dos tipos de pontos ou tipos de linhas.

plot(x,y,pch=15,cex=1.3,col=3)
plot(x,y,pch=15,cex=1.3,col=7)

#Use o c�digo abaixo para ver as 8 cores poss�veis:
plot(x=1:8,y=rep(1,8),pch=16,cex=5,col=1:8)


#2- A cor tamb�m pode ser definida por seu nome em ingl�s.
plot(x,y,col="blue")
plot(x,y,col="lightgreen")

hist(a,col="red")


#Para conferir todas as cores poss�veis, use a fun��o colors().
colors()
colors(distinct=T) #Elimina as cores id�nticas

#Com isso, vemos que h� 502 cores distintas poss�veis! Algumas tem nomes normais,
#como "blue", "yellow, "green". Mas muitas tem nomes bem peculiares, como "darkgoldenrod","firebrick2" e "papayawhip".
#A fun��o example() prov� uma interessante demonstra��o das cores.
example(colors)


boxplot(ecolagoas$secchi~ecolagoas$lagoa,col="maroon4")
barplot(c(10,4,12,9),col="navy")


#3- C�digo RGB
#O c�digo RGB contr�i cores a partir das tr�s cores b�sicas que o olho humano enxerga:
#vermelho, verde e azul. Cada cor b�sica adquire um cavlor de 0 a 255, num total de 
#256 x 256 x 256 = 16777216 cores poss�veis.
#N�o vou entrar em detalhes aqui; maiores detalhes podem ser vistos em diversos 
#sites da internet, entre eles:
http://www.rapidtables.com/web/color/RGB_Color.htm


#Alguns exemplos:
barplot(c(10,4,12,9),col="#32E6B4")
plot(x,y,pch=16,col="#336600")



#### Trabalhando com diversas cores ####
#Vamos refazer o gr�fico de pizza das elei��es:
elei��es <- c(Juca=789,Maria=502,Z�=95,Rosinha=636,"Ana J�lia"=261)

pie(elei��es)

#Quando escolhemos apenas uma cor, todo o gr�fico fica com a mesma cor.
pie(elei��es,col="gold")

#Para que o gr�fico tenha cores diferentes, basta usar um vetor de cores:
pie(elei��es,col=c(2,5,8,3,6))
plot(x,y,col=c("green","yellow"))



#Por�m, h� algumas fun��es que escolhem as cores automaticamente para voc�.
rainbow(n)
#A fun��o acima escolhe automaticamente n cores espa�adas igualmente da palheta de cores escolhidas (arco-�ris, no caso).

rainbow(3) #A fun��o retorna c�digos RGB.

#Vamos ver esta e outras fun��es em a��o:
pie(elei��es,col=rainbow(5))
barplot(c(10,4,12,9),col=heat.colors(4))
plot(x,y,pch=16,cex=2,col=terrain.colors(20))
pie(elei��es,col=topo.colors(5))
pie(elei��es,col=cm.colors(5))



#### T�tulo e subt�tulo dos gr�ficos ####
# O argumento main cria um t�tulo para o gr�fico, enquanto o argumento sub cria o subt�tulo.
plot(x,y,main="T�tulo",sub="Subt�tulo")

plot(x,y,main="Gr�fico de dispers�o")

#### Nome dos eixos ####
#xlab e ylab alteram o nome dos eixos.
plot(x,y,xlab="Eixo X", ylab="Eixo Y")

#Vamos plotar as concentra��es de clorofila a pelo f�sforo total nas lagoas costeiras:
plot(ecolagoas$P.total,ecolagoas$chl.a)

plot(ecolagoas$P.total,ecolagoas$chl.a,xlab="F�sforo Total",ylab="Clorofila  a")
#Melhor assim, n�o?


#### Definindo os intervalos dos eixos x e y. ####
#No gr�fico acima, outliers fazem com que a maioria dos pontos fique espremida e dif�cil de ver.
#Os par�metros xlim e ylim permitem alterar os intervalos dos eixos.
#Eles funcionam assim: xlim/ylim=c(min,max)

plot(ecolagoas$P.total,ecolagoas$chl.a)
plot(ecolagoas$P.total,ecolagoas$chl.a,xlim=c(0,0.3),ylim=c(0,50))
#No gr�fico acima, o eixo x ficou definido entre 0 e 0.3, e o eixo y entre 0 e 50.
#Isto deixou alguns pontos fora do gr�fico, mas facilitou a visualiza��o.

#Talvez, fosse interessante "dar um zoom" maior ainda:
plot(ecolagoas$P.total,ecolagoas$chl.a,xlim=c(0,0.1),ylim=c(0,20))


#### Marca��es do gr�fico ####
#Os par�metros xaxp e yaxp permitem alterar as marca��es dos eixos.
#xaxp/yaxp=c(min,max,n), n==n�mero de espa�os.

plot(y~x,yaxp=c(0,20,20)) #Especifiquei que deve haver 20 marca��es no eixo y, do 0 ao 20.
plot(y~x,xaxp=c(5,15,11)) #11 espe�os no eixo x, do 5 ao 15.


