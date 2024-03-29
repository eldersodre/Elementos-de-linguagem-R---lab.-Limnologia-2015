#################################################
#################################################
######### Aula 3.2 - n�meros aleat�rios #########
#################################################
#################################################

#### Fun��o set.seed() ####

#Em aulas anteriores, vimos duas fun��es para criar sequ�ncias de n�meros 
#aleat�rios:
#rnorm(n,mean=0,sd=1)  Cria n�meros com uma distribui��o normal
#runif(n,min=0,max=1)  Cria n�meros com uma distribui��o uniforme

#O R, na verdade, cria n�meros que parecem aleat�rios, mas que podem ser 
#reproduzidos.

#Por mais que possa parecer estranho querer gerar a mesma sequ�ncia exata 
#de n�meros aleat�rios mais de uma vez, isso tem aplica��es pr�ticas
#para reproduzir os resultados de uma an�lise, por exemplo.

#Isto � feito com a fun��o set.seed()

#Vejamos alguns exemplos:
rnorm(5)
#[1]  0.4680275  2.3741875 -0.5110467  0.4632013  0.4043113

rnorm(5)
#[1] -1.1201713  0.2636686  1.2093424  0.3946516  0.8661912

set.seed(1) #Qualquer n�mero inteiro pode ser usado para definir a seed.
rnorm(5)

set.seed(1)
rnorm(5)

#Observe que nas 2 vezes acima que a fun��o rnorm(5) foi chamada, 
#exatamente a mesma sequ�ncia de n�meros foi retornada.

#Brinque um pouco com set.seed() e a cria��o de n�meros aleat�rios.


#### Fun��es para gerar n�meros aleat�rios ####
#No R, existem uma s�rie de fun��es que criam n�meros aleat�rios de acordo com 
#uma determinada distribui��o estat�stica.
#Todas elas s�o formadas por r+nome abreviado da distribui��o.

#Pode ser �til saber quais elas s�o.
#Abaixo h� uma pequena lista com estas fun��es. N�o se esque�a de olhar a ajuda da fun��o se for do seu interesse.

rnorm() #Distribui��o normal
runif() #Distribui��o uniforme
rbinom() #Distribi��o binomial
rexp()  #Distribui��o exponencial
rlnorm() #distribui��o log-normal
rpois() #Distribui��o de poisson


#### Fun��o sample() ####
#A fun��o sample() sorteia um ou mais n�meros de um vetor.

#sample (x,size,replace=FALSE,prob=NULL)
#x --> Um vetor com um ou mais elementos para o sorteio.
#size --> A quantidade de itens a serem sorteados
#replace=FALSE --> O sorteio tem reposi��o? Se replace=TRUE, um elemento que j� foi sorteado pode sair de novo
#prob --> Um vetor de probabilidades, caso voc� quera os elementos tenham probabilidades diferentes de serem sorteados.

sample(1:6,size=1) #Sorteado um n�mero de 1 a 6.
sample(1:20,4)     #Sorteados 4 n�meros de 1 a 20.

#Se voc� n�o especificaro argumento size, size ser� igual ao comprimento de x.
sample(1:6)

#Quando replace=TRUE, um n�mero pode sair mais de uma vez.
sample(1:10,8,replace=T)


#A fun��o set.seed() tamb�m pode ser utilizada para obter resultados iguais na fun��o sample.
set.seed(9)
sample(1:5)

set.seed(9)
sample(1:5)

