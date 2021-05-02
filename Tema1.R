# OULTIERS CONSULTING.SA.C
# AUTOR: DENIS RODRIGUEZ CORTEGANA
# FECHA: 24/04/2021
# AUTOR: Denis Yen

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
     ylab = "Frecuencia", labels = F)

# AGREGAR INTERPRETACIÓN:

# El histograma muestra la distribución de la velocidad
# dividida en 7 intervalos regulares.

# NUEVA SECCIÓN -----------------------------------------------------------

# Se corrigió el error.


# RAMA 2 ------------------------------------------------------------------
# El que se va encargar de la actualización de la rama 2 será Gerly.

