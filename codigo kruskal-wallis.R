setwd("D:\\Proyecto")

#antes de cargar el dataset toca cambiar las comas por puntos para que reconozca los decimales
#y cambiar las clases de categoricas a numéricas, es decir act 1 por 1, act 2 por 2....
datos = read.csv("Median.csv", header = T, sep = ";")

#matriz para la comparación
comparacion<-matrix(NA, nrow=16, ncol=2)

#matriz para guardar los valores de p del test
resultados<-matrix(NA, nrow=171, ncol=225)

#variables auxiliares
x<-8
y<-0
z<-18
l<-18
j<-1

for(i in 3:227){
	while(l!=0){
		for(k in 1:8){
			#asignar la clase 1, 2...
			comparacion[k,1]<-datos[k+y,1] #los primeros 8
			comparacion[k+8,1]<-datos[k+x,1] #los segundos 8
			#asignar los valores para la comparacion
			comparacion[k,2]<-datos[k+y,i] #los primeros 8
			comparacion[k+8,2]<-datos[k+x,i] #los segundos 8
		}
		#asignar el valor de p del kruskal test a la matriz		
		resultados[j,i-2]<-kruskal.test(comparacion[,2], comparacion[,1])$p.value
		#operaciones para moverse en la matriz datos
		x = x+8
		z = z-1
		if(z==0){
			y = y+8
			l = l-1
			z = l
			x = 8+y
		}
		j = j+1
		#inicializar la matriz de comparación para otro grupo
		comparacion<-matrix(NA, nrow=16, ncol=2)
	}
	#inicializar las variables auxiliares para otra columna
	x<-8
	y<-0
	z<-18
	l<-18
	j<-1
}

#guardamos el resultado de las comparaciones en un archivo
write.table(resultados, file = "median-kruskal.csv", sep=";", dec=",", col.names=FALSE, row.names=FALSE)