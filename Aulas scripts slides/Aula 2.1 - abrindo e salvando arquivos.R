##################################################################
##################################################################
######################    Aula 2   ###############################
##################################################################
##################################################################


#### Pasta de trabalho/Working directory ####

#Existe um conceito importante chamado pasta de trabalho (working directory, en ingl�s)
#Todos os arquivos que voc� quer importar para o R dever�o estar na pasta de trabalho
#OU o caminho do arquivo deve estar especificado.
#Da mesma forma, quando voc� for exportar um conjunto de dados para fora do R,
#ele ser� salvo na pasta de trabalho a n�o ser que o caminho esteja especificado.

#N�o sabe qual � a sua pasta de trabalho? Use a fun��o getwd().
getwd() #Esta fun��o n�o tem argumentos.
#Normalmente, a pasta de trabalho do R � a pasta meus documentos do seu computador.

#Voc� pode alterar o seu working directory com a fun��o setwd().
setwd("C:\\Users\\Elder\\Pictures") #Alterei para a pasta minhas imagens.
getwd()

#Perceba que o "endere�o" da pasta de trabalho deve estar entre aspas.
setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")
#IMPORTANTE: � necess�rio usar as barras invertidas duplas para especificar o
#caminho da pasta. O R n�o entende quando apenas uma barra � utilizada.

#Dica: Se voc� n�o sabe o caminho da pasta desejada, abra o windows explorer,
#copie a barra de endere�os e cole no R.

#Dica 2: Tenha um working directory diferente para cada projeto.
#Voc� pode cirar uma pasta apenas para este curso!


#### Escolhendo o arquivo ####

#Algumas fun��es �teis:
#As fun��es dir() e list.files() retornam uma lista de todos os arquivos
#contidos na sua pasta de trabalho.
dir()
list.files()

## A fun��o list.dirs() � bastante similar, mas em vez do nome dos arquivos
#ela retorna o nome das pastas dentro da sua pasta de trabalho.
list.dirs()

#Como foi comentado, n�o � necess�rio especificar o caminho de um arquivo a ser lido
#se ele estiver na sua pasta de trabalho. Mas se ele n�o estiver, as fun��es
#file.choose() e choose.files() s�o bastante �teis.

#Estas fun��es abrem uma janela que permite escolher um arquivo. Como resultado,
#o R retorna o endere�o deste arquivo, pronto para copiar e colar.
file.choose()
choose.files()
#A �nica diferen�a entre estas fun��es � file.choose() permite escolher apenas um arquivo
#por vez, enquanto choose.files() permite escolher v�rios.


#### Fun��o source() ####

#A fun��o source() permite que o R leia um script inteiramente, do in�cio ao fim.
#Vamos abrir o arquivo script.R, que est� nos materiais desta aula.

source("script.R")   #Lembre se de escrever o nome do arquivo entre aspas
  #e de colocar a extens�o do arquivo (.R,neste caso).

#Se o arquivo n�o estiver na sua pasta de trabalho, lembre de escrever o endere�o
#completo do arquivo. Por exemplo:
source("C:\\Users\\Elder\\SkyDrive\\Documentos\\Backups\\Minicurso Elementos de Linguagem R\\Materiais para aula 2\\script.R")

#A fun��o source() � �til para scripts que criem objetos ou fun��es importantes 
#para o seu trabalho. Mas para trabalhar no seu projeto, � muito mais �til
#abrir o script no R da forma tradicional.


#### read.table() ####

#Para importar seus dados ao R, usa-se a fun��o read.table().
#Vamos abrir o "arquivo1.txt" que est� nos materiais da nossa aula.

read.table("arquivo1.txt")

#Se tudo deu certo, voc� importou um pequeno data frame para o R.
#Note que a fun��o read.table() apenas leu o arquivo1.txt . Se voc� quiser
#gravar os dados, lembre-se de criar um objeto.
dados <- read.table("arquivo1.txt")
dados

#Agora, vamos abrir o arquivo2.txt.
read.table("arquivo2.txt")

#No arquivo 2, a primeira linha corresponde ao nome das colunas, 
#mas a fun��o read.table() n�o reconhece isto automaticamente. 
#N�o se preocupe! H� um argumento chamado header. Por default, header=FALSE,
#por�m podemos alterar para header=TRUE, o que significa que a primeira linha
#ser� entendida como os nomes das colunas.

read.table("arquivo2.txt",header=TRUE)
#Notou a diferen�a?


#Agora, vamos abrir o arquivo 3:
read.table("arquivo3.txt")

#Notou que o R reconheceu apenas uma coluna? 
#Antes de prosseguirmos, abra os arquivos 1 e 3 no bloco de notas.
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#J� abriu? Notou alguma diferen�a?
#
#
#
#
#No arquivo 1, as colunas foram separadas por espa�o (com a tecla tab).
#No arquivo 3, as colunas foram separadas por uma barra.

#Um dos argumentos da fun��o read.table() � sep. Este argumento especifica
#que caracter foi utilizado para separar as colunas. Por default, sep=" ".
#Vamos alterar para sep="/" e ver o que acontece.

