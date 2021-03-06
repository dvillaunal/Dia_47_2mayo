Al igual que con los datos, cuando intentamos hacer operaciones con una estructura de datos, R intenta coercionarla al tipo apropiado para poder llevarlas a cabo con éxito.

También podemos usar alguna de las funciones de la familia as() coercionar de un tipo de estructura de datos. A continuación se presentan las más comunes.

   Función       |   Coerciona a  |  Coerciona Extosamente a
-----------------|----------------|------------------------
  `as.vector()`  |     Vector     |       Matrices
  `as.matrix()`  |    Matrices    |   Vectores, Data Frames
`as.data.frame()`|   Data Frame   |    Vectores, Matrices
  `as.list()`    |     Lista      |Vectores, Matrices, Data Frames
  
+ __Nota:__ las estructuras de datos más sencillas, (unidimensionales, homogeneas) pueden ser coercionadas a otras más complejas (multidimensionales, heterogeneas), pero la operación inversa casi nunca es posible.

Expliquemos lo anterior dicho:

```{r}
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
```

# `as.vector()`:

Coercionar un tipo de datoa vecto (En este caso la matriz y el data frame):

```{r}
# Con as.vector() coercionamos los datos:
"Volvemos a la matriz m en un vector"
as.vector(m) 

"Volvemos al data frame en un vector"
as.vector(df)
```

+ __Nota:__ Como podemos ver `as.vector()` no afecta la integridad del elemento dentro del parentesis, es decir, el metodo devuelve la coeerción de este, por ende los elementos definidos anteriormente no son afectados.


```{r}
# Veamos que devulve para lista:
as.vector(l)

```

__La coerción que intentamos sólo tuvo éxito para una matriz. Para data frame y lista, nos devolvió los mismos objetos.__

> Nota que `as.vector()` no devolvió un error o una advertencia a pesar de que no tuvo éxito al coercionar, en este caso un data frame o una lista. Esto es importante, pues no puedes confiar que `as.vector()` tuvo éxito porque corrió sin errores, es necesaria una verificación adicional. Como R intenta coercionar automáticamente, esto puede producir resultados inesperados si no tenemos cuidado.

# `as.matrix()`:

intentemos coercionar con `as.matrix()`

```{r}
"El vector coercionado saldra una matriz con una sola columna:"
as.matrix(v) # coercionar el vector v


# Coercionar un data.frame():
as.matrix(df)


# Coercionar una lista:
as.matrix(l)


```
Por su parte, al correr la función con un data frame, coercionamos también todos los datos que contiene, siguiendo las reglas de coerción de tipos de dato

Al coercionar una lista a una matriz, efectivamente obtenemos un objeto de este tipo, sin embargo perdemos toda la información que contiene, por lo tanto, no podemos considerar que esta es una coerción exitosa. Del mismo modo que con `as.vector()`, no nos es mostrado ningún error ni advertencia.


# `as.data.frame()`:

```{r}
# Coercionar un vector a data frame:
as.data.frame(v)

# Coercionar una matriz a data frame:
as.data.frame(m)
```

Tuvimos éxito al coercionar vectores y matrices.

El vector, al igual que cuando fue coercionado a matriz, devolvió como resultado un objeto con una sola columna, mientras que la matriz conservó sus renglones y columnas.

## ¿Que pasa de coercionar listas a data frames?

En este caso, al intentar la coerción de lista a data frame, obtenemos un error. Esta es la única situación en la que esto ocurre utilizando las funciones revisadas en esta sección.

    > # Coercionar una lista a data.frame:
    > as.data.frame(l)
    
    OUTPUT:
    > Error in (function (..., row.names = NULL,
    check.rows = FALSE, check.names = TRUE,  :
    arguments imply differing number of rows: 3, 2


# `as.list()`:

Dado que las listas son el tipo de objeto más flexible de todos, Notaremos un exito en todos los caos de nuestra operación:

```{r}
# De vector a lista:
as.list(v)

# De matriz a lista:
as.list(m)

# De data frame a lista:
as.list(df)


```


+ __Nota:__
  * para los vectores y matrices, cada uno de los       elementos es transformado en un elemento dentro     de la lista resultante. Si tuvieramos una matriz     con cuarenta y ocho celdas, obtendríamos una        lista con ese mismo número de elementos.
  
  * En cambio, para un data frame, el resultado es      una lista, en la que cada elemento contiene los     datos de una columna del data frame original. Un     data frame con diez columnas resultará en una       lista de diez elementos.



_"Conocer cómo ocurre la coerción de estructuras de datos te ayudará a entender mejor algunos resultados devueltos por funciones de R, además de que te facilitará la manipulación y procesamiento de datos."_ 

----------------------------------------------------

# Bibilografia:

https://rsanchezs.gitbooks.io/rprogramming/content/chapter2/explicitcoercion.html

https://www.oreilly.com/library/view/r-in-a/9781449358204/ch05s08.html

----------------------------------------------------



