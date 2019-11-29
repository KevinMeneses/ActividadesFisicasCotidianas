setwd("D:\\Proyecto")
datos = read.csv("Datos.csv", header = T, sep = ";")
attach(datos)
shapiro.test(columna)$p.value
require(nortest)
ad.test(columna)$p.value
cvm.test(columna)$p.value
lillie.test(columna)$p.value
pearson.test(columna)$p.value
sf.test(columna)$p.value