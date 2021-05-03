"__Protocolo:__

+ Daniel Felipe Villa Rengifo

+ Lenguaje: R

+ Tema: Manejo de vectores en R

+ Fuentes:
  
  1. [RDocumentation](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/vector)
  2. [Pluralsight](https://www.pluralsight.com/guides/vectors-and-factors-in-r)"

## ---------------------------------------------------------------------------
# Crear un vector pseudo-aletorio y probar su tipo:
message("\n# Crear un vector pseudo-aletorio y probar su tipo:")

v <- runif(5, min = 0, max = 10)
print(v)

# Recordemos que double, se refiere a decimal:
message("\nRecordemos que double, se refiere a decimal:")
print(typeof(v))

# Verifiquemos su Tamaño con length:
message("\n# Verifiquemos su Tamaño con length:")

print(length(v))

## Veamos un ejemplo de coerción implicita de R:
message("\n## Veamos un ejemplo de coerción implicita de R:")

## Definimos un vector
message("\n## Definimos un vector")
u <- c(22L,124.1241, "Daniel Villa", FALSE)
cat("u <- ",u, sep = "  ")

## Vamos a ver que los valores de cada item son diferentes, pero al evaluar u, R coerciona a un tipo de dato:
message("\nVamos a ver que los tipos de datos de cada item son diferentes, pero al evaluar u, R coerciona a un tipo de dato:")

cat("typeof(u) =",typeof(u))




## ---------------------------------------------------------------------------
# Creamos un vector solamente con el operador ":"
message("\n# Creamos un vector solamente con el operador \":\"")
x <- 1:10
cat("x <- min:max")
cat("\nEjemplo = ", "x <- 1:10\n")
cat("x = ", x, sep = "  ")

## Ahora con numeros negativos:
message("\n## Ahora con numeros negativos:")
y <- 5:-5
cat("\nEjemplo = ", "y <- 5:-5\n")
cat("y = ", y, sep = "  ")




## ---------------------------------------------------------------------------
# Crear uuna secuencia mas compleja con seq():
message("\n# Crear uuna secuencia mas compleja con seq():")

s = seq (1, 3, by = 0.02) # by <=> especificar el tamaño del paso 

cat("\nseq (1, 3, by = 0.02)")
cat("Un vector s, especificando que va dando pasos e 0.02 :\n", "s = ", s, sep = "  ")

sl = seq (1, 10, length.out = 4) # especificar la longitud del vector 

cat("seq (1, 10, length.out = 4)")
cat("\nUn vector sl, especificando la longitud deseada del vector:\n", "sl = ", sl, sep = "  ")



## ---------------------------------------------------------------------------
# Usando un vector entero como índice:
message("\n# Usando un vector entero como índice:")

Vint <- sample(-20:20, size = 9, replace = TRUE)
cat("\nVint = ", Vint)
# Acedeamos a los elemntos:
message("\n# Acedeamos a los elemntos:")

#  Accedientdo al 2 elemento:
print("#  Accedientdo al 2 elemento")
Vint[2]

# Accediendo al 1er y 4to elemento
print("# Accediendo al 1er y 4to elemento")
Vint[1:4]

# Acceder a todos los elementos menos el 1er elemento:
print("# Acceder a todos los elementos menos el 1er elemento:")
Vint[-1]

# no puede mezclar enteros positivos y negativos:
message("\n# no puede mezclar enteros positivos y negativos:")

cat("\n> Vint[c(2,-4)]", "\nOUTPUT:\n","> Error in Vint[c(2, -4)]: solamente 0's pueden ser mezclados con subscritos negativos")

# los números reales se truncan en enteros:
message("\n# los números reales se truncan en enteros:")

cat("Vint[c(1.4, 5.13)] = ", Vint[c(1.4, 5.13)])
cat("\nEs decir, por cada double or float del vector dentro de los [] saldra un valor truncado del vector utilizado, en este caso Vint")





## ----warning=FALSE----------------------------------------------------------
#Retomando el vector anterior, pero lo renombraremos como Vlog.
message("\nRetomando el vector anterior, pero lo renombraremos como Vlog.")

Vlog = Vint
print(Vlog)

cat("\nSize de Vlog = ", length(Vlog))

## Probemos con un vecto logico:
message("\n## Probemos con un vecto logico:")

cat("Vlog[c(TRUE, TRUE, FALSE, TRUE, FALSE)] = ", Vlog[c(TRUE, TRUE, FALSE, TRUE, FALSE)])

## filtrar vectores basados en condiciones:
message("\n## filtrar vectores basados en condiciones:")

cat("\nVlog[Vlog > -10] <=>", Vlog[Vlog > -10])

if(Vlog[Vlog < 0] == c(0)){
  cat("\nVlog[Vlog < 0] <=>","NO contengo datos menores a 0")

}else{
  cat("\nVlog[Vlog < 0] <=>",Vlog[Vlog < 0])
}



## ---------------------------------------------------------------------------
# Definimos un vector con indice:
message("\n# Definimos un vector con indice:")

print("No es necesario definir el numero == nombre, simplemente es una etiqueta")
vnom <- c("Primero"= 1, "Tercero"= 3, "Cualiesquiera n"= 12342)
cat("\nvnom <- c(\"Primero\"= 1, \"Tercero\"= 3, \"Cualiesquiera n\"= 12342)")

# Imprimirmos nuestro vector:
message("\n# Imprimirmos nuestro vector:")
cat("vnom <-", vnom, sep = "  ")

# Imprimimos los nombres de vnom:
message("\n# Imprimimos los nombres de vnom:")

names(vnom)

print("Llamamos a un valor de vnom con el nombre asignado")

cat("vnom[\"Primero\"]", vnom["Primero"])

# Recorramos los nombre del vectro con un for:

print("Recorramos los nombre del vectro con un for")

for (x in names(vnom)) {
  cat("\n",paste0("vnom[",x,"]"), "<-",vnom[x])
}




## ---------------------------------------------------------------------------
# Definimos un vector:
print("# Definimos un vector:")
print("vx <- -10:15")

vx <- -10:15
cat("vx <- ", vx, sep = "  ")

## Modifiquemos algún valor:
message("\n## Modifiquemos algún valor:")
a = sample(1:26, size = 1, replace = TRUE)
b = sample(1:26, size = 1, replace = TRUE)
vx[a] <- b

cat(paste0("vx[",a,"]"), paste0("<- ", b))

## Veamos como modifico nuestro vector:
message("\n## Veamos como modifico nuestro vector:")

cat("vx <- ", vx, sep = "  ")

## Modificando elementos menores o mayores que:
message("\n## Modificando elementos menores o mayores que:")

vx[vx < 0] <- 5

cat("vx[vx < 0]", paste0("<- ", 5))

## Veamos como modifico nuestro vector:
message("\n## Veamos como modifico nuestro vector:")

cat("vx <- ", vx, sep = "  ")


## truncar x a los 4 primeros elementos:
message("\n## truncar x a los 4 primeros elementos:")

vx <- vx[1:4]
## Veamos como modifico nuestro vector:
message("\n## Veamos como modifico nuestro vector:")

cat("vx <- ", vx, sep = "  ")


## ---------------------------------------------------------------------------
# Definimos un vector:
print("# Definimos un vector:")
print("vx <- -10:15")

cat("vx <- ", vx, sep = "  ")

## Creamos una copia:
message("\n## Creamos una copia:")
vx = x

x <- NULL

print(x)

print("Tambien lo podemos elimar con rm()")
vx = x # volverla a definir para asignar denuevo valores

rm(x)

