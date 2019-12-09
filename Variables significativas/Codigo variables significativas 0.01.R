setwd("D:\\Proyecto")

#antes de cargar el dataset toca cambiar las comas por puntos para que reconozca los decimales
datos = read.csv("median-kruskal.csv", header = T, sep = ";")

#matriz para guardar las variables
resultados<-matrix(NA, nrow=225, ncol=171)

#variables auxiliares
x <- 0.01

for(i in 1:171){
	for(j in 2:226){
		if(datos[i,j] < x){
			resultados[j-1,i] = colnames(datos)[j]
		}
	}
}

#guardamos el resultado de las comparaciones en un archivo
write.table(resultados, file = "0.01-median.csv", sep=";", dec=".", col.names=FALSE, row.names=FALSE)