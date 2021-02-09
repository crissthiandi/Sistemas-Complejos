#generar primer renglon
library(tidyverse)
r=NULL
set.seed(0)
r=rbinom(8,1,0.5)
r
regla=c(0,1,0,1,1,0,1,0)

salida=matrix(r,ncol = 8)
salida
for (j in 1:100) {
  for(i in 1:8){
    r=salida[j,]
    #condicional ifelse ayuda a tratar los elementos sin vecinos a la izq, o derecha
    a[i]=case_when(
      ifelse(i==1,TRUE,r[i-1]==0) & r[i]==0 & ifelse(i==8,TRUE,r[i+1]==0) ~ regla[1],
      ifelse(i==1,TRUE,r[i-1]==0) & r[i]==0 & ifelse(i==8,TRUE,r[i+1]==1) ~ regla[2],
      ifelse(i==1,TRUE,r[i-1]==0) & r[i]==1 & ifelse(i==8,TRUE,r[i+1]==0) ~ regla[3],
      ifelse(i==1,TRUE,r[i-1]==0) & r[i]==1 & ifelse(i==8,TRUE,r[i+1]==1) ~ regla[4],
      ifelse(i==1,TRUE,r[i-1]==1) & r[i]==0 & ifelse(i==8,TRUE,r[i+1]==0) ~ regla[5],
      ifelse(i==1,TRUE,r[i-1]==1) & r[i]==0 & ifelse(i==8,TRUE,r[i+1]==1) ~ regla[6],
      ifelse(i==1,TRUE,r[i-1]==1) & r[i]==1 & ifelse(i==8,TRUE,r[i+1]==0) ~ regla[7],
      ifelse(i==1,TRUE,r[i-1]==1) & r[i]==1 & ifelse(i==8,TRUE,r[i+1]==1) ~ regla[8]
    )
  }
  salida=rbind(salida,a)
}
salida