read.table("arquivo3.txt",sep="/")

#Agora as colunas est�o corretas. Mas ainda h� alguma coisa estranha na coluna 3.
#Ao criar o arquivo 3, eu utilizei ponto e v�rgula para separar as decimais.
#Podemos resolver isso com o argumento dec, cujo default � dec="."

read.table("arquivo3.txt",sep="/",dec=";")
#Pronto!
#OBS: Eu sei que ponto e v�rgula � uma escolha n�o convencional para separar
#os decimais, mas utilizei apenas para fins de compara��o.


#### Abrindo arquivos do excel ####

#A fun��o read.table() tamb�m abre arquivos do excel no formato csv (comma separated values)
#ATEN��O! A fun��o read.table() l� arquivos do excel em formato csv, 
  #mas n�o l� arquivos xls ou xlsx.

#Vamos come�ar abrindo o arquivo 4.
read.table("arquivo4.csv")

#Em computadores configurados na l�ngua inglesa, o formato csv usa v�rgulas
#para separas as colunas, e pontos para separar os decimais.

#Em computadores configurados em portugu�s, o formato csv usa ponto e v�rgula
#para separas as colunas, e v�rgulas para separar os decimais.

#Agora, vamos abrir o arquivo 4 novamente, desta vez com os argumentos corretos:
read.table("arquivo4.csv",header=T,sep=";",dec=",")

#N�o � necess�rio especificar os argumentos corretos toda vez que formos abrir arquivos
#em formato csv. Para isso, existem as fun��es read.csv() e read.csv2().
read.csv2("arquivo4.csv")

#Read.csv() e read.csv2() fazem exatamente a mesma coisa que read.table(), as os defaults
#de alguns argumentos s�o diferentes.

#Vamos olhar as diferen�as, nos atendo apenas aos argumentos header, sep e dec.
#read.table(file,header=FALSE,sep=" ",dec=".")
#read.csv(file,header=TRUE,sep=",",dec=".")
#read.csv2(file,header=TRUE,sep=";",dec=",")

#Em primeiro lugar, por default, read.csv() e read.csv2() automaticamente reconhecem
#a primeira linha como o caba�alho, ou seja, o nome das colunas.

#read.csv() utiliza sep="," e dec=".", ou seja, EST� OTIMIZADA PARA ARQUIVOS CSV
#EM L�NGUA INGLESA

#read.csv2() utiliza sep=";" e dec=",", ou seja, EST� OTIMIZADA PARA ARQUIVOS CSV
#CRIADOS EM PORTUGU�S (ou qualquer l�ngua que use v�rgula para separar os decimais)


#### Dados faltantes ####
#O argumento na.strings serve para especificar que caracter foi utilizado
#para representar os dados faltantes (NAs).

#Abramos o arquivo 5:
read.csv2("arquivo5.csv")

#Neste caso, um h�fen (-) foi utilizado para representar dados faltantes.
read.csv2("arquivo5.csv",na.strings="-")  #Notou a diferen�a?

#DICA: Quando tabelar seus dados, represente dados faltantes sempre da mesma forma.
#Escolha "-", "?", "NA", ou o que voc� achar melhor, mas use sempre o mesmo s�mbolo!
#O R s� reconhece um na.string por vez, ent�o se voc� misturar os s�mbolos de NA 
#na mesma planilha ser� necess�rio consert�-los antes de por os dados no R.

#DICA2: N�o represente dados faltantes por espa�os vazios. Desta forma, voc� pode confundir
#NAs com dados que existem, mas ainda n�o foram passados a limpo.


#Por fim, a fun��o read.table() possui ainda v�rios outros argumentos que podem ser
#�teis; n�o se esque�a de ler a documenta��o dispon�cel em help(read.table).


#### Exportando dados #####

#Primeiro, vamos criar uma matriz contendo os dados que queremos salvar.
tabela <- cbind(1:10,N=rnorm(10))
tabela

#Para criar um arquivo txt, utilizamos a fun��o write.table().
#O primeiro argumento desta fun��o � uma matriz ou data frame do R.
#O segundo argumento � o nome do arquivo que iremos criar.

write.table(tabela,file="arquivox.txt")
#Agora olhe em sua pasta de trabalho e veja o novo arquivo criado!

#Lembre que, para salvar o arquivo em outra pasta, � necess�rio especificar o caminho.
#Por exemplo:
write.table(tabela,file="C:\\Users\\Elder\\Desktop\\arquivox.txt")


#Assim como read.csv() e read.csv2(), tamb�m h� fun��es otimizadas para
#criar arquivos csv. Estas s�o write.csv() e write.csv2().

#Use write.csv2() para criar um arquivo que o seu excel em portugu�s pode abrir.
write.csv2(tabela,file="arquivox2.csv")

#Se o seu excel estiver em ingl�s, use write.csv()
write.csv(tabela,file="arquivox2.csv")

#N�o se esque�a de conferir maiores informa��es em help(write.table)




