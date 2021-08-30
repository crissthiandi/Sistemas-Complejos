# Sistemas-Complejos
Algunos Ejemplos de sistemas complejos, sus modelos y códigos para interactuar.

## Automatas unidmencionales y bidimencionales

Código que soporta la presentación gráfica de autómatas de una dimensión o dos dimensiones. Escrito en Python.

### Manual documentatorio para automata unidimencional

El archivo [Notebook](automata.ipynb) genera autómatas unidimensionales como los trabajados en el repositorio, por ejemplo:

![imagen-RULE110](RULE-110.png)

![imagen-RULE-30-1](RULE-30-1.png)

## Detección de anomalias

El código trabajado en el taller de detección de anomalías se puede consultar en la siguiente liga [Repositorio](Anomalias/) **Escrito en R**, en esta carpeta se detalla que se hizo en el curso.

## Clasificación de resonancias en tumores (Computer Vision)

En el último taller se hizo un análisis de imágenes de resonancias a un paciente para ver si se encontraban elementos que pudieran ayudar a clasificar si el tumor era de alto o bajo impacto.

Los resultados fueron que al hacer un analisis por su descomposición, todo el modelado debía contemplar una serie de variables algo técnicas, como lo son, el contraste, la suma de los promedios, la entropía, el segundo momento angular, entre otras variables.

Al final propongo dos enfoques para solucionar el problema, uno clásico llamado **clasificador logístico múltiple** y otro menos probabilístico llamado **vecinos más cercanos**. Los resultados de estos dos métodos se puede consultar en el [Notebook](Imagenes_procesamiento/CaracteristicasMedicalIMages_Actualizada.ipynb)



