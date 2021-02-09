ruta=rstudioapi::getSourceEditorContext()$path
setwd(dirname(ruta))

library(png)
library(jpeg)
png::readPNG("image.jpg")
imagen_=jpeg::readJPEG("image.jpg")
class(imagen_)
View(imagen_)


hist(imagen_)
plot(imagen_)
print(imagen_)
# Haciendo de la imagen una representación de tipo RGB
img=imagen_
imgDm <- dim(img)
imgDm
imgRGB <- data.frame(
        x = rep(1:imgDm[2], each=imgDm[1]),
        y = rep(imgDm[1]:1, imgDm[2]),
        R = as.vector(img[,,1]),
        G = as.vector(img[,,2]),
        B = as.vector(img[,,3])
)
dim(imgRGB)

#summary
summary(imgRGB)
X11()

library(ggplot2)
ggplot(data = imgRGB, aes(x = x, y = y)) + 
        geom_point(colour = rgb(imgRGB[c("R", "G", "B")])) +
        labs(title = "Original Image: Colorful Bird") +
        xlab("x") +
        ylab("y")

#Clustering
k <- 3
kMeans <- kmeans(imgRGB[, c("R", "G", "B")], 
                 centers=k, nstart=1)

#Compute new color values for each pixel
kColors <- rgb(kMeans$centers[kMeans$cluster,])

#R-plot using the new colors from the vector kColors instead
#of the original colors
ggplot(data = imgRGB, aes(x = x, y = y)) + 
        geom_point(colour=kColors) +
        labs(title = "k-Means Clustering of 3 Colors") +
        xlab("x") +
        ylab("y")









