# JuliaParaGenteConPrisa



## Dia 01

- TODO

## Dia 02
### Cadenas y cuentas
----
1. Haz una cadena de `a` repetida 100 veces.
```julia
"a"^100
```
2. Construye un vector de 100 `a`s. Considera usar una `comprehension`.
```julia
['a' for i in 1:100] == fill('a', 100)
```
Una matriz se puede hacer
```julia
[1 for i in 1:3, j in 1:3]
```
3. Cuanto es `2^100`? 
```julia
big(2)^100
```
Nota: No usen `Floats` para guardar monedas, usen punto fijo como [`DecFP.jl`](https://github.com/JuliaMath/DecFP.jl)
4. Crea una cadena de la `'a'` a la `'z'`.
```julia
'a':'z'
    |> collect
    |> join
```
5. Intenta sumar `"a" + "b"` y `'a' + 'b'`. Ahora intenta restar `'A' - '0'`. Intenta multiplicar cadenas. Que sale?
Nota.Cuidado con el `type piracy` - definir funciones o metodos sobre tipos que no definieron ustedes. Esto en general es muy mal visto; evitar.
```julia
'a' - '0' # Espacio afin, como las horas
```
6. Cual es el `Int64` mas grande? El `Int32`? Y todos los Ints nativos?
```julia
typemax(Int64) == 9223372036854775807
```
7. Cual es el `Float32` mas pequeno? Cual es la division mas pequena entre `Float32`?
8. Como obtienes un `Inf`? Cuantos hay? Cuantos `0`s hay?
```julia
1/0 # -1/0
-0.0 === 0.0
```
9.  Haz un arreglo con todos los numeros pares del 1 al 100.
```julia
2:2:100 |> collect
[i for i in 1:100 if iseven(i)]
```
10. Haz un arreglo con todos los impares del 1 al 100.
```julia
[1:2:100...]
```
11. Haz un arreglo con todos los numeros cuadrados del 1 al 100 (incluyendo 100)
Nota: Definimos funciones en Julia de al menos 3 maneras:
```julia
# La definicion en bloque
function nombre(param1, param2)
    if param1 < 3
        return param1 + param2
    end
    param2
end

# La definicion "inline"
nombre(param1, param2) = param1 + param2

# definicion anonima
function (param1, param2)
    param1 + param2
end

# Otra funcion anonima
x -> x + 1

# funcion parcial 
# ==(3)
issquare(n) = isinteger(sqrt(n))
[i for i in 1:100 if issquare(i)]
(1:10) .^ 2
```
1.  Haz una matriz de 10x10 de solo booleanos.
```julia
rand(Bool, 10, 10)
```
2. Haz un vector de 10 flotantes entre  0 y 1 aleatorios
```julia
[rand() for i in 1:10]
```

### Funciones
----
1. Define una funcion para:
   1. sumar 1
   ```julia
   sq = (1:10) .^ 2
    f(x) = x + 1
    f.(sq)
   ```
   2. sumar todos los numeros del 1 al 100
   ```julia
    function cien()
        cuenta = 0 
        for i in 1:100
            cuenta += i
        end
        cuenta
    end
   ```
   3. sumar todos los pares del 1 al 100
   ```julia
    sum(2:2:100)
   ```
   4. sumar todos los impares del 1 al 100
   ```julia
    sum(1:2:99)
   ```
   5. Imprimr `"Cadena"` si le dan una cadena y `"Numero"` si le dan un numero
   ```julia
    function g(x)
        if isa(x, Number)
            println("Número")
        elseif isa(x, String)
            println("Cadena")
        end
    end
    # Operador ternario "?"
    # condicional ? caso1 : caso2
    g(x) = isa(x, Number) ? println("num") : println("cadena")
   ```
   6. Aplica la funcion de `sumar 1` a un arreglo.
   ```julia
   f.(x)
   map(x -> x + 1, 1:100)
   # Los impares
   filter(isodd, 1:100)
   # lo mismo que una suma, pero el paralelo
   reduce(+, 1:100)
    ```
    Nota: Esto se conoce como "Higer order functions" - funciones que aceptan funciones. Son MUY utiles, y vale la pena conocer: `map`, `filter`, `reduce`, `findfirst`, `count`, `foldr`
   7. Encontrar el primer numero divisible entre 7 despues entre el 503 y el 520.
   ```julia
   findfirst(n -> n % 7 == 0, 503:520)
   8. Encuentra el primer indice del numero igual a 42 en un arreglo de numeros aleatorios de tamanio 1M si todos estan entre el 1 y el 100.
   ```julia
    findfirst(==(42), rand(1:100, 1_000_000))
   ```
   9.  Que hacen las funcioens `any`, `all`? Como las puedes combinar con un generador? Y con tests?
   ```julia
    any(i for i in (true, true, false))
    @test all(iseven, sq)
   ```
   10. Que es `infix`? Que es `prefix`? Como puedes definir una funcion parcial prefix que revise si algo es `"igual a 3"`.
   Infix es como `3 + 2`
   prefix es como `+(3, 2)
   11. Contar el numero de `#` en la siguiente cadena: (define una funcion e ignora las comillas)
    > "?#?##?#?#???####??##?#??#?#?#?###??#?##??#?##??##?#?#???###??#???#??####??##?##???##?#??#?##????##?#"
    ```julia
    count('#', str)
    count(str .== '#')
    ```
    Nota: No hay `NULL` como en R de Julia.
   12. Calcular la distancia de Hamming 
       1.  La distancia de Hamming es la cuenta de cuantos caracteres difieron entre una cadena y otra (asumiendo que tienen la misma cantidad de caracteres): `AAABBB` y `AAACCC` tienen una distancia de Hamming de `3`.
   ``julia
   function hamming(a, b)
        cuenta = 0
        for i in 1:length(a)
            if a[i] != b[i]
                cuenta = cuenta + 1
            end
        end
        cuenta
    end

   ```

## Dia 03
----
Temario:
- `lstopo` y latencia
- Instalacion de VSCode y el plugin
- Structs y parametricos
- Vectores, Algebra lineal, Principio de optimizaciones
- Instalacion [via juliaup](https://github.com/JuliaLang/juliaup) - USEN ESTO!!! 

### Optimizaciones basicas

```julia
function dead() # Dead code optimization
  #x = 1 # NO LO NECESITO
  #x = 2 # TAMPOCO 
  x = 3
  y = 1
  x + y # Register allocation/saving
end
```

```julia
# Loop Invariant Code Motion -> "saca" una operacion del Loop
function licm(vector, n) # v = [1,2,3], n = 3
  avg = 0
  for i in vector
    avg += i
  end
  avg/n
end
```

```julia
function branch(x) # branch elision / Branch compaction
  if x < 5 
    if x < 10
      return true
    end
  end
end
```


#### Structs
-----
1. Define un struct para un punto en 3D, con un campo por coordenada.
    Hint: Se va a ver algo como 
    ```
    struct Point3D 
        ... 
    end
    ```
   Usas `Int`s o `Float`s? Escoge cualquiera de los dos por ahora.
2. Define una funcion que calcule la norma del `Punto3D`.
3. Define una funcion para sumar `Punto3D`s.
4. Define una funcion para restar `Punto3D`s.
5. Define una funcion que cree un Punto en 3D de una tupla, y una de 3 numeros sueltos.
6. Ahora define un Punto en `Int`s o `Float`s, el que no hayas usado.
7. Define una funcion que pueda sumar ambos tipos de `Punto3D`.
8. Escribe una suite de tests para verificar la funcionalidad de tu paquete

#### Paquetes y estructura de software
----
1. Instala `PkgTemplates.jl` con `]add PkgTemplates` (o bien `using Pkg; Pkg.add("PkgTemplates.jl")`). Busca en la documentacion como hacer un nuevo paquete. (Esto puede tardar un rato si no tienes perfil de `git`. Si no es asi, usa `Pkg.generate("Punto3D")`, y genera un `test/runtests.jl` a manita.)
2. Genera un nuevo paquete para `Punto3D` y mete los tests que escribiste anteriormente en `tests/runtests.jl`
3. Exporta tus funciones para hacer un `Punto3D`. 
4. Activa un ambiente para `"Punto3D"` con `]activate` - tu consola deberia verse azul y cambiar de nombre a `"Punto3D>"`. Agrega el paquete de `StaticArrays` dentro de este ambiente. Si lo has hecho correctamente, deberias ver que `]st` incluye a `StaticArrays` en el output.
5. Agrega funcionalidad a `Punto3D` para que acepte `StaticArrays` y tests.
6. Benchmarkea la diferencia con `BenchmarkTools.jl`.

### Dia 04
----
Repaso
1. Que es la `estabilidad de tipos`? Por que es importante? Intenta evaluar `sqrt(-9)` y explicar por que no da un `Complex64`.
```
La estabilidad de tipos permite que Julia entienda la entrada y salida de tipos de datos y especialize el codigo de tu funcion con base en ello.

