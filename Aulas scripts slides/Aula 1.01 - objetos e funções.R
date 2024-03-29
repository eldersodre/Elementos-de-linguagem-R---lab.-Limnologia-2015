##### Guia para a aula 1

###Objetos e fun��es

#O R � orientado por objetos. Para um objeto existir, ele precisa ser criado com  <- 

5+7
x <- 7
5+x

y<-2*(x-3)

#Quando um objeto � criado, o R n�o retorna o seu valor.
#Para ver um objeto que foi criado, basta digitar:
print(x)
print(y)

#ou, simplesmente:
x
y

#Quando um novo objeto � criado com o mesmo nome de um objeto preexistente,
#o objeto antigo � automaticamente apagado.
x <- -10
y  <- y^4


#Um tipo especial de objeto no R s�o as fun��es. A estrutura b�sica de uma fun��o �:
funcao(argumento1,argumento2,argumento3)

#Ao usar uma fun��o, sempre usa-se par�nteses!
#Argumentos s�o os par�metros de uma fun��o, e s�o sempre separados por v�rgulas.

#Vamos dar uma olhada na fun��o rnorm(), que cria um conjunto de n�meros com distribui��o normal.
#A fun��o rnorm possui tr�s argumentos:
#n: a quantidade de n�meros desejada
#mean: a m�dia dos n�meros
#sd: o desvio padr�o

#Agora vamos testar a fun��o:

rnorm(n=15,mean=-1,sd=12)
rnorm(n=2,mean=300,sd=3)
rnorm(1000,mean=0,sd=10)

#Lembre-se: quando voc� usa uma fun��o, o R retorna o resultado mas n�o salva o resultado
#Para salvar um resultado, lembre-se de criar um objeto!

#Vamos criar objetos para guardar os resultados:

a <- rnorm(n=15,mean=-1,sd=12)
b <- rnorm(n=2,mean=300,sd=3)
c <- rnorm(n=1000,mean=0,sd=10)

#Observe que, como a fun��o rnorm() cria n�meros aleat�rios, cada vez que ela � chamada
#cria um conjunto diferente de n�meros. Mas o objeto criado armazena uma sequ�ncia 
#espec�fica.

rnorm(n=10,mean=0,sd=500)
rnorm(n=10,mean=0,sd=500)
rnorm(n=10,mean=0,sd=500) #Tr�s sequ�ncias diferentes

d <- rnorm(n=10,mean=0,sd=500)
d
d
d #A mesma sequ�ncia tr�s vezes


#N�o acredita na fun��o rnorm()? Use as fun��es mean() e sd() para conferir se a
#m�dia e desvio padr�o dos n�meros est� correta.

mean(a)
sd(a)
mean(b)
sd(b)
mean(c)
sd(c)
mean(d)
sd(d)



##### #Mais algumas fun��es �teis: #####

#�s vezes, � necess�rio saber quais objetos est�o salvos.
#Outras vezes, � necess�rio exclu�-los. Para isso servem as fun��es ls() e rm()
ls()  #Retorna o nome dos objetos criados.Esta fun��o n�o tem argumentos.
rm("objeto")  #Exclui o objeto chamado objeto.
rm(list=c("a","b"))  #Exclui os objetos "a" e "b".
rm(list=ls())        #Exclui todos os objetos criados.



#### Obtendo ajuda ####

#A COISA MAIS IMPORTANTE QUE EU POSSO ENSINAR A VOC�S � COMO BUSCAREM AJUDA SOZINHOS!!!

#Uma maneira de biscar ajuda � com a fun��o help().
help(rnorm)

#Outra forma mais simples, que tem o mesmo resultado �: ?fun��o
?rnorm

#Se voc� n�o lembra o nome da fun��o, use dois pontos de interroga��o:
??sequence

#Outras fun��es interessantes para pedir ajuda:
help.start()        #Ajuda geral
apropos("nor")      #Lista todas as fun��es que cont�m "nor"
args(rnorm)         #Argumentos da fun��o rnorm
example(mean)       #Mostra um exemplo da fun��o mean


#Al�m disso, n�o deixe de procurar ajuda na internet se for necess�rio.
#Alguns sites recomendados:
http://www.statmethods.net/ #Cont�m diversos tutoriais
http://www.rseek.org/       #Muito �til. Pode ser considerado o google do R
http://stackoverflow.com/
http://pt.stackoverflow.com/#Site de perguntas e respostas para programadores
  #profissionais ou amadores
https://www.google.com.br/  #Google. Dispensa apresenta��es
  
  

















