##### Guia para a aula 1

###Objetos e funções

#O R é orientado por objetos. Para um objeto existir, ele precisa ser criado com  <- 

5+7
x <- 7
5+x

y<-2*(x-3)

#Quando um objeto é criado, o R não retorna o seu valor.
#Para ver um objeto que foi criado, basta digitar:
print(x)
print(y)

#ou, simplesmente:
x
y

#Quando um novo objeto é criado com o mesmo nome de um objeto preexistente,
#o objeto antigo é automaticamente apagado.
x <- -10
y  <- y^4


#Um tipo especial de objeto no R são as funções. A estrutura básica de uma função é:
funcao(argumento1,argumento2,argumento3)

#Ao usar uma função, sempre usa-se parênteses!
#Argumentos são os parâmetros de uma função, e são sempre separados por vírgulas.

#Vamos dar uma olhada na função rnorm(), que cria um conjunto de números com distribuição normal.
#A função rnorm possui três argumentos:
#n: a quantidade de números desejada
#mean: a média dos números
#sd: o desvio padrão

#Agora vamos testar a função:

rnorm(n=15,mean=-1,sd=12)
rnorm(n=2,mean=300,sd=3)
rnorm(1000,mean=0,sd=10)

#Lembre-se: quando você usa uma função, o R retorna o resultado mas não salva o resultado
#Para salvar um resultado, lembre-se de criar um objeto!

#Vamos criar objetos para guardar os resultados:

a <- rnorm(n=15,mean=-1,sd=12)
b <- rnorm(n=2,mean=300,sd=3)
c <- rnorm(n=1000,mean=0,sd=10)

#Observe que, como a função rnorm() cria números aleatórios, cada vez que ela é chamada
#cria um conjunto diferente de números. Mas o objeto criado armazena uma sequência 
#específica.

rnorm(n=10,mean=0,sd=500)
rnorm(n=10,mean=0,sd=500)
rnorm(n=10,mean=0,sd=500) #Três sequências diferentes

d <- rnorm(n=10,mean=0,sd=500)
d
d
d #A mesma sequência três vezes


#Não acredita na função rnorm()? Use as funções mean() e sd() para conferir se a
#média e desvio padrão dos números está correta.

mean(a)
sd(a)
mean(b)
sd(b)
mean(c)
sd(c)
mean(d)
sd(d)



##### #Mais algumas funções úteis: #####

#Às vezes, é necessário saber quais objetos estão salvos.
#Outras vezes, é necessário excluí-los. Para isso servem as funções ls() e rm()
ls()  #Retorna o nome dos objetos criados.Esta função não tem argumentos.
rm("objeto")  #Exclui o objeto chamado objeto.
rm(list=c("a","b"))  #Exclui os objetos "a" e "b".
rm(list=ls())        #Exclui todos os objetos criados.



#### Obtendo ajuda ####

#A COISA MAIS IMPORTANTE QUE EU POSSO ENSINAR A VOCÊS É COMO BUSCAREM AJUDA SOZINHOS!!!

#Uma maneira de biscar ajuda é com a função help().
help(rnorm)

#Outra forma mais simples, que tem o mesmo resultado é: ?função
?rnorm

#Se você não lembra o nome da função, use dois pontos de interrogação:
??sequence

#Outras funções interessantes para pedir ajuda:
help.start()        #Ajuda geral
apropos("nor")      #Lista todas as funções que contém "nor"
args(rnorm)         #Argumentos da função rnorm
example(mean)       #Mostra um exemplo da função mean


#Além disso, não deixe de procurar ajuda na internet se for necessário.
#Alguns sites recomendados:
http://www.statmethods.net/ #Contém diversos tutoriais
http://www.rseek.org/       #Muito útil. Pode ser considerado o google do R
http://stackoverflow.com/
http://pt.stackoverflow.com/#Site de perguntas e respostas para programadores
  #profissionais ou amadores
https://www.google.com.br/  #Google. Dispensa apresentações
  
  

