`sqrt(-9)` romperia esa estabilidad si se permitiera en regresar `Float64` en algunos inputs y `Complex64` en otros.
```
2. Intenta definir
  1. un `struct` de `Punto3D` con 3 campos `x,y,z`.
  2. Define `Base.:+(p1::Punto3D, p2::Punto3D)` coordenada a coordenada.
  3. Ahora define una funcion que sume un arreglo:
    ```julia
    function suma(v::Vector{Punto3D})
      res = 0
      for i in v
        res += i
      end
      res
    #...
    end
    ```
    Intenta usar sumar el siguiente arreglo con tu funcion:
    ```julia
    v = [Punto3D(1,1,1) for i in 1:1_000_000]
    ```
  4. Ahora intenta hacer que `Punto3D` funcione para cualquier `Int` y `Float64` nativo. Llamalo `P3D{T}`.
  5. Inspecciona los tipos y ensamblador de `Punto3D` vs una version que no tengan tipos los `x,y,z`.
    1. Recuerda que `@code_warntype` te alerta si Julia no puede inferir (deducir) el tipo de datos que sale de tu funcion. Si falla, intenta usar `Cthulhu.jl`.
    2. `@code_llvm misuma(v)` va a decir cosas interesantes - que relaciones vez con `@code_native misuma(v)` y `@btime` de `BenchmarkTools.jl` cuando no usas tipos en los campos de `x,y,z` vs cuando si? Y cuando los parametrizas?
  6. Bonus: Intenta usar `StructArrays`.

### Matrices y algebra lineal
3. La matriz de Strang se de fine como una matriz cuadrada que tiene un `2` en la diagonal, `-1`, en las diagonales no centradas (off-diagonal) y 0 en todos los demas lugares
  1. define una funcion para crear una matriz de Strang para un tamano `n`.
  ```
   2  -1  0
  -1   2 -1
   0  -1  2
   ```

   *Solucion primera*:
   ```julia-repl
        function strang(n)
           mat = [0 for i in 1:n, j in 1:n]
           for i in 1:n
               for j in 1:n
                   if i == j
                       mat[i, j] = 2
                   end
               end
           end
           for i in 1:n
               for j in 1:n
                   if abs(i - j) == 1
                       mat[i, j] = -1
                   end
               end
           end
           mat
       end
   ```
  2. Ahora hazla generica usando las funciones `zeros`, `one`. BONUS: Puedes definirla en una sola linea `?` ? :D
4. Define una funcion `suertuda(T, n)` donde `T` sea un tipo de dato numerico y `n` sea el tamano cuadrado de la matriz, y todas las entradas valgan `7` en ese tipo numerico.
5. Convierte la Matriz de Strang en una matriz `TriDiagonal`.
6. Genera una matriz de con ~10% de las entradas siendo 0, y el resto siendo un numero flotante entre 0 y 1 de tamanio 1000x1000.
  1. Encuentra sus eigenvalores
  2. Conviertela en una matriz `Sparse` y encuentra sus eigenvalores otra vez.
5. Multiplica `[1,2,3] .* [1 2 3]` y `[1,2,3] .* [1,2,3]`. Por que son distintos? Cuales son los tipos de datos de salida?
  1. Usa `@edit [1,2,3] .* [1,2,3]` y `@edit [1,2,3] .* [1 2 3]` para verificar tus resultados.
6. Que es un `CartesianIndex`? Apoyate en el manual
7. Que es `IndexStyle`?
8. Como puedes accessar las factorizaciones de una matriz? Cuantas hay en `LinearAlgebra`?
9. Define una matriz de 2x2x2 con los numeros del 1 al 8.
10. Que es un numero de condicion?
  - Investiga el libro de Gilbert Strang de Algebra lineal para ingenieros, pues la rama de `Analisis numerico` y `algebra lineal numerico` es parte de esta disciplina.

### Plots.jl y DataFrames.jl
  
1. Descarga `UnicodePlots.jl`. Usa 2 vectores aleatorios 








### Ultimo ejemplo del dia 2
```julia-repl
julia> str1 = rand('a':'b', 1_000_000)
1000000-element Vector{Char}:
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 ⋮
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)

