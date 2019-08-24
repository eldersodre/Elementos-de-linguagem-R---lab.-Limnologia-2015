##### Classes básicas de objetos


##O R possui 5 classes básicas de objetos:

#character (caracter; texto)
#numeric (números reais)
#integer (números inteiros)
#complex (números complexos)
#logic (lógica; verdadeiro ou falso)


#Texto devem estar sempre envolvidos por aspas; caso contrário o R os tratará como objetos

a <- 23
a
"a"
b <- "a"
b

class(b)


#Na maioria das vezes, R trata os números como números reais.
c <- 20
d <- 14.7

class(c)
class(d)

#Para dizer explicitamente que você quer um número inteiro,
#basta acrescentar o sufixo L
e <- 34L
class(e)

#Números complexos são formados adicionando-se i a um número real
f <- 12+3i
class(f)

#Um número especial é o Inf (infinito). Inf pode ser usado em cálculos e aparecer
#como resposta em cálculos.
1/0
1/Inf
Inf+Inf

#Outro número especial é NaN (not a number; não é um número)
0/0

#Objetos de lógica são representados por TRUE/FALSE, ou, resumidamente T/F.
TRUE
FALSE
T
F

#Lógicas aparecem como resultados de operadores lógicos, como > e ==
45>9       #Maior que
23<10+3    #Menor que
2>=2       #Maior ou igual a
8<=2*10    #Menor ou igual a
10+3!=14-1 #Diferente de
4+2==7     #Igual a

#IMPORTANTE! Deve-se usar == para representar o operador lógico. Apenas o =
#tem outra função no R.



#### Vetores

#Vetor é um tipo de objeto composto por uma sequência de elementos.
#Todos os elementos de um vetor precisam ser do mesmo tipo.
#A exceção desta regra é um tipo de vetor chamado lista. Elementos da lista podem ser 
#de qualquer tipo (inclusive outra lista)

## Criando vetores
#Como juntar dois ou mais objetos formando um vetor?
#Com a função c(), onde c vem se concatenar, ou combinar

a <- c(3,4.5,0)                   
b <- c("Elder","é muito","legal","!")
c <- c(T,T,F,T)

#Objetos também podem ser concatenados em um vetor.
d <- c(-2,a,67,8,a)
print(d)


#Lembra que todos os elementos de um vetor precisam ser do mesmo tipo?
#O que acontece quando junto elementos de tipos diferentes em um vetor?
#Vamos ver!

v1 <- c(4.7,10L)     #Numeric + Integer
v2 <- c(4.6,9-2i)    #Numeric + complex
v3 <- c(1,F)         #Numeric + Logic
v4 <- c(8L,"Elder")  #Integer + Character
v5 <- c(TRUE, "olá") #Logic + Character
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

#Quando tentamos juntar objetos de tipos diferentes no mesmo vetor, o R usa de "coerção"
#para transformar  os objetos para que fiquem do mesmo tipo.
#O R usa esta ordem automática de coerção:
#logic-->integer-->numeric-->complex-->character

#Para alterar o tipo de um vetor, basta usar funções começadas com as. :
as.integer
as.numeric
as.complex
as.character

#OBS: Funções começadas com is. servem para perguntar se o vetor é daquele determinado tipo
is.integer
is.numeric
is.complex
is.character


#Uma forma comum de se criar um vetor é com o uso de dois pontos(:)
#Desta forma cria-se uma sequência do primeiro ao último número.
1:10
8:287
10:-10
7.8:16.2



#A função seq() é semelhante, mas ela permite que você determine o intervalo entre 
#os números na sequência
seq(1,10) #resultado idêntico a  1:10
seq(3,-3,by=-0.5)
seq(1,2,by=0.03)


#A função rep() cria um vetor através da repetição de um vetor ou número
rep(0,5)
rep(7,3)
t <- c(1,2,3)
rep(t,3)
rep(t,each=3)
rep(c(T,F),5)


#Outra função para criar um vetor é vector.
vector() #Vetor vazio.

#Também é possível com esta função especificar o tipo de vetor (logical é o default)
#e o comprimento
vector(length=6)
vector(mode="numeric",length = 10)

#Duas funções pra criar números aleatórios: runif(distribuição uniforme) e rnorm(distribuição normal)
runif(n=20,min=3,max=5) #Crai 20 números aleatórios com distribuição normal, entre 3 e 5
rnorm(n=10,mean=0,sd=0.5) #Cria um vetor com dez números aleatórios, de média 0 e desvio padrão 0.5

### Algumas funções interessantes para vetores numéricos:
x <- rnorm(n=100,mean=30,sd=5)
min(x)  #Valor mínimo
max(x)  #Valor máximo
mean(x) #Média
sd(x)   #Desvio padrão




### Mais algumas funções úteis:
#Três funções úteis para vetores são class(), length() e names()
vet1 <- c("a","b","c")
vet2 <- c(9,12,90,0,5)

class(vet1)
class(vet2) #Pergunta a classe do vetor

length(vet1)
length(vet2) #Pergunta o comprimento do vetor (número de elementos)

#Ao criar um vetor com a função c(), pode-se dar nomes aos elementos:
notas <- c(Juca=9.5,Juju=6.8,Zeca=5,Mina=10,Rosinha=9)
notas
names(notas)


#As funções length() e names() também podem ser usadas para alterar
#o nome e o comprimento do vetor.
length(vet1) <- 10
vet1

length(vet2) <- 3
vet2

names(vet2) <- c("A","B","C")
vet2


### Operações com vetores
#Vamos olhar as operações abaixo:
1:4+c(10,5,0,-5)

# Quando os dois vetores na operação não possuem o mesmo comprimento,
#o R "recicla", ou seja, repete, o vetor menor até que o comprimento
#do vetor maior seja alcançado.
rep(3,4)*c(10,0)
10:15/2
#A expressão acima, para o R, é igual a:
10:15/c(2,2,2,2,2,2)

#Se o comprimento do vetor maior não for múltiplo do vetor menor,
#o R dá uma mensagem de erro mas faz o cálculo mesmo assim:
c(1,5,3,6,7,4,5)-c(12,11)




