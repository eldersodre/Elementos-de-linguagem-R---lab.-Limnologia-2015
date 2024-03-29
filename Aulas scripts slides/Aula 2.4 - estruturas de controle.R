###########################################################
###########################################################
########### Aula 2.4 - estruturas de controle #############
###########################################################
###########################################################

#Estruturas de controle controlam a execu��o do programa,
  #de acordo com certas condi��es.

#Normalmente, estruturas de controle n�o s�o normalmente utilizadas em sess�es interativas.
  #Em vez disso, elas s�o comumente usadas para escrever fun��es e express�es mais longas.

#Neste curso, abordaremso as duas estruturas de controle mais
#comuns: if/else e for.



#### if/else ####

#if/else permite que voc� teste uma condi��o � verdadeira. O R faz alguma coisa
# se a condi��o for verdadeira, e outra coisa se a condi��o for falsa.

#Estrutura b�sica:
if(<condi��o>) {
  ##Faz alguma coisa
} else {
  ##Faz outra coisa
}

#if/else tamb�m pode ser usado para testar mais de uma condi��o ao mesmo tempo:
if(<condi��o1>) {
  ##Faz alguma coisa
} else if (<condi��o2>){
  ##Faz alguma coisa diferente
} else {
  ##Faz alguma coisa diferente
}


#Por outro lado, o else � opcional; voc� pode fazer algo se a condi��o for verdadeira
#e n�o fazer absolutamente nada se a fun��o for falsa:
if(<condi��o>) {
  ##Faz alguma coisa
}


#Vamos olhar as estruturas abaixo. Perceba que ambas as formas s�o v�lidas e 
#fazem a mesma coisa:

if (x>3) {
  y <- 10
} else {
  y <- 0
}


y <- if (x>3) {
  10
} else {
  0
}


#Uma alternativa � estrutura if/else � a fun��o ifelse(), que funciona assim:
#ifelse(teste,sim,n�o)
ifelse(x>3,10,0)


#### for ####

#A estrutura for � uma das formas de fazer um loop, ou seja, fazer alguma coisa com sucessivos
#valores de uma sequ�ncia ou vetor.

#Sua estrutura b�sica �:
for (i in1:n){     #Para cada valor sucessivo de i at� n
  #Alguma coisa    #alguma coisa � feita com este valor.
}

#Vejamos mais allguns exemplos:

for (i in 1:10) {  #Isto significa que, para cada n�mero do 1 ao 10,
  print(i)         #o R vai retornar aquele valor.
}

#A estrutura acima pode n�o ser muito �til, mas serve como exemplo.
#OBS: perceba que dentro da estrutura for, o R s� retorna o que for 
#explicitamente chamado dentro da fun��o print(). Por exemplo, se eu escrever:
for (i in 1:10) {
  log(i)
}
#Parece que o R n�o fez nada, mas na verdade ele calculou os valores de log e
#n�o nos mostrou. Uma forma mais �til de fazer isso seria com a fun��o print()
#ou, melhor ainda, criando um objeto para guardar os resultados.
for (i in 1:10) {
  print (log(i)) #Usando a fun��o print
} 

resultado <- numeric(10) #Criei um vetor vazio para guardar os resultados
for (i in 1:10) {
  resultado[i] <- log(i)  #Vou atribuir cada valor do log de i para a posi��o i do vetor
}
resultado  #Viu s�?


#Mais alguns exemplos. Observe que todos os casos abaixo s�o igualmente v�lidos.

x <- c("a","b","c","d")

for (i in 1:4) {
  print(x[i])
}

for (i in 1:length(x)) {    #�til para quando voc� n�o souber o comprimento do vetor x.
  print(x[i])
}

for (i in seq_along(x)) {  #A fun��o seq_along() cria automaticamente uma sequ�ncia de n�meros inteiros de 1 at� o comprimento do vetor.
  print(x[i])
}

for (i in 1:4) print(x[i])  #Quando a xpress�o for pequena, pode-se omitir as chaves e colocar a express�o inteira na mesma linha.



#Loops com for tamb�m podem ser aninhados, ou seja, voc� pode criar um for dentro do outro.
#Isto � frequentemente necess�rio para trabalhar com objetos bidimensionais, como matrizes.

#Vejamos um exemplo:
y <- matrix(1:6,2,3)

for (i in seq_len(nrow(y))) {  #obs: seq_len(nrow(y)) cria uma sequ�ncia de n�meros inteiros de 1 at� o n�mero de linhas de y; � a mesma coisa que escrever 1:nrow(y)
  for (j in seq_len(ncol(y))) { #Por conven��o, i representa as linhas e j as colunas
    print(y[i,j])
  }
}


#Abaixo, outra forma de escrever a mesma coisa:
for (i in 1:nrow(y)) {
  for (j in 1:ncol(y)) {
    print(y[i,j])
  }
}










