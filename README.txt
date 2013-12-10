**************** PR�CTICA 12 - LENGUAJES Y PARADIGMAS DE PROGRAMACI�N *****************

Autores: 
- Noelia Rodr�guez Mart�n
- Juan Manuel Ramos P�rez
           
OBJETIVO

Considere la Gema para la representaci�n de Matrices que ha desarrollado en pr�cticas anteriores. Los objetivos de esta pr�ctica son dos:
Seguir las dependencias de la Gema (Gemnasium).
Dise�ar e implementar un Lenguaje de Dominio Espec�fico (Domain Specific Language - DSL).

CLASE MATRIZ (MADRE)

Es un clase abstracta, por tanto no tiene m�todos. 


CLASE DENSA (HIJA)

M�TODOS

Los m�todos que se han implementado son los siguientes:

-- M�todo initialize --
Asignamos valores a las filas, columnas y argumentos. Es el constructor


-- M�todo to_s(*args) --
Debe: mostrar la matriz

 
-- M�todo +(other) --
Debe: calcula la suma de dos matrices 


-- M�todo -(other) --
Debe: calcula la resta de dos matrices 


-- M�todo  *(other) --
Debe: calcula la multiplicaci�n de dos matrices 


-- M�todo minimo --
Debe: calcula el n�mero menor de todos los elementos de la matriz 


-- M�todo maximo --
Debe: calcula el n�mero mayor de todos los elementos de la matriz 



CLASE DISPERSA (HIJA)

M�TODOS

Los m�todos que se han implementado son los siguientes:

-- M�todo initialize --
Asignamos valores a las filas, columnas y argumentos. Es el constructor



-- M�todo calcularFilCol(numElem) --
C�lcula las filas y las columnas.

 
-- M�todo minimo --
Debe: calcula el n�mero menor de todos los elementos de la matriz 


-- M�todo maximo -- 
Debe: calcula el n�mero mayor de todos los elementos de la matriz 


-- M�todo to_s --
Debe: mostrar la matriz


-- M�todo +(other) --
Debe: calcula la suma de dos matrices 


-- M�todo -(other) --
Debe: calcula la resta de dos matrices 


-- M�todo *(other) --
Debe: calcula la multiplicaci�n de dos matrices 


CLASE FRACCI�N

-- M�todo coerce --
Debe: suma un entero con una fracci�n y una fracci�n con un entero y fracci�n con fracci�n.


CLASE MATRIXDSL

Es una clase dise�ada para un lenguaje de dominio espec�fico. Sus m�todos sirven como puente hacia los
 m�todos reales que se encuentran en la clase matriz, tanto matriz densa como matriz dispersa.

�stos act�an de forma que se pueda acceder a los m�todos originales de la clase matriz mediante un lenguaje 
sencillo.

M�todos: 

- operaci�n
- operando
- ejecutar (permite completar la l�nea de c�digo que se evaluar� para llamar a los m�todos originales)


Las consultas a matrices que se quieran realizar se escribiran en el archivo matrices.rb, y para la ejecuci�n 
de dichas consultas se compilar� el archivo m.rb.




