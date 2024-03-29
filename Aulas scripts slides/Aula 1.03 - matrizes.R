###### MATRIZES, LISTAS, FATORES E DATA FRAMES


#### Matrizes

#Uma matriz, no R, � basicamente um vetor com dimens�o.
#Matrizes s�o compostas por linhas e colunas

#Uma das maneiras para criar uma matriz � pela fun��o matrix():
matrix()  #Cria uma matriz vazia
matrix(1:20,nrow=4,ncol=5) #perceba que as matrizes s�o criadas 
#baseadas nas colunas: a primeira coluna � preenchida com os valores,
#depois a segunda e assim por diante.

#Matrizes tamb�m podem ser criadas adicionando-se dimens�o a um vetor:
a <- 1:12
dim(a) <- c(3,4)
a

#Outra forma de criar matrizes � com as fun��es rbind() e cbind().
x <- 1:5
y <- c(6.3,10.9,8,11.5,7.4)
z <- rnorm(5)

rbind(x,y,z) #Fun��o rbind junta as linhas, formando uma nova matriz.

cbind(x,y,z) #Fun��o cbind junta as colunas


##Algumas fun��es �teis para matrizes:
attributes(a) #Retorna os atributos da matriz
dim(a)  #Retorna as dimens�es da matriz
nrow(a)
ncol(a)

t(a) #Transp�e uma matriz


#Linhas e colunas tamb�m podem ter nomes. Uma forma de dar nomes � com
#as fun��es cbind e rbind, conforme demonstrado abaixo:
mat <- cbind(ind=x,alt=y,var=z)
mat

#As fun��es colnames() e rownames() servem para perguntar e para alterar
#os nomes de colunas e linhas, respectivamente:
colnames(mat)
rownames(mat)
rownames(mat) <- c("A","B","C","D","E")
mat

attributes(mat)


####Listas s�o um tipo especial de vetor em que os elementos 
#podem ser de tipos diferentes.
#Listas aparacem como resultado de algumas fun��es no R.

lis <- list("A",c(T,T,F),4.5,x,mat)
lis

lis2 <- list(um=1:5,dois="Segundo elemento")
lis2


#### Fatores s�o outro tipo especial de vetor, usado para representar
#dados categ�ricos.
#Podem ser ordenados ou n�o.

#Fatores podem ser criados com a fun��o factor():

fator <- factor(c("lagoa","lagoa","rio","po�a","rio","lagoa","po�a"))
fator
table(fator)
unclass(fator)  #O R entende fatores como um vetor de n�meros inteiros
#com r�tulos.



### VALORES FALTANTES
#Valores faltantes s�o representados por NA e NaN

#a fun��o is.na() pergunta por NAs (not available)
#a fun��o is.nan pergunta por NaNs

abc <- c(1,NA,0,4,NaN,2,NA,NaN)
is.na(abc)
is.nan(abc)

#Todo Nan tamb�m � NA, mas o inverso n�o � verdadeiro
#NAs tamb�m tem classe, ent�o existem character NA, numeric NA, etc.


### Data Frames
#S�o similares a uma matriz, mas na verdade eles s�o um tipo de lista
#em que todos os elementos s�o vetores com o mesmo comprimento.
#Pense num data frame como uma lista em que as colunas s�o os elementos,
#e o n�mero de colunas � o comprimento dos vetores.

#IMPORTANTE! Ao contr�rio de uma matriz, colunas de um data frame podem ser
#de tipos diferentes.

#Data frames podem ser criados com a fun��o data.frame()

df <- data.frame(sexo=c("H","M","H","M"),peso=c(90,85,100,70))
df

class(df)
attributes(df)
colnames(df)

#Muitas fun��es que vimos em matrizes tamb�m funcionam em data frames:
attributes(df)
class(df)
dim(df)
ncol(df)
nrow(df)
colnames(df)
rownames(df)
rownames(df) <- c("Jo�o","Maria","Jos�","Joaquina")
df














