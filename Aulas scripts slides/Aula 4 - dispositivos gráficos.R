#####################################################
#####################################################
######### Aula 4 - dispositivos gráficos ############
#####################################################
#####################################################


#Um dispositivo gráfico é um alguma coisa onde um gráfico pode aparecer.

#O lugar mais óbvio para um gráfico aparecer é na tela do computador (dispositivos de tela),
#mas também pode ser um arquivo.

#A lista completa de dispositivos gráficos pode ser vista na página de ajuda:
?Devices

#### Dispositivos de tela
#No R (não no R studio), quando criamos um gráfico novo ele aparece em uma
#nova janela. No Rstudio, o gráfico aparece numa aba de gráficos própria do programa.
#Contudo, também há funções que te permitem abrir uma nova janela de gráficos.
#Estas funções não funcionam em todos os computadores; há uma função para cada sistema operacional.

windows() #Windows
quartz()  #Mac
x11()     #Linux/Unix

#Com um dispositivo gráfico aberto, os gráficos que forem criados aparecerão no dispositivo gráfico.
#Da mesma forma, parâmetros globais dos gráficos (função par()) são aplicados apenas ao dispositivo gráfico aberto.

#Para fechar o dispositivo gráfico ativo, pode-se usar a função dev.off().


#### Dispositivos de arquivo ####
setwd("C:\\Users\\Elder\\Desktop\\Minicurso Elementos de Linguagem R")

#Outro tipo de dispositivo gráfico são os dispositivos de arquivo.
#Estes dispositivos criam um arquivo de imagem em seu computador, e plotam o gráfico
#dentro deste arquivo. São úteis para salvar gráficos.

#Vejamos alguns dispositivos:
pdf()
png()
jpeg()
tiff()
bmp()

#Por exemplo, se eu digitar:
tiff("grafico1.tiff")
#Eu crio um arquivo na minha pasta de trabalho chamado gráfico1.tiff .
#Este arquivo, por enquanto, está vazio; mas a partir de agora, os gráficos que eu
#plotar irão para este arquivo, em vez de aparecer na tela (não é possível olhar o gráfico ainda).
x <- 1:20
set.seed(635)
y <- 1:20 + rnorm(20,sd=3)
plot(x,y,type="b")


#Após plotar o gráfico, ainda é necessário fechar o dispositivo antes da visualização:
dev.off()

#Além do nome do arquivo, também é possível especificar o tamanho, pelos argumentos
#width e height.
png("grafico2.png",width=600,height=400)
plot(x,y,type="b")
dev.off()

#Existe também um argumento units, que especifica a unidade da altura e largura do arquivo.
#Por default, para png, jpg, bmp e tiff, units="px", ou seja, pixels.
#O dispositivo pdf não possui o argumento units. Suas medidas são sempre dadas em polegadas.

pdf("grafico3.pdf",width=5,heigh=8)
plot(x,y,type="b")
dev.off()


#Lembre-se que alterações nos parâmetros globais valem para o dispositivo aberto.
#Então, se eu quiser, por exemplo, alterar o número de linhas e colunas de um gráfico
#que eu esteja salvando, preciso fazer isto após abrir o dispositivo.
png("grafico4.png")
par(mfrow=c(2,2))

plot(x,y,type="b",pch=17,col="red")
hist(runif(100,-1,1),col="yellow")
pie(c(45,32,85,63,90,23,43),col=rainbow(7))
plot(1:100,200:101+rnorm(100),type="l",col="olivedrab")

dev.off()


