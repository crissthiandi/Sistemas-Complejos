library(tidyverse)
base=read.csv("C:/Users/Acer E15/Downloads/zahn.csv",sep = "\t",header = F)
base=tibble(base)
base

ggplot(base,aes(x = V1,y = V2,color=V3))+
  geom_point(show.legend = F)

#diametro c:
distancia=dist(cbind(base$V1,base$V2),method = "euclidean",diag = T)
distancia
max(distancia) #diametro
min(distancia)
head(distancia,15)

#metodo manual

#primer vecino v1()

df <- reshape::melt(as.matrix(distancia), varnames = c("filas", "colum"))
minimo=df %>%
  filter(colum!=filas) %>%
  group_by(colum) %>%
  summarise(vecino_cercano=min(value),cordenada=which.min(value)+1)
minimo

diametro=df %>%
  filter(colum!=filas) %>%
  group_by(colum) %>%
  summarise(vecino_lejano=max(value))
diametro$vecino_lejano %>% max()

direccion_=minimo$cordenada+399*(minimo$colum-1)
direccion_
minimo_2=df %>%
  mutate(fila=row_number()) %>%
  filter(colum!=filas & !fila %in% direccion_ ) %>%
  group_by(colum) %>%
  summarise(fila=which.min(value)+1,vecino_cercano_2=min(value))
minimo_2



Ratio=minimo %>%
  left_join(minimo_2) %>%
  mutate(ratio=vecino_cercano_2/vecino_cercano)
Ratio

#grafico de ratios
ggplot(Ratio,aes(colum,cordenada,color=ratio))+
  geom_point()

#buscador de anomalos
ggplot(Ratio,aes(colum,ratio))+
  geom_point()+
  geom_text(aes(label=cordenada))

