setwd("D:\\Proyecto")
datos = read.csv("Datos.csv", header = T, sep = ";")
attach(datos)
bartlett.test(T_zacc_mean~Actividad)
