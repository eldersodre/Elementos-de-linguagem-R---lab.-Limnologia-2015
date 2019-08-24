###############################
###############################
## Subconjuntos - Subsetting ##
###############################
###############################

#### Colchetes simples [] ####
#Colchetes simples podem ser usados em vetores, matrizes e dataframes.

vet <- seq(5,9,0.5)
vet
vet[1] #Separei o primeiro elemento  do vetor vet
vet[6] #Sexto elemento do vetor vet

#Colchetes também podem ser usados para separar mais de um elemento de um vetor:
vet[3:7] #Elementos 3 a 7
vet[c(5,2,8)]  #Elementos 5, 2 e 8 (nesta ordem)

# Operadores lógicos também podem ser utilizados com colchetes:
vet[vet<=7] #Todos os elementos menores ou iguais a 7

vet2 <- rnorm(20)
vet2[vet2>0] #Todos os elementos maiores que 0.

#Por fim, vetores de lógica podem ser usados também:
vet3 <- c(3,7,4,7,9)
log <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
vet3[log]


### Com objetos bidimensionais, usa-se colchetes  da seguinte forma: mat[i,j]
mat <- cbind(1:10,rnorm(10),rep(c(0,1)))
mat
mat[4,2] #Quarta linha, segunda coluna
mat[7,3] #Sétima linha, terceira coluna
mat[5:7,c(1,3)]  #Linhas 5, 6 e 7, primeira e terceira coluna.

#Um espaço vazio indica que se quer todas as linhas ou colunas:
mat[,2]  #Todas as linhas da segunda coluna
mat[8:10,] #Todas as colunas das linhas 8,9 e 10

mat[mat[,3]==1,]


#### Subconjuntos de listas ####
## Pode-se subsetar listas usando [], [[]] ou $.

lista <- list(A="Bom dia!",B=1:12,C=c(23,77,34,90))
lista

lista[2] #Colchetes simples empre retornam um objeto da mesma classe
#do objeto original. Como se trata de uma lista, [] retornará uma lista.

lista[[2]]  #Retornou um vetor

#Os nomes dos elementos podem ser usados para criar subconjuntos:

lista$C
lista[["C"]] 
lista["C"]

#Usando o nome dos elementos, $ e [[]] são similares. Porém, colchetes
#duplos permitem o nome computado, isto é:

nome <- "A"
lista$nome  #Não existe objeto nome nesta lista
lista[[nome]] 

#Para extrair mais de um objeto de uma lista, é necessário usar colchetes simples:
lista[c(1,3)] #Elementos 1 e 3 da lista.
lista[[c(1,3)]] #Erro

#O uso de uma sequência de números dentro de colchetes duplos tem outro
#significado:
lista [[c(2,7)]] #Lembram que o segundo objeto da lista é um vetor?
#O código acima retira o sétimo elemento do segundo elemento da lista.
#É a mesma coisa que escrever:

lista[[2]][7] #ou:
lista$B[7]


### IMPORTANTE! Lembram que um data frame é um tipo especial de lista?
#Todas as formas de tirar subconjuntos em listas também funcionam em data frames.

#O R, além de funções, vem com vários conjuntos de dados que podem ser usados
#para explorar as funcionalidades do R.
#mtcars é um data frame contendo consumo de combustível e outras informações
#técnicas de 32 carros dos anos 1973 e 1974.
?mtcars
attributes(mtcars)

#Usar [], [[]] e $ retornará as colunas correspondentes do data frame:
mtcars[6]          
mtcars[[6]]
mtcars[1:4]
mtcars$drat
mtcars[["mpg"]]
mtcars[[c(10,3)]]

#Para selecionar linhas e colunas, pode-se usar [i,j] de forma idêntica a uma matriz:
mtcars[10:15,1:3]  #Linhas 10 a 15, colunas 1 a 3.



#### Removando NAs ####

#Remover NAs é uma tarefa comum. Para isso, é necessário criar um vetor lógico
#que indique as posições dos NAs e usá-lo para criar o subconjunto.

x <- c(341,972,NA,NA,177,NA,504)
rm.na <- is.na(x)  #Vetor lógico que indica com as posições em que há NAs.
x[!rm.na] 


#Para remover NAs de múltiplos vetores, uma função útil é complete.cases().
#Esta função cria um vetor lógico informando onde NÃO há NAs em nenhum
#dos vetores informados.

y <- c(NA,2,NA,4,5,NA,7)
bom <- complete.cases(x,y)
x[bom]
y[bom]

#Esta função também é bastante útil para remover NAs de matrizes e data frames.
z <- matrix(1:21,7,3)
z[2,1] <- NA
z[4,1] <- NA
z[5,2] <- NA
z   #Acrescentei alguns NAs na matriz.

bom2 <- complete.cases(z)
z[bom2,]


quit()
