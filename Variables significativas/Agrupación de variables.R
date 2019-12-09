setwd("D:\\Proyecto")

#antes de cargar el dataset toca cambiar las comas por puntos para que reconozca los decimales
datos1 = read.csv("0.01-mean.csv", header = T, sep = ";")
datos2 = read.csv("0.01-median.csv", header = T, sep = ";")

#matriz para guardar las variables
resultados<-matrix(NA, nrow=225, ncol=171)

#variables auxiliares
for(i in 1:171){
	for(j in 1:225){
		if(!is.na(datos1[j,i])){
			if(!is.na(datos2[j,i])){				
			}
			else{
				resultados[j,i] <- as.matrix(datos1[j,i])
			}				
		}
		if(!is.na(datos2[j,i])){
			resultados[j,i] <- as.matrix(datos2[j,i])
		}
	}
}

#guardamos el resultado de las comparaciones en un archivo
write.table(resultados, file = "agrupado1.csv", sep=";", dec=".", col.names=FALSE, row.names=FALSE)