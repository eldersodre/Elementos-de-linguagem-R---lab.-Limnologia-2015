#####################################################
#####################################################
######### Aula 4 - dispositivos gr�ficos ############
#####################################################
#####################################################


#Um dispositivo gr�fico � um alguma coisa onde um gr�fico pode aparecer.

#O lugar mais �bvio para um gr�fico aparecer � na tela do computador (dispositivos de tela),
#mas tamb�m pode ser um arquivo.

#A lista completa de dispositivos gr�ficos pode ser vista na p�gina de ajuda:
?Devices

#### Dispositivos de tela
#No R (n�o no R studio), quando criamos um gr�fico novo ele aparece em uma
#nova janela. No Rstudio, o gr�fico aparece numa aba de gr�ficos pr�pria do programa.
#Contudo, tamb�m h� fun��es que te permitem abrir uma nova janela de gr�ficos.
#Estas fun��es n�o funcionam em todos os computadores; h� uma fun��o para cada sistema operacional.

windows() #Windows
quartz()  #Mac
x11()     #Linux/Unix

#Com um dispositivo gr�fico aberto, os gr�ficos que forem criados aparecer�o no dispositivo gr�fico.
#Da mesma forma, par�metros globais dos gr�ficos (fun��o par()) s�o aplicados apenas ao dispositivo gr�fico aberto.

#Para fechar o dispositivo gr�fico ativo, pode-se usar a fun��o dev.off().


#### Dispositivos de arquivo ####
setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Outro tipo de dispositivo gr�fico s�o os dispositivos de arquivo.
#Estes dispositivos criam um arquivo de imagem em seu computador, e plotam o gr�fico
#dentro deste arquivo. S�o �teis para salvar gr�ficos.

#Vejamos alguns dispositivos:
pdf()
png()
jpeg()
tiff()
bmp()

#Por exemplo, se eu digitar:
tiff("grafico1.tiff")
#Eu crio um arquivo na minha pasta de trabalho chamado gr�fico1.tiff .
#Este arquivo, por enquanto, est� vazio; mas a partir de agora, os gr�ficos que eu
#plotar ir�o para este arquivo, em vez de aparecer na tela (n�o � poss�vel olhar o gr�fico ainda).
x <- 1:20
set.seed(635)
y <- 1:20 + rnorm(20,sd=3)
plot(x,y,type="b")


#Ap�s plotar o gr�fico, ainda � necess�rio fechar o dispositivo antes da visualiza��o:
dev.off()

#Al�m do nome do arquivo, tamb�m � poss�vel especificar o tamanho, pelos argumentos
#width e height.
png("grafico2.png",width=600,height=400)
plot(x,y,type="b")
dev.off()

#Existe tamb�m um argumento units, que especifica a unidade da altura e largura do arquivo.
#Por default, para png, jpg, bmp e tiff, units="px", ou seja, pixels.
#O dispositivo pdf n�o possui o argumento units. Suas medidas s�o sempre dadas em polegadas.

pdf("grafico3.pdf",width=5,heigh=8)
plot(x,y,type="b")
dev.off()


#Lembre-se que altera��es nos par�metros globais valem para o dispositivo aberto.
#Ent�o, se eu quiser, por exemplo, alterar o n�mero de linhas e colunas de um gr�fico
#que eu esteja salvando, preciso fazer isto ap�s abrir o dispositivo.
png("grafico4.png")
par(mfrow=c(2,2))

plot(x,y,type="b",pch=17,col="red")
hist(runif(100,-1,1),col="yellow")
pie(c(45,32,85,63,90,23,43),col=rainbow(7))
plot(1:100,200:101+rnorm(100),type="l",col="olivedrab")

dev.off()