julia> str1 = rand('a':'b', 1_000_000) }
ERROR: syntax: extra token "}" after end of expression
Stacktrace:
 [1] top-level scope
   @ none:1

julia> str1 = rand('a':'b', 1_000_000) |> collect
1000000-element Vector{Char}:
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 ⋮
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
julia> function hamming(a, b)
           cuenta = 0
           for i in 1:length(a)
               if a[i] != b[i]
                   cuenta = cuenta + 1
               end
           end
           cuenta
       end
hamming (generic function with 1 method)

julia> @time hamming(str1, str2)
  0.017782 seconds (19.54 k allocations: 1.074 MiB, 80.88% compilation time)
500206

julia> @time hamming(str1, str2)
  0.006020 seconds (1 allocation: 16 bytes)
500206

julia> function hamming(a, b)
           cuenta = 0
           for i in 1:length(a)
               if a[i] != b[i]
                   cuenta += 1
               end
           end
           cuenta
       end
hamming (generic function with 1 method)

julia> @time hamming(str1, str2)
  0.024201 seconds (19.54 k allocations: 1.074 MiB, 82.83% compilation time)
500206

julia> @time hamming(str1, str2)
  0.005971 seconds (1 allocation: 16 bytes)
500206

julia> function hamming(a, b)
           cuenta = 0
           for i in 1:length(a)
               cuenta += a[i] != b[i]
           end
           cuenta
       end
