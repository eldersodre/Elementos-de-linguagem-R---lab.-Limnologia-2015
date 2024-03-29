##### Classes b�sicas de objetos


##O R possui 5 classes b�sicas de objetos:

#character (caracter; texto)
#numeric (n�meros reais)
#integer (n�meros inteiros)
#complex (n�meros complexos)
#logic (l�gica; verdadeiro ou falso)


#Texto devem estar sempre envolvidos por aspas; caso contr�rio o R os tratar� como objetos

a <- 23
a
"a"
b <- "a"
b

class(b)


#Na maioria das vezes, R trata os n�meros como n�meros reais.
c <- 20
d <- 14.7

class(c)
class(d)

#Para dizer explicitamente que voc� quer um n�mero inteiro,
#basta acrescentar o sufixo L
e <- 34L
class(e)

#N�meros complexos s�o formados adicionando-se i a um n�mero real
f <- 12+3i
class(f)

#Um n�mero especial � o Inf (infinito). Inf pode ser usado em c�lculos e aparecer
#como resposta em c�lculos.
1/0
1/Inf
Inf+Inf

#Outro n�mero especial � NaN (not a number; n�o � um n�mero)
0/0

#Objetos de l�gica s�o representados por TRUE/FALSE, ou, resumidamente T/F.
TRUE
FALSE
T
F

#L�gicas aparecem como resultados de operadores l�gicos, como > e ==
45>9       #Maior que
23<10+3    #Menor que
2>=2       #Maior ou igual a
8<=2*10    #Menor ou igual a
10+3!=14-1 #Diferente de
4+2==7     #Igual a

#IMPORTANTE! Deve-se usar == para representar o operador l�gico. Apenas o =
#tem outra fun��o no R.



#### Vetores

#Vetor � um tipo de objeto composto por uma sequ�ncia de elementos.
#Todos os elementos de um vetor precisam ser do mesmo tipo.
#A exce��o desta regra � um tipo de vetor chamado lista. Elementos da lista podem ser 
#de qualquer tipo (inclusive outra lista)

## Criando vetores
#Como juntar dois ou mais objetos formando um vetor?
#Com a fun��o c(), onde c vem se concatenar, ou combinar

a <- c(3,4.5,0)                   
b <- c("Elder","� muito","legal","!")
c <- c(T,T,F,T)

#Objetos tamb�m podem ser concatenados em um vetor.
d <- c(-2,a,67,8,a)
print(d)


#Lembra que todos os elementos de um vetor precisam ser do mesmo tipo?
#O que acontece quando junto elementos de tipos diferentes em um vetor?
#Vamos ver!

v1 <- c(4.7,10L)     #Numeric + Integer
v2 <- c(4.6,9-2i)    #Numeric + complex
v3 <- c(1,F)         #Numeric + Logic
v4 <- c(8L,"Elder")  #Integer + Character
v5 <- c(TRUE, "ol�") #Logic + Character
v6 <- c(FALSE, TRUE, 4) #Logic + Numeric

class(v1)
class(v2)
class(v3)
class(v4)
class(v5)
class(v6)

v1
v2
v3
v4
v5
v6

#Quando tentamos juntar objetos de tipos diferentes no mesmo vetor, o R usa de "coer��o"
#para transformar  os objetos para que fiquem do mesmo tipo.
#O R usa esta ordem autom�tica de coer��o:
#logic-->integer-->numeric-->complex-->character

#Para alterar o tipo de um vetor, basta usar fun��es come�adas com as. :
as.integer
as.numeric
as.complex
as.character

#OBS: Fun��es come�adas com is. servem para perguntar se o vetor � daquele determinado tipo
is.integer
is.numeric
is.complex
is.character


#Uma forma comum de se criar um vetor � com o uso de dois pontos(:)
#Desta forma cria-se uma sequ�ncia do primeiro ao �ltimo n�mero.
1:10
8:287
10:-10
7.8:16.2



#A fun��o seq() � semelhante, mas ela permite que voc� determine o intervalo entre 
#os n�meros na sequ�ncia
seq(1,10) #resultado id�ntico a  1:10
seq(3,-3,by=-0.5)
seq(1,2,by=0.03)


#A fun��o rep() cria um vetor atrav�s da repeti��o de um vetor ou n�mero
rep(0,5)
rep(7,3)
t <- c(1,2,3)
rep(t,3)
rep(t,each=3)
rep(c(T,F),5)


#Outra fun��o para criar um vetor � vector.
vector() #Vetor vazio.

#Tamb�m � poss�vel com esta fun��o especificar o tipo de vetor (logical � o default)
#e o comprimento
vector(length=6)
vector(mode="numeric",length = 10)

#Duas fun��es pra criar n�meros aleat�rios: runif(distribui��o uniforme) e rnorm(distribui��o normal)
runif(n=20,min=3,max=5) #Crai 20 n�meros aleat�rios com distribui��o normal, entre 3 e 5
rnorm(n=10,mean=0,sd=0.5) #Cria um vetor com dez n�meros aleat�rios, de m�dia 0 e desvio padr�o 0.5

### Algumas fun��es interessantes para vetores num�ricos:
x <- rnorm(n=100,mean=30,sd=5)
min(x)  #Valor m�nimo
max(x)  #Valor m�ximo
mean(x) #M�dia
sd(x)   #Desvio padr�o




### Mais algumas fun��es �teis:
#Tr�s fun��es �teis para vetores s�o class(), length() e names()
vet1 <- c("a","b","c")
vet2 <- c(9,12,90,0,5)

class(vet1)
class(vet2) #Pergunta a classe do vetor

length(vet1)
length(vet2) #Pergunta o comprimento do vetor (n�mero de elementos)

#Ao criar um vetor com a fun��o c(), pode-se dar nomes aos elementos:
notas <- c(Juca=9.5,Juju=6.8,Zeca=5,Mina=10,Rosinha=9)
notas
names(notas)


#As fun��es length() e names() tamb�m podem ser usadas para alterar
#o nome e o comprimento do vetor.
length(vet1) <- 10
vet1

length(vet2) <- 3
vet2

names(vet2) <- c("A","B","C")
vet2


### Opera��es com vetores
#Vamos olhar as opera��es abaixo:
1:4+c(10,5,0,-5)

# Quando os dois vetores na opera��o n�o possuem o mesmo comprimento,
#o R "recicla", ou seja, repete, o vetor menor at� que o comprimento
#do vetor maior seja alcan�ado.
rep(3,4)*c(10,0)
10:15/2
#A express�o acima, para o R, � igual a:
10:15/c(2,2,2,2,2,2)

#Se o comprimento do vetor maior n�o for m�ltiplo do vetor menor,
#o R d� uma mensagem de erro mas faz o c�lculo mesmo assim:
c(1,5,3,6,7,4,5)-c(12,11)




