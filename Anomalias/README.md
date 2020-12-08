## Resumen

Primero se visualiza los datos en un plano $R^2$ tomando cada grupo por un color diferente
![imagen]("vista.png")

Se calcula la matriz de distancias y se crea un resumen por elemento con su vecino más cercano y su distancia.

| colum| vecino_cercano| cordenada|
|-----:|--------------:|---------:|
|     1|       1.610124|         4|
|     2|       2.040833|         3|
|     3|       1.702939|        47|
|     4|       1.610124|         2|
|     5|       2.011219|         4|
|     6|       1.744276|         7|

Así para los 399 elementos.

Luego se hace un filtrado de estos elementos y se hace un numevo resumen pero de la segunda distancia menor entre los elementos. El siguiente fragmento muestra los resultados para los primeros 6 datos.

| colum| fila| vecino_cercano_2|
|-----:|----:|----------------:|
|     1|    2|         3.050000|
|     2|    4|         2.202272|
|     3|    5|         2.011219|
|     4|    2|         1.610124|
|     5|    4|         2.011219|
|     6|    5|         2.012461|

Luego se calcula el cociente $V2/V1$. La siguiente tabla los resume en la variable **ratio**:

| colum| vecino_cercano| cordenada| fila| vecino_cercano_2|    ratio|
|-----:|--------------:|---------:|----:|----------------:|--------:|
|     1|       1.610124|         4|    2|         3.050000| 1.894264|
|     2|       2.040833|         3|    4|         2.202272| 1.079104|
|     3|       1.702939|        47|    5|         2.011219| 1.181028|
|     4|       1.610124|         2|    2|         1.610124| 1.000000|
|     5|       2.011219|         4|    4|         2.011219| 1.000000|
|     6|       1.744276|         7|    5|         2.012461| 1.153751|

## Identificar anomalías

Graficando los ejes cordenada 1 y 2 pensando en la **existencia de orden** al tomar los datos, podemos ver lo siguientes:

![imagen]("por_cordenada.png")

Agregandole ruido al grafico anterior podemos ver con más detalle los tamaños y colores de los ratio:

![imagen]("por_cordenada_ruidizado.png")

Un grafico por valores de ratio donde cada punto es identificable nos puede mostrar que datos tienen ratios muy diferentes o anomalos.

![imagen]("por_ratio.png")

