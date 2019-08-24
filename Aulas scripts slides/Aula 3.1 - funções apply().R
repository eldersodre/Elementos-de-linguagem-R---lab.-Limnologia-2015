#######################################################
#######################################################
########### Aula 3.1 - funções apply() ################
#######################################################
#######################################################

#Lembra quando eu falei que estruturas como for{} são muito usadas ao
  #escrever funções, mas pouco úteis para escrever códigos?

#Há algumas funções no R que fazem loops, de forma semelhante ao for,
#porém de forma mais compacta. Em geral, estas funções possuem a palavra apply no meio.


#### Preparando os dados ####
#Para a aula de hoje, usaremos como exemplo alguns dados com os quais vocês
#já devem estar acostumados das últimas aulas.

setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Dados do ecolagoas de 2008:
ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)
varlag <- ecolagoas[,4:22] #Apenas as colunas com as variáveis

#Dados de zooplâncton do lago Batata em 1998:
batata <- read.csv2("zoobatata1998.csv",row.names=1)
zoo <- batata[,3:53] #apenas as colunas com as densidades

#Dados de contagem de árvores em parcelas de 1hectare na ilha de Barro Colorado
library(vegan)
data(BCI)

#Medidas diárias da qualidade do ar em Nova York de maio a Setembro de 1973:
data(airquality)


#### Função apply() ####

#A função apply() permite aplicar uma função a um conjunto de dados
#apply(X,MARGIN,FUN...)
#X --> seus dados
#MARGIN --> 1 para linhas, 2 para colunas. c(1,2) para linhas e colunas.
#FUN --> função a ser aplicada nos dados
#... --> argumentos opcionais de FUN

#Vamos ver alguns exemplos:
apply(BCI,MARGIN=1,sum) #Soma das abunâncias em cada parcela (linha)

apply(BCI,2,mean) #Quantas vezes, em média, cada espécie aparece nas parcelas.

apply(zoo,1,sum) #Densidade total nas coletas

apply(zoo,MARGIN=c(1,2),print)

#As reticências (...) indicam argunmentos da função FUN passados para a função apply().
#Por exemplo, a função mean() tem um argumento na.rm=FALSE, que, quando positivo, 
#remove os NAs antes do cálculo da média.
apply(airquality,2,mean) #Retorna NAs, pois a média não pode ser calculada com NAs.
apply(airquality,2,mean,na.rm=TRUE) #Os NAs foram retirados antes do cálculo.


#### Função lapply() ####

# A função lapply() vem de list apply.
#A função lapply() aplica uma determinada função a todos os elementos de um objeto,
#retornando sempre uma lista.

#lapply(X,FUN,...)

#Alguns exemplos:
x <- 1:20   #Vetor
lapply(x,log)

mat <- matrix(1:12,4,3)  #Matriz
lapply(mat,sqrt)

lis <- list(1:100,matrix(1:20,5,4)) #Lista
lapply(lis,mean)

#Lembra que um data frame, embora parecido com uma matriz, na verdade é um tipo de lista?
#Quando usamos lapply() a um dataframe, FUN é aplicada às colunas (que correspondem aos
#elementos da lista)

lapply(varlag,mean,na.rm=T)


#apply(), lapply() e similares fazem uso de funções anônimas, ou seja,
#funções sem nome criadas apenas dentro do contexto de apply.

#Por exemplo, imagine que eu quero extrair apenas as primeiras colunas
#da lista abaixo:
lista <- list(matrix(rnorm(16,4,4)),matrix(1:80,10,8))

lapply(lista,function(teste) teste [,1]) #Observem que a função teste só existe dentro de lapply.

#Outro exemplo:

lapply(zoo, function (dados) log(dados+1))

apply(zoo,c(1,2),function (dados) log(dados+1))



#### Função sapply() ####
# A função sapply() faz basicamente a mesma coisa que lapply().
#Porém, enquanto lapply() sempre retorna uma lista, sapply() Simplifica o resultado,
#retornando um vetor ou uma matriz quando possível.

#Vamos rever os exemplos acima, mas agora usando sapply():

x <- 1:20   #Vetor
sapply(x,log)

mat <- matrix(1:12,4,3)  #Matriz
sapply(mat,sqrt)

lis <- list(1:100,matrix(1:20,5,4)) #Lista
sapply(lis,mean)

sapply(varlag,mean,na.rm=T) #Data frame


#### row e col Sums e Means ####

