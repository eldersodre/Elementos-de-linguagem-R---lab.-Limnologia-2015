?datasets
library(help="datasets")

library(vegan)
BCI

head(BCI)

?BCI
summary(BCI)
str(BCI)
specnumber(BCI)
diversity(BCI)
length(specnumber(BCI))

####### Função Margalef ####
#Marg=(S-1)/N

margalef <- function(data) {
  S <- specnumber(data)
  N <- rowSums(data)
  m <- (S-1)/N
  m
}


margalef(BCI)
margalef(zoo)

nrows(BCI)

pres.aus <- function(data) {
  res <- matrix(nrow=nrow(data),ncol=ncol(data))
  as.data.frame(res)
  colnames(res) <- colnames(data)
  rownames(res) <- rownames(data)
  for(i in 1:nrow(data)){
    for(j in 1:ncol(data)){
      if(data[i,j]==0){
        res[i,j] <- 0
      } else{
        res[i,j] <- 1
      }
    }
  }
  print(res)
}



pres.aus(BCI)
pres.aus(zoo)


