setwd("D:\\Proyecto")
datos = read.csv("Datos.csv", header = T, sep = ";")
attach(datos)

#librerias
require(nortest)
library(moments)
library(lawstat)
library(fpp)

#boxcox
summary(RL_zacc_median)
x=RL_zacc_median+10
summary(x)
lambda <- BoxCox.lambda(x, method=c("loglik"), lower =-5, upper=5)
lambda
w<-BoxCox(x,lambda)

#normalidad
jarque.bera.test(w)
ad.test(w)
lillie.test(w)

#homocedasticidad
bartlett.test(w~Actividad)
levene.test(w,Actividad)
fligner.test(w~Actividad)
qqnorm(w)
qqline(w)
