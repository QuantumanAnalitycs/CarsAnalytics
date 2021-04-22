# OULTIERS CONSULTING.SA.C
# AUTOR: DENIS RODRIGUEZ CORTEGANA


# Ejemplo para GitHub -----------------------------------------------------

data <- cars
head(cars)

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
hist(cars$dist, breaks = 7, col = "Blue",
     main = "Histograma de frequencias",xlab = "Divisiones")