#Quando você quiser calcular a soma ou a média de seus dados,
#há funções específicas para isso:
rowSums(zoo)  # == apply(zoo,1,sum)
colSums(BCI)  # == apply(BCI,2,sum)
rowMeans(zoo) # == apply(zoo,1,mean)
colMeans(BCI) # == apply(BCI,2,mean)

#Estas funções reduzidas te economizam tempo digitando.
#Além disso, como elas foram otimizadas para calcular somas e médias, seu cálculo
#também é muito mais rápido que o das funções extensas 
#(mas você só vai notar a diferença de tempo em conjuntos de dados muito grandes).


#### tapply() ####
#A função tapply() é sempre aplicada a vetores. Ela divide um vetor por fatores,
#e aplica uma função a cada um destes subgrupos.

#tapply(X, INDEX, FUN, ..., simplify=TRUE)
#X --> um vetor
#INDEX --> fator para dividir os dados
#FUN --> a função a ser aplicada
#... --> argumentos de FUn a serem passados para tapply()
#simplify --> Se simplify=F, a função sempre retornará uma lista.

#Vamos ver alguns exemplos na prática.
#Suponha que eu quero a média de temperatura em Nova Iorque EM CADA MÊS.
#O data frame possui uma coluna Temp (nossos dados de interesse)
#e uma coluna Month (o nosso fator)

tapply(airquality$Temp,airquality$Month,mean)

#Se colocarmos simplify=FALSE, a função retornará uma lista:
tapply(airquality$Temp,airquality$Month,mean,simplify=F)

#Outro exemplo: quero saber os valores máximo e mínimo de secchi
#em cada lagoa costeira no ano de 2008 (função range())

tapply(ecolagoas$secchi,ecolagoas$lagoa,range)

#O argumento INDEX por ser mais de um fator. Neste caso, é necessário 
#que o valor do argumento seja uma lista, em que cada elemento
#é um veto diferente.

#Por exemplo, talvez eu esteja interessado em saber os valores médios
#de secchi em cada ponto de cada lagoa durante o ano.
tapply(ecolagoas$secchi,ecolagoas[,2:3],mean)
#OBS: alguns NAs apareceram porque as nem todas as algoas tem todos os pontos de coleta.

#Talvez eu esteja interessado na média mensal de secchi nas lagoas,
#sem me importar com os pontos de coleta.
tapply(ecolagoas$secchi,ecolagoas[,1:2],mean)


#tapply() sempre calcula as funções em apenas um vetor. A função aggregate() é
#parecida com tapplY(), mas pode ser aplicada a mais de um vetor.

#Por exemplo, agora eu quero saber a média de todos os valores medidos por lagoa.
aggregate(varlag,by=list(ecolagoas$lagoa),mean,na.rm=T)
#OBS: na função aggregate, o fator precisa necessariamente ser uma lista.
#Quando não é uma lista, isto pode ser contornado facilmente usando a função list(),
#como no exemplo acima.



#### Função split () ####

#A função split() não é uma função de loop como as outras, mas é muito útil.
#As funções tapply() e aggregate() dividem os dados de acordo com um ou 
#mais fatores, aplica uma função sobre eles, e depois os une novamente.

#A função split() divide os dados de acordo com um fator.
#split(x,f,drop=FALSE,...)
#x --> Seus dados. Pode ser um vetor, ou lista, ou data frame.
#f --> Um fator ou lista de fatores.
#drop --> indica se níveis vazios devem ser deixados de lado.

#Por exemplo, eu tenho uma única tabela com dados de zooplâncton no lago Batata.
#Mas talvez eu queira uma tabela para cada estação de coleta.
split(batata,batata$Estação)

#Pronto! A função split() retorna uma lista, então se eu quiser seus elementos
#individualmente é uma boa idéia criar um objeto e escolher apenas a parte que me interessa.

#Talvez, dentro da minha tabela de dados do ecolagoas, eu esteja interessado 
#apenas na lagoa Cabiúnas.
splagoas <- split(ecolagoas,ecolagoas$lagoa)
splagoas$Cabiúnas

#Assim como nas funções anteriores, mais de um fator pode ser utilizado.
#Vou dividir os dados do ecolagoas por lagoa e ponto de coleta.
split(ecolagoas,ecolagoas[,2:3])

#Muitos elementos da lista acima estão em branco, simplesmente suas combinações
#não existem (não há pontos 3 ao 6 no Rio Macaé por exemplo, mas a função ainda cria esses
#elementos). Para isso existe o argumento drop. Coloque drop=TRUE e veja como agora
#os elementos vazios simplesmente não são criados:
split(ecolagoas,ecolagoas[,2:3],drop = TRUE)



