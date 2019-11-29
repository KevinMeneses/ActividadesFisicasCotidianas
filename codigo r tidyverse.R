setwd("D:\\Proyecto")
datos = read.csv("Datos3.csv", header = T, sep = ";") 
#Datos3 es el dataset que lo modifiqué para que las actividades aparezcan
#como 1 2 3 en vez de act 1 act 2...

library(dplyr)

datos2<-vector()
resumen<-matrix(NA, nrow=152, ncol=225)
h<-0

#siempre se demora bastantico en terminar
for(k in 1:19){
	for(j in 1:8){
		for(i in 1:225){
			datos2 <- datos %>%
				filter(Participante == j & Actividad == k)
			datos2 <- datos2 %>%
				select(-Actividad, -Participante, -Seccion)
			resumen[j+h,i] <- as.matrix(datos2 %>%
				summarise(median(datos2[,i]))) #acá se le pone el metodo que le corresponde a cada uno
		}
	}
	h<-h+8
}

#acá guardan el archivo con el nombre del método
write.table(resumen, file = "median.csv", sep=";", dec=",", col.names=FALSE, row.names=FALSE)

#Despues de guardar el archivo hay que editarlo y ponerle de nuevo Actividad, Participante y Seccion.
#y el nombre de las variables que lo subo también al drive.
#Lo bueno es que está en orden, es decir Participante inicia del 1 al 8 y se repite de nuevo hasta el final.
#Los primeros 8 son "Act 1", los segundos son "Act 2" y así sucecivamente, por eso son 152 filas cada archivo.
#Seccion solo es el conteo es decir del 1 al 152, aunque no sé que tan necesario sea poner Seccion.

#La siguiente tarea es reemplazar los métodos que le corresponda a cada uno.
#mean() que está en el ejemplo es el promedio y ya lo hice. Y también me encargo de median() la mediana.

#Falta los otros métodos:
#sd() Desviación estándar, IQR() rango intercuartil, cv() coeficiente de variación, 
#kurtosis() Kurtosis y skewness() que tiene que ver con la asimetría.