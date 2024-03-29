##################################################
##################################################
######### Aula 2.2 - Olhando seus dados ##########
##################################################
##################################################



#Abra o arquivo ecolagoas2008.csv. Este arquivo cont�m dados do projeto
#Ecolagoas para o ano de 2008.
#Use na.strings="-". Use tamb�m row.names=1; este argumento indica
  #que a primeira coluna da planilha corresponde ao nome das linhas.

ecolagoas <- read.csv2("ecolagoas2008.csv",na.strings="-",row.names=1)

#Abra os dados rec�m importados:
ecolagoas

#A visualiza��o de tabelas grandes no R � dif�cil. Para melhor olhar os dados,
#h� algumas fun��es �teis.

#Come�aremos relembrando algumas fun��es da primeira aula:
attributes(ecolagoas) #Retorna uma lista com diversos atributos da tabela.
class(ecolagoas)      #Classe do objeto
dim(ecolagoas)        #Dimens�es
ncol(ecolagoas)       #N�mero de colunas
nrow(ecolagoas)       #N�mero de linhas
colnames(ecolagoas)   #Nome das colunas
rownames(ecolagoas)   #Nome das linhas


#Duas fun��es interessantes para uma primeira olhada nos dados s�o head() e tail().
#A fun��o head() mostra as primeiras linhas doa dados; a fun��o tail() mostra as
#�ltimas.

head(ecolagoas)
tail(ecolagoas)

#Com estas fun��es, � poss�vel ter uma no��o b�sica da "cara" dos dados.

#Por default, seis linhas s�o mostradas, mas � possivel alterar isso com o
#argumento n.
head(ecolagoas,n=10)
tail(ecolagoas,n=2)


#### Fun��o summary() ####

#Antes, vamos criar mais alguns objetos de demonstra��o.
x <- 1:10                   #Vetor num�rico (n�mero inteiro)
y <- 1:10+rnorm(10,sd=0.5)  #Vetor num�rico
lo <- c(F,F,T,F,T,T,T)       #Vetor l�gico
c <- c("Amor","Paz","Bondade") #Vetor de caracteres
f <- factor(rep(c("Controle","Tratamento1","Tratamento2"),10))
m <- matrix(rnorm(100),10,10)
lis <- list(x,y,l,c,f,m,ecolagoas)


#A fun��o summary() � uma das fun��es mais vers�teis do R. Seu resultado depende
#do tipo de objeto utilizado.

#Vamos testar abaixo com os objetos criados:
summary(x)    #N�meros
summary(lo)  #L�gica
summary(c)    #Caracter
summary(f)    #Fatores

#Notaram a diferen�a?

#Em matrizes e dataframes, o resultado � mostrado para cada coluna:
summary(m)
summary(ecolagoas)

#Summary() tamb�m pode ser usada para listas:
summary(lis)

#Embora an�lises estat�sticas n�o sejam o objetivo do nosso curso, � importante
#saber que a fun��o summary() � �til para ver resultados de an�lises estat�sticas.

reg <- lm(y~x) #Regress�o linear de y em fun��o de x.
reg
summary(reg)


#### Fun��o str() ####

#Outra fun��o muito �til � str().
#Ela mostra de uma forma compacta a estrutura interna do objeto (str-->structure)
#A fun��o str() pretende responder a pergunta: o que h� neste objeto?

#Vamos ver alguns exemplosda fun��o str() utilizada com vetores:
str(y)
str(lo)
str(c)

#Com um fator:
str(f)

#Com uma matriz:
str(m)


#Em listas e data frames, a fun��o str() retorna uma linha para cada elemento 
  #ou coluna.
str(ecolagoas) #Data frame
str(lis)       #Lista


# A fun��o str() tamb�m pode ser aplicada a outras fun��es:
str(rnorm)
str(read.table)
str(str)







