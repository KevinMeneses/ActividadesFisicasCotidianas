install.packages("MASS")
installed.packages("survival")
installed.packages("fitdistrplus")

library(MASS)
library(survival)
library(fitdistrplus)

datos=read.csv("datos.csv", sep=";", dec=".", header=TRUE)
hist(datos$T_xacc_mean, main="Histograma", xlab="Clase actividad")
ajuste = fitdist(datos$T_xacc_mean, "norm")
ajuste$estimate
plot(ajuste)