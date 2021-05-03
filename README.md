__Protocolo:__

+ Daniel Felipe Villa Rengifo

+ Lenguaje: R

+ Tema: Manejo de vectores en R

+ Fuentes:
  
  1. [RDocumentation](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/vector)
  2. [Pluralsight](https://www.pluralsight.com/guides/vectors-and-factors-in-r)
  
  
# Vectores en R:

El vector es una estructura de datos básica en R. Contiene elementos del mismo tipo. Los tipos de datos pueden ser lógicos, enteros, dobles, caracteres, complejos o raw.

## Nota: _funciones utiles_:

1. El tipo de un vector se puede comprobar con la función `typeof()`.

2. Otra propiedad importante de un vector es su longitud. Es el número de elementos del vector y puede comprobarse con la función `length()`.

# ¿Como Crear un vector en R?:

Los vectores generalmente se crean usando la función `c()`.

Dado que un vector debe tener elementos del mismo tipo, esta función intentará coaccionar elementos del mismo tipo, si son diferentes.

La [coerción (Explicado en la Publicación de RPubs Coerción)](https://rpubs.com/dvillaunal/Coercion) (o en el replit en la carpeta coercion esta explicada) es de tipos más bajos a más altos, de lógico a entero, a doble a carácter.

> A grandes rasgos la Coerción es: _En R, los datos pueden ser coercionados, es decir, forzados, para transformarlos de un tipo a otro. La coerción es muy importante. Cuando pedimos a R ejecutar una operación, intentará coercionar de manera implícita, sin avisarnos, los datos de su tipo original al tipo correcto que permita realizarla._

```{r}
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


```

Si queremos crear un vector de números consecutivos, el operador __`:`__ es muy útil.

## Ejemplo:

```{r}
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


```

Se pueden crear secuencias más complejas usando la función `seq()`, como definir el número de puntos en un intervalo o el tamaño del paso.

```{r}
# Crear uuna secuencia mas compleja con seq():
message("\n# Crear uuna secuencia mas compleja con seq():")

s = seq (1, 3, by = 0.02) # by <=> especificar el tamaño del paso 

cat("\nseq (1, 3, by = 0.02)")
cat("Un vector s, especificando que va dando pasos e 0.02 :\n", "s = ", s, sep = "  ")

sl = seq (1, 10, length.out = 4) # especificar la longitud del vector 

cat("seq (1, 10, length.out = 4)")
cat("\nUn vector sl, especificando la longitud deseada del vector:\n", "sl = ", sl, sep = "  ")

```
# ¿Cómo acceder a los elementos de un vector?

Se puede acceder a los elementos de un vector mediante la indexación vectorial. El vector utilizado para la indexación puede ser lógico, entero o de caracteres.

> ## NOTA: R empieza en __1__:
_El índice de los vectores en R empieza en 1, a diferencia de la mayoría de los lenguajes de programación donde el índice empieza en 0._


## Usando un vector entero como índice:

+ Podemos utilizar un vector de enteros como índice para acceder a elementos específicos.

+ También podemos usar enteros negativos para retornar todos los elementos excepto los especificados.

+ Pero no podemos mezclar enteros positivos y negativos al indexar y los números reales, si se usan, se truncan a enteros.

### Ejemplo:

```{r}
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



```

## Usando vector lógico como índice:

Cuando usamos un vector lógico para indexar, se retorna la posición donde el vector lógico es TRUE.

Esta útil característica nos ayuda en el filtrado del vector como se muestra a continuación:

### Ejemplo:

```{r warning=FALSE}
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

```
En el ejemplo anterior, la expresión `x>0` producirá un vector lógico `(FALSE, FALSE, FALSE, TRUE)` que luego se usa para indexar y dar el valor del vector que cumple la condición.


## Usando vector de caracteres como índice:

Este tipo de indexación es útil cuando se trata de vectores con nombre. Podemos nombrar cada elemento de un vector.

```{r}
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


```

# ¿Cómo modificar un vector en R?:

Podemos modificar un vector usando el operador de asignación.

Podemos utilizar las técnicas comentadas anteriormente para acceder a elementos específicos y modificarlos.

Si queremos truncar los elementos, podemos utilizar reasignaciones.

```{r}
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
```
# ¿Cómo eliminar un vector?:

Podemos eliminar un vector simplemente asignándole un `NULL`.

```{r}
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
```

