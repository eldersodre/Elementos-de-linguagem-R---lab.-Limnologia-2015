###### MATRIZES, LISTAS, FATORES E DATA FRAMES


#### Matrizes

#Uma matriz, no R, é basicamente um vetor com dimensão.
#Matrizes são compostas por linhas e colunas

#Uma das maneiras para criar uma matriz é pela função matrix():
matrix()  #Cria uma matriz vazia
matrix(1:20,nrow=4,ncol=5) #perceba que as matrizes são criadas 
#baseadas nas colunas: a primeira coluna é preenchida com os valores,
#depois a segunda e assim por diante.

#Matrizes também podem ser criadas adicionando-se dimensão a um vetor:
a <- 1:12
dim(a) <- c(3,4)
a

#Outra forma de criar matrizes é com as funções rbind() e cbind().
x <- 1:5
y <- c(6.3,10.9,8,11.5,7.4)
z <- rnorm(5)

rbind(x,y,z) #Função rbind junta as linhas, formando uma nova matriz.

cbind(x,y,z) #Função cbind junta as colunas


##Algumas funções úteis para matrizes:
attributes(a) #Retorna os atributos da matriz
dim(a)  #Retorna as dimensões da matriz
nrow(a)
ncol(a)

t(a) #Transpõe uma matriz


#Linhas e colunas também podem ter nomes. Uma forma de dar nomes é com
#as funções cbind e rbind, conforme demonstrado abaixo:
mat <- cbind(ind=x,alt=y,var=z)
mat

#As funções colnames() e rownames() servem para perguntar e para alterar
#os nomes de colunas e linhas, respectivamente:
colnames(mat)
rownames(mat)
rownames(mat) <- c("A","B","C","D","E")
mat

attributes(mat)


####Listas são um tipo especial de vetor em que os elementos 
#podem ser de tipos diferentes.
#Listas aparacem como resultado de algumas funções no R.

lis <- list("A",c(T,T,F),4.5,x,mat)
lis

lis2 <- list(um=1:5,dois="Segundo elemento")
lis2


#### Fatores são outro tipo especial de vetor, usado para representar
#dados categóricos.
#Podem ser ordenados ou não.

#Fatores podem ser criados com a função factor():

fator <- factor(c("lagoa","lagoa","rio","poça","rio","lagoa","poça"))
fator
table(fator)
unclass(fator)  #O R entende fatores como um vetor de números inteiros
#com rótulos.



### VALORES FALTANTES
#Valores faltantes são representados por NA e NaN

#a função is.na() pergunta por NAs (not available)
#a função is.nan pergunta por NaNs

abc <- c(1,NA,0,4,NaN,2,NA,NaN)
is.na(abc)
is.nan(abc)

#Todo Nan também é NA, mas o inverso não é verdadeiro
#NAs também tem classe, então existem character NA, numeric NA, etc.


### Data Frames
#São similares a uma matriz, mas na verdade eles são um tipo de lista
#em que todos os elementos são vetores com o mesmo comprimento.
#Pense num data frame como uma lista em que as colunas são os elementos,
#e o número de colunas é o comprimento dos vetores.

#IMPORTANTE! Ao contrário de uma matriz, colunas de um data frame podem ser
#de tipos diferentes.

#Data frames podem ser criados com a função data.frame()

df <- data.frame(sexo=c("H","M","H","M"),peso=c(90,85,100,70))
df

class(df)
attributes(df)
colnames(df)

#Muitas funções que vimos em matrizes também funcionam em data frames:
attributes(df)
class(df)
dim(df)
ncol(df)
nrow(df)
colnames(df)
rownames(df)
rownames(df) <- c("João","Maria","José","Joaquina")
df