hamming (generic function with 1 method)

julia> @time hamming(str1, str2)
  0.025691 seconds (20.98 k allocations: 1.147 MiB, 80.71% compilation time)
500206

julia> @time hamming(str1, str2)
  0.005501 seconds (1 allocation: 16 bytes)
500206

julia> function hamming(a, b)
           cuenta = 0
           for i in 1:length(a)
               cuenta += a[i] != b[i]
           end
           cuenta
       end
hamming (generic function with 1 method)

julia> hamming(a, b) = sum(a[i] != b[i] for i in 1:length(a))
hamming (generic function with 1 method)

julia> @time hamming(str1, str2)
  0.067357 seconds (140.48 k allocations: 7.673 MiB, 83.16% compilation time)
500206

julia> @time hamming(str1, str2)
  0.018335 seconds (1 allocation: 16 bytes)
500206

julia> hamming(a, b) = sum(((x,y),) -> x != y, zip(a, b))
hamming (generic function with 1 method)

julia> @time hamming(str1, str2)
  0.123288 seconds (345.78 k allocations: 18.346 MiB, 32.82% gc time, 97.97% compilation time)
500206

julia> @time hamming(str1, str2)
  0.005333 seconds (1 allocation: 16 bytes)
500206

julia> hamming(a, b) = mapreduce(!=, +, a, b)
hamming (generic function with 1 method)

julia> @time hamming(str1, str2)
  0.048103 seconds (70.13 k allocations: 3.883 MiB, 93.99% compilation time)
500206
```