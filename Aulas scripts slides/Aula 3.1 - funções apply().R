#######################################################
#######################################################
########### Aula 3.1 - fun��es apply() ################
#######################################################
#######################################################

#Lembra quando eu falei que estruturas como for{} s�o muito usadas ao
  #escrever fun��es, mas pouco �teis para escrever c�digos?

#H� algumas fun��es no R que fazem loops, de forma semelhante ao for,
#por�m de forma mais compacta. Em geral, estas fun��es possuem a palavra apply no meio.


#### Preparando os dados ####
#Para a aula de hoje, usaremos como exemplo alguns dados com os quais voc�s
#j� devem estar acostumados das �ltimas aulas.

setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Dados do ecolagoas de 2008:
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)
varlag <- ecolagoas[,4:22] #Apenas as colunas com as vari�veis

#Dados de zoopl�ncton do lago Batata em 1998:
batata <- read.csv2("zoobatata1998.csv",row.names=1)
zoo <- batata[,3:53] #apenas as colunas com as densidades

#Dados de contagem de �rvores em parcelas de 1hectare na ilha de Barro Colorado
library(vegan)
data(BCI)

#Medidas di�rias da qualidade do ar em Nova York de maio a Setembro de 1973:
data(airquality)


#### Fun��o apply() ####

#A fun��o apply() permite aplicar uma fun��o a um conjunto de dados
#apply(X,MARGIN,FUN...)
#X --> seus dados
#MARGIN --> 1 para linhas, 2 para colunas. c(1,2) para linhas e colunas.
#FUN --> fun��o a ser aplicada nos dados
#... --> argumentos opcionais de FUN

#Vamos ver alguns exemplos:
apply(BCI,MARGIN=1,sum) #Soma das abun�ncias em cada parcela (linha)

apply(BCI,2,mean) #Quantas vezes, em m�dia, cada esp�cie aparece nas parcelas.

apply(zoo,1,sum) #Densidade total nas coletas

apply(zoo,MARGIN=c(1,2),print)

#As retic�ncias (...) indicam argunmentos da fun��o FUN passados para a fun��o apply().
#Por exemplo, a fun��o mean() tem um argumento na.rm=FALSE, que, quando positivo, 
#remove os NAs antes do c�lculo da m�dia.
apply(airquality,2,mean) #Retorna NAs, pois a m�dia n�o pode ser calculada com NAs.
apply(airquality,2,mean,na.rm=TRUE) #Os NAs foram retirados antes do c�lculo.


#### Fun��o lapply() ####

# A fun��o lapply() vem de list apply.
#A fun��o lapply() aplica uma determinada fun��o a todos os elementos de um objeto,
#retornando sempre uma lista.

#lapply(X,FUN,...)

#Alguns exemplos:
x <- 1:20   #Vetor
lapply(x,log)

mat <- matrix(1:12,4,3)  #Matriz
lapply(mat,sqrt)

lis <- list(1:100,matrix(1:20,5,4)) #Lista
lapply(lis,mean)

#Lembra que um data frame, embora parecido com uma matriz, na verdade � um tipo de lista?
#Quando usamos lapply() a um dataframe, FUN � aplicada �s colunas (que correspondem aos
#elementos da lista)

lapply(varlag,mean,na.rm=T)


#apply(), lapply() e similares fazem uso de fun��es an�nimas, ou seja,
#fun��es sem nome criadas apenas dentro do contexto de apply.

#Por exemplo, imagine que eu quero extrair apenas as primeiras colunas
#da lista abaixo:
lista <- list(matrix(rnorm(16,4,4)),matrix(1:80,10,8))

lapply(lista,function(teste) teste [,1]) #Observem que a fun��o teste s� existe dentro de lapply.

#Outro exemplo:

lapply(zoo, function (dados) log(dados+1))

apply(zoo,c(1,2),function (dados) log(dados+1))



#### Fun��o sapply() ####
# A fun��o sapply() faz basicamente a mesma coisa que lapply().
#Por�m, enquanto lapply() sempre retorna uma lista, sapply() Simplifica o resultado,
#retornando um vetor ou uma matriz quando poss�vel.

#Vamos rever os exemplos acima, mas agora usando sapply():

x <- 1:20   #Vetor
sapply(x,log)

mat <- matrix(1:12,4,3)  #Matriz
sapply(mat,sqrt)

lis <- list(1:100,matrix(1:20,5,4)) #Lista
sapply(lis,mean)

sapply(varlag,mean,na.rm=T) #Data frame


#### row e col Sums e Means ####

#Quando voc� quiser calcular a soma ou a m�dia de seus dados,
#h� fun��es espec�ficas para isso:
rowSums(zoo)  # == apply(zoo,1,sum)
colSums(BCI)  # == apply(BCI,2,sum)
rowMeans(zoo) # == apply(zoo,1,mean)
colMeans(BCI) # == apply(BCI,2,mean)

