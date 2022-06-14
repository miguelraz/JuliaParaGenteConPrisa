# JuliaParaGenteConPrisa



### Dia 01

- TODO

### Dia 02
#### Ejercicios
##### Cadenas y cuentas
1. Haz una cadena de `a` repetida 100 veces.
2. Construye un vector de 100 `a`s
3. Cuanto es `2^100`? 
4. Crea una cadena de la `'a'` a la `'z'`.
5. Intenta sumar `"a" + "b"` y `'a' + 'b'`. Ahora intenta restar `'A' - '0'`. 
6. Cual es el `Int64` mas grande? El `Int32`? Y todos los Ints nativos?
7. Cual es el `Float32` mas pequeno? Cual es la division mas pequena entre `Float32`?
8. Como obtienes un `Inf`? Cuantos hay?
9. Haz un arreglo con todos los numeros pares del 1 al 100.
10. Haz un arreglo con todos los impares del 1 al 100.
11. Haz un arreglo con todos los numeros cuadrados del 1 al 100 (incluyendo 100)
12. Haz una matriz de 10x10 de solo booleanos.

##### Funcioens
1. Define una funcion para:
   1. sumar 1
   2. sumar todos los numeros del 1 al 100
   3. sumar todos los pares del 1 al 100
   4. sumar todos los impares del 1 al 100
   5. Imprimr `"Cadena"` si le dan una cadena y `"Numero"` si le dan un numero
   6. Aplica la funcion de `sumar 1` a un arreglo.
   7. Encontrar el primer numero par de un arreglo.
   8. Encuentra el primer numero mayor a 42 en un arreglo de enteros aleatorios.
   9. Que hacen las funcioens `any`, `all`? Como las puedes combinar con un generador? Y con tests?
   10. Que es `infix`? Que es `prefix`? Como puedes definir una funcion parcial prefix que revise si algo es `"igual a 3"`.
   11. Contar el numero de `#` en la siguiente cadena: (define una funcion e ignora las comillas)
    > "?#?##?#?#???####??##?#??#?#?#?###??#?##??#?##??##?#?#???###??#???#??####??##?##???##?#??#?##????##?#"
   12. Calcular la distancia de Hamming 
       1.  La distancia de Hamming es la cuenta de cuantos caracteres difieron entre una cadena y otra (asumiendo que tienen la misma cantidad de caracteres): `AAABBB` y `AAACCC` tienen una distancia de Hamming de `3`.

#### Structs
1. Define un struct para un punto en 3D, con un campo por coordenada.
    Hint: Se va a ver algo como 
    ```
    struct Point3D 
        ... 
    end
    ```.
   1. Usas `Int`s o `Float`s? Escoge cualquiera de los dos por ahora.
2. Define una funcion que calcule la norma del `Punto3D`.
3. Define una funcion para sumar `Punto3D`s.
4. Define una funcion para restar `Punto3D`s.
5. Define una funcion que cree un Punto en 3D de una tupla, y una de 3 numeros sueltos.
6. Ahora define un Punto en `Int`s o `Float`s, el que no hayas usado.
7. Define una funcion que pueda sumar ambos tipos de `Punto3D`.
8. Escribe una suite de tests para verificar la funcionalidad de tu paquete

#### Paquetes
1. Instala `PkgTemplates.jl` con `]add PkgTemplates` (o bien `using Pkg; Pkg.add("PkgTemplates.jl")`). Busca en la documentacion como hacer un nuevo paquete. (Esto puede tardar un rato si no tienes perfil de `git`. Si no es asi, usa `Pkg.generate("Punto3D")`, y genera un `test/runtests.jl` a manita.)
2. Genera un nuevo paquete para `Punto3D` y mete los tests que escribiste anteriormente en `tests/runtests.jl`
3. Exporta tus funciones para hacer un `Punto3D`. 
4. Activa un ambiente para `"Punto3D"` con `]activate` - tu consola deberia verse azul y cambiar de nombre a `"Punto3D>"`. Agrega el paquete de `StaticArrays` dentro de este ambiente. Si lo has hecho correctamente, deberias ver que `]st` incluye a `StaticArrays` en el output.
5. Agrega funcionalidad a `Punto3D` para que acepte `StaticArrays` y tests.
6. Benchmarkea la diferencia con `BenchmarkTools.jl`.






