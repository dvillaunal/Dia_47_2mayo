## ----------------------------------------------------------------------------------------
# Definimos un vector:
v <- c("Ana", "Come", "Banana")
print(v)

# Definimos una matrix:
m <- matrix(sample(10, size = 4,replace = TRUE), nrow = 2)
print(m)

# Definimos una data frame:
df <- data.frame("dato"= c("Expectativa" , "Realidad"),
                 "Huevos" = c(1800, 9000),
                 "Azucar" = c(90, 3000))

print(df)

# Definimos una lista
l <- list("Vector" = v, "Matriz"= m, "DataFrame"= df)

print(l)


## ----------------------------------------------------------------------------------------
# Con as.vector() coercionamos los datos:
"Volvemos a la matriz m en un vector"
as.vector(m) 

"Volvemos al data frame en un vector"
as.vector(df)


## ----------------------------------------------------------------------------------------
# Veamos que devulve para lista:
as.vector(l)



## ----------------------------------------------------------------------------------------
"El vector coercionado saldra una matriz con una sola columna:"
as.matrix(v) # coercionar el vector v


# Coercionar un data.frame():
as.matrix(df)


# Coercionar una lista:
as.matrix(l)




## ----------------------------------------------------------------------------------------
# Coercionar un vector a data frame:
as.data.frame(v)

# Coercionar una matriz a data frame:
as.data.frame(m)


## ----------------------------------------------------------------------------------------
# De vector a lista:
as.list(v)

# De matriz a lista:
as.list(m)

# De data frame a lista:
as.list(df)