#Estas fun��es reduzidas te economizam tempo digitando.
#Al�m disso, como elas foram otimizadas para calcular somas e m�dias, seu c�lculo
#tamb�m � muito mais r�pido que o das fun��es extensas 
#(mas voc� s� vai notar a diferen�a de tempo em conjuntos de dados muito grandes).


#### tapply() ####
#A fun��o tapply() � sempre aplicada a vetores. Ela divide um vetor por fatores,
#e aplica uma fun��o a cada um destes subgrupos.

#tapply(X, INDEX, FUN, ..., simplify=TRUE)
#X --> um vetor
#INDEX --> fator para dividir os dados
#FUN --> a fun��o a ser aplicada
#... --> argumentos de FUn a serem passados para tapply()
#simplify --> Se simplify=F, a fun��o sempre retornar� uma lista.

#Vamos ver alguns exemplos na pr�tica.
#Suponha que eu quero a m�dia de temperatura em Nova Iorque EM CADA M�S.
#O data frame possui uma coluna Temp (nossos dados de interesse)
#e uma coluna Month (o nosso fator)

tapply(airquality$Temp,airquality$Month,mean)

#Se colocarmos simplify=FALSE, a fun��o retornar� uma lista:
tapply(airquality$Temp,airquality$Month,mean,simplify=F)

#Outro exemplo: quero saber os valores m�ximo e m�nimo de secchi
#em cada lagoa costeira no ano de 2008 (fun��o range())

tapply(ecolagoas$secchi,ecolagoas$lagoa,range)

#O argumento INDEX por ser mais de um fator. Neste caso, � necess�rio 
#que o valor do argumento seja uma lista, em que cada elemento
#� um veto diferente.

#Por exemplo, talvez eu esteja interessado em saber os valores m�dios
#de secchi em cada ponto de cada lagoa durante o ano.
tapply(ecolagoas$secchi,ecolagoas[,2:3],mean)
#OBS: alguns NAs apareceram porque as nem todas as algoas tem todos os pontos de coleta.

#Talvez eu esteja interessado na m�dia mensal de secchi nas lagoas,
#sem me importar com os pontos de coleta.
tapply(ecolagoas$secchi,ecolagoas[,1:2],mean)


#tapply() sempre calcula as fun��es em apenas um vetor. A fun��o aggregate() �
#parecida com tapplY(), mas pode ser aplicada a mais de um vetor.

#Por exemplo, agora eu quero saber a m�dia de todos os valores medidos por lagoa.
aggregate(varlag,by=list(ecolagoas$lagoa),mean,na.rm=T)
#OBS: na fun��o aggregate, o fator precisa necessariamente ser uma lista.
#Quando n�o � uma lista, isto pode ser contornado facilmente usando a fun��o list(),
#como no exemplo acima.



#### Fun��o split () ####

#A fun��o split() n�o � uma fun��o de loop como as outras, mas � muito �til.
#As fun��es tapply() e aggregate() dividem os dados de acordo com um ou 
#mais fatores, aplica uma fun��o sobre eles, e depois os une novamente.

#A fun��o split() divide os dados de acordo com um fator.
#split(x,f,drop=FALSE,...)
#x --> Seus dados. Pode ser um vetor, ou lista, ou data frame.
#f --> Um fator ou lista de fatores.
#drop --> indica se n�veis vazios devem ser deixados de lado.

#Por exemplo, eu tenho uma �nica tabela com dados de zoopl�ncton no lago Batata.
#Mas talvez eu queira uma tabela para cada esta��o de coleta.
split(batata,batata$Esta��o)

#Pronto! A fun��o split() retorna uma lista, ent�o se eu quiser seus elementos
#individualmente � uma boa id�ia criar um objeto e escolher apenas a parte que me interessa.

#Talvez, dentro da minha tabela de dados do ecolagoas, eu esteja interessado 
#apenas na lagoa Cabi�nas.
splagoas <- split(ecolagoas,ecolagoas$lagoa)
splagoas$Cabi�nas

#Assim como nas fun��es anteriores, mais de um fator pode ser utilizado.
#Vou dividir os dados do ecolagoas por lagoa e ponto de coleta.
split(ecolagoas,ecolagoas[,2:3])

#Muitos elementos da lista acima est�o em branco, simplesmente suas combina��es
#n�o existem (n�o h� pontos 3 ao 6 no Rio Maca� por exemplo, mas a fun��o ainda cria esses
#elementos). Para isso existe o argumento drop. Coloque drop=TRUE e veja como agora
#os elementos vazios simplesmente n�o s�o criados:
split(ecolagoas,ecolagoas[,2:3],drop = TRUE)



