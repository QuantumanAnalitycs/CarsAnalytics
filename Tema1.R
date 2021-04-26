# OULTIERS CONSULTING.SA.C
# AUTOR: DENIS RODRIGUEZ CORTEGANA
# FECHA: 24/04/2021


# Ejemplo para GitHub -----------------------------------------------------

data <- cars
head(cars)
str(cars)

# se raliza una auditoria de datos 
library(funModeling)
str(cars)
df_status(cars)


# Realizamos un resumen de los datos
summary(data)

# Realizamos una medida de correlación
cor(cars)

# Gráfico
library(ggplot2)
ggplot(cars, aes(speed, dist))+
  geom_point(colour = "blue")

hist(cars)
hist(cars$dist, breaks = 7, col = "red",
     main = "Histograma de la velocidad",xlab = "Intervalos",
     ylab = "Frecuencia", labels = T)
# Agregar Interpretación:

# El histograma muestra la distribución de la velocidad


