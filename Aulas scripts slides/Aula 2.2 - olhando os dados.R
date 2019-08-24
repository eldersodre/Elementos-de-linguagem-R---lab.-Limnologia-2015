##################################################
##################################################
######### Aula 2.2 - Olhando seus dados ##########
##################################################
##################################################



#Abra o arquivo ecolagoas2008.csv. Este arquivo contém dados do projeto
#Ecolagoas para o ano de 2008.
#Use na.strings="-". Use também row.names=1; este argumento indica
  #que a primeira coluna da planilha corresponde ao nome das linhas.

ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)

#Abra os dados recém importados:
ecolagoas

#A visualização de tabelas grandes no R é difícil. Para melhor olhar os dados,
#há algumas funções úteis.

#Começaremos relembrando algumas funções da primeira aula:
attributes(ecolagoas) #Retorna uma lista com diversos atributos da tabela.
class(ecolagoas)      #Classe do objeto
dim(ecolagoas)        #Dimensões
ncol(ecolagoas)       #Número de colunas
nrow(ecolagoas)       #Número de linhas
colnames(ecolagoas)   #Nome das colunas
rownames(ecolagoas)   #Nome das linhas


#Duas funções interessantes para uma primeira olhada nos dados são head() e tail().
#A função head() mostra as primeiras linhas doa dados; a função tail() mostra as
#últimas.

head(ecolagoas)
tail(ecolagoas)

#Com estas funções, é possível ter uma noção básica da "cara" dos dados.

#Por default, seis linhas são mostradas, mas é possivel alterar isso com o
#argumento n.
head(ecolagoas,n=10)
tail(ecolagoas,n=2)


#### Função summary() ####

#Antes, vamos criar mais alguns objetos de demonstração.
x <- 1:10                   #Vetor numérico (número inteiro)
y <- 1:10+rnorm(10,sd=0.5)  #Vetor numérico
lo <- c(F,F,T,F,T,T,T)       #Vetor lógico
c <- c("Amor","Paz","Bondade") #Vetor de caracteres
f <- factor(rep(c("Controle","Tratamento1","Tratamento2"),10))
m <- matrix(rnorm(100),10,10)
lis <- list(x,y,l,c,f,m,ecolagoas)


#A função summary() é uma das funções mais versáteis do R. Seu resultado depende
#do tipo de objeto utilizado.

#Vamos testar abaixo com os objetos criados:
summary(x)    #Números
summary(lo)  #Lógica
summary(c)    #Caracter
summary(f)    #Fatores

#Notaram a diferença?

#Em matrizes e dataframes, o resultado é mostrado para cada coluna:
summary(m)
summary(ecolagoas)

#Summary() também pode ser usada para listas:
summary(lis)

#Embora análises estatísticas não sejam o objetivo do nosso curso, é importante
#saber que a função summary() é útil para ver resultados de análises estatísticas.

reg <- lm(y~x) #Regressão linear de y em função de x.
reg
summary(reg)


#### Função str() ####

#Outra função muito útil é str().
#Ela mostra de uma forma compacta a estrutura interna do objeto (str-->structure)
#A função str() pretende responder a pergunta: o que há neste objeto?

#Vamos ver alguns exemplosda função str() utilizada com vetores:
str(y)
str(lo)
str(c)

#Com um fator:
str(f)

#Com uma matriz:
str(m)


#Em listas e data frames, a função str() retorna uma linha para cada elemento 
  #ou coluna.
str(ecolagoas) #Data frame
str(lis)       #Lista


# A função str() também pode ser aplicada a outras funções:
str(rnorm)
str(read.table)
str(str)







