####################################################################
####################################################################
#################### Aula 3.6 - anota��es ##########################
####################################################################
####################################################################

#Os gr�ficos do R no pacote base usam fun��es diferentes para criar 
#gr�ficos e para anotar gr�ficos. Anotar significa adicionar elementos
#a um gr�fico pronto. Esses elementos podem ser textos, linhas, pontos, legendas...


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



#### Adicionando linhas ####

# A fun��o abline() acresenta uma linha reta a um gr�fico existente.
#Quatro importantes argumentos desta fun��o s�o: a,b,h,v.

#h & v acrescentam uma linha horizontal ou vertical, respectivamente; basta especificar
#o ponto em que a linha atravessar� o eixo x (linha vertical) ou o eixo y (linha horizontal).

plot(x,y)
abline(h=5) #Acrescentei uma linha horizontal
abline(v=10) #Acrescentei uma linha vertical
abline(v=15,col="orange",lty=2,lwd=4) #Outra linha vertical

#Lembre-se que � poss�vel acrescentar novos elementos a um gr�fico,
#mas n�o � poss�vel apagar nada de um gr�fico. 
#Por exemplo, se no gr�fico acima eu quiser manter apenas a linha laranja,
#eu preciso criar um gr�fico novo.
plot(x,y)
abline(v=15,col="orange",lty=2,lwd=4)


#Os argumentos a e b da fun��o abline() acrescentam uma linha reta inclinada 
#ao gr�fico, especificando o intercepto e a inclina��o da reta.
#Lembre=se: a equivale ao intercepto da reta (lugar onde ela encontra o eixo y)
#e b equivale � inclina��o (tangente do �ngulo formado com o eixo x) 
#(equa��o da reta: y=a + bx)

plot(x,y)
abline(a=5,b=1)

hist(a)
abline(a=12,b=-5,col="red",lwd=3)


#Para adicionar uma linha de tend�ncia ao gr�fico de dispers�o,
#basta utilizar a fun��o lm(), que cria um modelo linear.
#Use a seguinte f�rmula:
plot(x,y)
abline(lm(y~x))

#Ou, se preferir, crie um objeto com os resultados de lm() e use este objeto na fun��o abline().
plot(x,y)
fit <- lm(y~x)
abline(fit)



#### Acrescentando mais dados ao gr�fico ####
#Para exemplificar a adi��o de novos dados a um gr�fico, usaremos os 
#dados de zoopl�ncton no lago Batata em 1998.

#Dados de zoopl�ncton do lago Batata em 1998:
batata <- read.csv2("zoobatata1998.csv",row.names=1)
zoo <- batata[,3:53] #apenas as colunas com as densidades
rowSums(zoo) #Densidades
dens <- cbind(batata[,1:2],Densidade=rowSums(zoo)) #Dataframe com as densidades totais em cada coleta.
#O dataframe acima n�o cont�m nenhum valor de x para plotar. Vamos criar.
dens <- cbind(dens,x=rep(1:4,2))

#Vamos plotar o gr�fico:
plot(dens$Densidade~dens$x)

#Observe que, nestes dados, a esta��o de coleta � importante, mas plotar todos os pontos
#juntos n�o permite diferenciar entre ambas.

#H� duas fun��es para acrescentar mais dados: points() e lines(). As duas fazem exatamente
#a mesma coisa, com a diferen�a que, por default, em points() type="p". Em lines(),
#type="l".

#points() e lines() s�o semelhantes � fun��o plot(). Por�m, plot() cria um gr�fico
#novo e acrescenta os dados, enquanto points() e lines() apenas acrescentam dados
#a um gr�fico preexistente.

#Voltando ao caso do lago Batata, uma solu��o para o nosso problema seria plotar o
#gr�fico vazio e depois acresentar os pontos.

plot(dens$Densidade~dens$x,type="n")

#Agora eu preciso separar os dados das duas esta��es de coleta.
#Por exemplo, com a fun��o split:
split(dens,f=dens$Esta��o)
d08 <- split(dens,f=dens$Esta��o)$E08
d10 <- split(dens,f=dens$Esta��o)$E10

#Vamos voltar ao nosso gr�fico:
plot(dens$Densidade~dens$x,type="n")
points(d08$Densidade~d08$x,pch=16,col="blue")
points(d10$Densidade~d10$x,pch=16,col="red")


#Pronto! Agora, como demonstra��o, vamos fazer a mesma coisa usando a fun��o lines()
plot(dens$Densidade~dens$x,type="n",xlab="",ylab="")
lines(d08$Densidade~d08$x,lwd=3,col="blue")
lines(d10$Densidade~d10$x,lwd=3,col="red")


#### Acrescentando legendas ####
#Ainda faltam acrescentar legandas ao gr�fico acima, certo?
#Isto � feito com a fun��o legend()
#Tr�s argumentos desta  fun��o s�o x, y e legend. x e y especificam
#as coordenadas da legenda e legend especifica o texto.

plot(dens$Densidade~dens$x,type="n",xlab="",ylab="")
lines(d08$Densidade~d08$x,type="b",pch=16,lty=2,lwd=3,col="blue")
lines(d10$Densidade~d10$x,type="b",pch=16,lty=3,lwd=3,col="red")

legend(x=2.5,y=100000,legend="Legenda")

#A legenda acima serviu como demonstra��o, mas ainda n�o � muito �til.

legend(x=1,y=300000,legend=c("E08","E10")) #Agora melhorou, mas falta dizer quem � quem.

#O R n�o calcula automaticamente os par�mentros (pontos, linhas, cores) da legenda.
#� necess�rio diz�-lo novamente ao programa.
legend(x=1,y=300000,legend=c("E08","E10"),pch=16,lty=c(2,3),lwd=3,col=c("blue","red"))


#H� ainda outras formas de customizar a legenda. Para maiores informa��es, confira em ?legend .

#### Acrescentando t�tulos ####
#Tamb�m � poss�vel acrescentar t�tulos dos gr�ficos e eixos, com a fun��o title().
#A fun��o title() usa os argumentos main, sub, xlab e ylab, que j� sabemos como funciona.

plot(dens$Densidade~dens$x,type="n",xlab="",ylab="")
lines(d08$Densidade~d08$x,type="b",pch=16,lty=2,lwd=3,col="blue")
lines(d10$Densidade~d10$x,type="b",pch=16,lty=3,lwd=3,col="red")
legend(x=1,y=300000,legend=c("E08","E10"),pch=16,lty=c(2,3),lwd=3,col=c("blue","red"))

title(main="Zoopl�ncton do lago Batata em 1998",ylab="Densidades")



#### Acrescentar texto ####

#A fun��o text() acrescenta texto a um gr�fico. Os argumentos x e y equivalem �s coordenadas,
#enquanto label � o texto propriamente dito.

plot(x,y)
text(x=15,y=5,label="TEXTO")

hist(a,col="black")
text(x=mean(a),y=15,"M�dia",col="white")

#Mais de um texto pode ser inclu�do ao mesmo tempo.
plot(dens$Densidade~dens$x,type="n",xlab="",ylab="")
lines(d08$Densidade~d08$x,type="b",pch=16,lty=2,lwd=3,col="blue")
lines(d10$Densidade~d10$x,type="b",pch=16,lty=3,lwd=3,col="red")
legend(x=1,y=300000,legend=c("E08","E10"),pch=16,lty=c(2,3),lwd=3,col=c("blue","red"))
title(main="Zoopl�ncton do lago Batata em 1998",ylab="Densidades")

text(x=1:4,y=100000,label=c("enchente","�guas altas","vazante","�guas baixas"))




