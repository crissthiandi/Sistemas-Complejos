#Bibliotecas a usar en R-software
library(tidyverse)
#Lectura de los datos zahn
base=read.csv("C:/Users/Acer E15/Downloads/zahn.csv",sep = "\t",header = F)
base=tibble(base)
base

#Vista
ggplot(base,aes(x = V1,y = V2,color=V3))+
  geom_point(show.legend = F)+
  ggtitle("Grafico que visualiza los datos")+
  labs(x = "componente 1",y = "Componente 2")

#distancias matrix
distancia=dist(cbind(base$V1,base$V2),method = "euclidean",diag = T)
distancia
max(distancia) #diametro de los datos
min(distancia) #distancia minima general

#metodo manual para vecinos cercano

#primer vecino v1()

distancia_df <- reshape::melt(as.matrix(distancia), varnames = c("filas", "colum"))
minimo=distancia_df %>%
  filter(colum!=filas) %>%
  group_by(colum) %>%
  summarise(vecino_cercano=min(value),cordenada=which.min(value)+1)
minimo
knitr::kable(head(minimo))
#diametro
diametro=distancia_df %>%
  filter(colum!=filas) %>%
  group_by(colum) %>%
  summarise(vecino_lejano=max(value))
diametro$vecino_lejano %>% max()

direccion_=minimo$cordenada+399*(minimo$colum-1)
direccion_
minimo_2=distancia_df %>%
  mutate(fila=row_number()) %>%
  filter(colum!=filas & !fila %in% direccion_ ) %>%
  group_by(colum) %>%
  summarise(fila=which.min(value)+1,vecino_cercano_2=min(value))
minimo_2

knitr::kable(head(minimo_2))


Ratio=minimo %>%
  left_join(minimo_2) %>%
  mutate(ratio=vecino_cercano_2/vecino_cercano)
Ratio

knitr::kable(head(Ratio))


#grafico de ratios
ggplot(Ratio,aes(colum,cordenada,size=ratio,color=ratio))+
  geom_point()#+geom_jitter(width = 10, height = 10)

ggsave(filename = "por_cordenada_ruidizado.png" )
ggsave(filename = "por_cordenada.png" )

#buscador de anomalos
ggplot(Ratio,aes(colum,ratio))+
  geom_point()+
  geom_text(aes(label=cordenada))

ggsave(filename = "por_ratio.png" )
