**************** PRÁCTICA 12 - LENGUAJES Y PARADIGMAS DE PROGRAMACIÓN *****************

Autores: 
- Noelia Rodríguez Martín
- Juan Manuel Ramos Pérez
           
OBJETIVO

Considere la Gema para la representación de Matrices que ha desarrollado en prácticas anteriores. Los objetivos de esta práctica son dos:
Seguir las dependencias de la Gema (Gemnasium).
Diseñar e implementar un Lenguaje de Dominio Específico (Domain Specific Language - DSL).

CLASE MATRIZ (MADRE)

Es un clase abstracta, por tanto no tiene métodos. 


CLASE DENSA (HIJA)

MÉTODOS

Los métodos que se han implementado son los siguientes:

-- Método initialize --
Asignamos valores a las filas, columnas y argumentos. Es el constructor


-- Método to_s(*args) --
Debe: mostrar la matriz

 
-- Método +(other) --
Debe: calcula la suma de dos matrices 


-- Método -(other) --
Debe: calcula la resta de dos matrices 


-- Método  *(other) --
Debe: calcula la multiplicación de dos matrices 


-- Método minimo --
Debe: calcula el número menor de todos los elementos de la matriz 


-- Método maximo --
Debe: calcula el número mayor de todos los elementos de la matriz 



CLASE DISPERSA (HIJA)

MÉTODOS

Los métodos que se han implementado son los siguientes:

-- Método initialize --
Asignamos valores a las filas, columnas y argumentos. Es el constructor



-- Método calcularFilCol(numElem) --
Cálcula las filas y las columnas.

 
-- Método minimo --
Debe: calcula el número menor de todos los elementos de la matriz 


-- Método maximo -- 
Debe: calcula el número mayor de todos los elementos de la matriz 


-- Método to_s --
Debe: mostrar la matriz


-- Método +(other) --
Debe: calcula la suma de dos matrices 


-- Método -(other) --
Debe: calcula la resta de dos matrices 


-- Método *(other) --
Debe: calcula la multiplicación de dos matrices 


CLASE FRACCIÓN

-- Método coerce --
Debe: suma un entero con una fracción y una fracción con un entero y fracción con fracción.


CLASE MATRIXDSL

Es una clase diseñada para un lenguaje de dominio específico. Sus métodos sirven como puente hacia los
 métodos reales que se encuentran en la clase matriz, tanto matriz densa como matriz dispersa.

Éstos actúan de forma que se pueda acceder a los métodos originales de la clase matriz mediante un lenguaje 
sencillo.

Métodos: 

- operación
- operando
- ejecutar (permite completar la línea de código que se evaluará para llamar a los métodos originales)


Las consultas a matrices que se quieran realizar se escribiran en el archivo matrices.rb, y para la ejecución 
de dichas consultas se compilará el archivo m.rb.




