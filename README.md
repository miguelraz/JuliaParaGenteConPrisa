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
6. Genera una matriz de con ~10% de las entradas siendo 0, y el resto siendo un numero flotante entre 0 y 1 de tamanio 1000x1000 - no uses elementos cuyos indices difieran en mas de 10 unidades.
```julia
a = [rand() < 0.001 && abs(i - j) <= 10 ? 1 : 0 for i in 1:1000, j in 1:1000]
```
  1. Cuadrala y toma el tiempo con `@time`.
  2. Conviertela en una matriz `SparseArray` y cuadrala, mide las diferencias de tiempos con `@time`.
  3. Cuantos ordenes de magnitued mas rapido fue uno que el otro?
5. Multiplica `[1,2,3] .* [1 2 3]` y `[1,2,3] .* [1,2,3]`. Por que son distintos? Cuales son los tipos de datos de salida?
  1. Usa `@edit [1,2,3] .* [1,2,3]` y `@edit [1,2,3] .* [1 2 3]` para verificar tus resultados.
6. Que es un `CartesianIndex`? Apoyate en el manual
7. Que es `IndexStyle`?
```
De ahora en adelante queremos usar `eachindex`.
```
8. Como puedes accessar las factorizaciones de una matriz? Cuantas hay en `LinearAlgebra`?
9. Define una matriz de 2x2x2 con los numeros del 1 al 8.
10. Que es un numero de condicion?
  - Investiga el libro de Gilbert Strang de Algebra lineal para ingenieros, pues la rama de `Analisis numerico` y `algebra lineal numerico` es parte de esta disciplina.


## Dia 05
### Plots.jl y DataFrames.jl

#### Choro: Por que vale la pena Julia y no Pandas/R/datatable/clickhouse/Polars
1. Siempre hay un poquito "mas" que investigar/hacer/calcular y ahi se rompe al abstraccion de tus datos. El chiste es que tu herramienta (Ya sea Julia o algo mas) te permite construir eso facilmente y que sea rapido.
  
Arreglos:
```julia
x = [1,2,3]
x[begin] == 1
x[end] == 3
x[3] # x[begin:end -1] es un idioma util
```
1. Descarga `UnicodePlots.jl`. Usa 2 vectores aleatorios de 100 para intentar varias graficas.
2. Descarga `Plots, DataFrames, CSV, FileTrees`. Grafica alguna grafica de que hayas hecho con `UnicodePlots` pero ahora en `Plots`. 
  - Agrega una leyenda
  - cambia los limites
  - agrega un titulo
  - guardalo en formato `.png`.
  - cambia el backend a `plotlyjs` e interactua un rato.
3. Por que preferirias `Makie.jl` en vez de `Plots.jl`?
  - Corre un demo de `Makie` en 3D y juega con los parametros. 
  - Visita la `Makie gallery` y encuentra algo cool.
4. Que es un API? Como lo puedes usar para descargar un CSV?
```
Para nosotros, un API para descargar datos simplemente pide una llamada de funcion con HTTP.jl y permite descargar datos.
Se pueden ver com o
using HTTP
HTTP.get("https://datos.gob.mx/covid/salud/", key = "1234")
# using Downloads

```
**NOTA**: Gran [acordeon de DataFrames.jl](https://www.ahsmart.com/assets/pages/data-wrangling-with-data-frames-jl-cheat-sheet/DataFramesCheatSheet_v0.22_rev1.pdf)
- Interned Strings y `String15`
- Trata de homogeneizar los tipos de datos de tus columnas: si tienes muchos `Union{X,Y,Z,A,B,...}` el compilador de Julia va a sufrir y  ademas va a ser lento el performance en run time.
5. Como puedes cargar un `CSV` en Julia? Intenta con el [ejemplo del INEGI aqui](https://www.inegi.org.mx/sistemas/olap/consulta/general_ver4/MDXQueryDatos.asp?proy=). Un `CSV` es un archivo de valores separados por comas, ie `Comma Separated Values`.
6. Ejemplo `FileTrees.jl` y `Glob.jl`
  - define una funcion para contar todas las palabas separadas por `" "` en una cadena.
  - aplicala a todo un directorio de manera recursiva con `FileTrees.jl`. Que solo cuente las palabras
7. Cuando convienen `DataFrames.jl` y cuando conviene `SQL` (u otro tipo de base de datos) + la "ventaja Karaminski" en Julia.

### OnlineStats.jl
- TODO

-----
## Dia 06
## Paralelismo y Metaprogramacion
#### Repaso:
- Mide antes de optimizar! Leer [este paper de COST](https://www.usenix.org/system/files/conference/hotos15/hotos15-paper-mcsherry.pdf)
> Puedes tener varios cores hasta que demuestres que sabes usar uno solo
- Demo: usando el [profiler de VSCode](https://www.julia-vscode.org/docs/dev/userguide/profiler/)

```julia
# Intenta correr este snippet de codigo dentro de VSCode
function profile_test(n)
    for i = 1:n
        A = randn(100,100,20)
        m = maximum(A)
        Am = mapslices(sum, A; dims=2)
        B = A[:,:,5]
        Bsort = mapslices(sort, B; dims=1)
        b = rand(100)
        C = B.*b
    end
end

# compilacion
@profview profile_test(1)
# runtime puro
@profview profile_test(10)
```
#### Dudas:
- 
#### Propuestas de proyectos finales
- Daniel y INEGI
- Montse y optimizacion
- Jesica y NLP
- Arturo y procesamiento de covid en batch/paralelo

## Paralelismo
**Paralelismo a que nivel**?
  - Inter Word Parallelism, Super Word Parallelism
  ``01 01 01 01 01 01 01 01``
  - Instruction pipelining
  - Hyperthreading
  - Atomics 
  ```
  x = 1
  y = x + 1
  ```
  **NOTA**: *Seguridad*
  - Multicore (usar muchos cores en una sola compu) 
  - GPU/aceleradores (arquitectura heterogenea)
  - Distribuido (muchas compus enchufadas)
  *Cual creen que nos vamos a enfocar*?
- Concurrencia 1:N: 1 trabajador puede 
- Paralelismo y teoria
  - Ejemplo a mano
  - Camino critico
  - Span
  - Paralelismo
    - Cilk, Futhark y multiversiones
  - ["Task parallel, depth first, randomized work stealing scheduler"](https://julialang.org/blog/2019/07/multithreading/)
    - Task parallel: "fork join"
    ```julia
    import Base.Threads.@spawn
    function fib(n::Int)
      if n < 2
          return n
      end
      t = @spawn fib(n - 2)
      return fib(n - 1) + fetch(t)
    end
    ```
    - depth first:
    - randomized work stealing:
    - scheduler:

### Ecosistema de paralelismo:
- `Base.@threads`:
- `ThreadsX.jl`:
- `Folds.jl`:
  - usando y sin usar `Folds.jl`, trata de resolver los siguientes ejercicios en tu equipo:
    1. Genera una cadena de ~ 1M de caracteres aleatoriamente escogidos entre `!@#$` y cuenta cuantos son iguales a `#`.
    2. Encuentra la primera secuencia igual a `!@#$`. Encuentra las entradas de indice igual a `!@#$`
    3. Agrega 1 a un vector de de enteros de tamano 1M, con 20 tamanos logaritmicamente espaciados entre 100 y 1M. Cuando gana la version serial? Cuando la paralela? Que tamanio debe tener el vector para que tu benchmarking deje de ser superlineal?
- Cuando te conviene `pmap` y cuando `@threads`?
- Ver la [siguiente lecture](https://www.youtube.com/watch?v=JCvT9Rnhyvk) y encontrar 3 ejemplos en donde se aplican algoritmos tipo `parallel prefix sum`.

**RESUMEN**: No hay una sola respuesta de como resolver el paralelismo (aun). Esta presentacion del [creador de Futhark](https://www.youtube.com/watch?v=QqOsJ0EwyrYO) es un buen resumen de por que es *tan* dificil hacer bien paralelismo.

- Julia comparte el mismo tipo de tecnologia que `IntelTBB/Cilk` y `Rayon` de Rust con el scheduler, cuando usas `@spawn`
- Julia comparte el mismo tipo de tecnologia (hoy) que `OpenMP` con `Base.@threads`.


## Metaprogramacion
Recuerda que siempre puedes ver [workshops/talleres de Julia](https://www.youtube.com/watch?v=2QLhw6LVaq0) en el canal de YouTube de Julia y leer [la parte del manual que te interesa](https://docs.julialang.org/en/v1/manual/metaprogramming/)
1. Como defines una expresion en Julia? Para que usarias `quote begin ... end`?
2. Define una expresion `x = 1`. Cambia el valor de `1` a `42` accesando la expresion. Evaluala.
3. Que es un macro? Que restricciones tiene? Cuando corre?
4. Que son los macros `_str`? Como usarias uno? Construge una expresion regular, un vector de bites, y una cadena literal con sus macros respectivos (recuerda que puedes usar `?"pancho"` en el prompt para buscar a pancho en los docstrings de Julia)
5. Que es la higiene en los macros?
6. (Dificil, salta esto y regresa al rato) Usa `MacroTools.jl` para definir un ejemplo de arboles de Linden (No olvides usar `Meta.@dump`)
  - Un arbol de linden se ve asi:

7. **Nota**: Nunca usar `Base.@pure`. 
8. Entender que **casi no vale la pena** escribir [macros en Julia general](https://www.youtube.com/watch?v=mSgXWpvQEHE) - usa funciones!
9. **BONUS**: Usa `SnoopCompile.jl` y `Cthulhu.jl` para 
### Macros utiles:

1. Define la siguiente funcion, y corre los siguientes macros:
```julia
f(x) = x^2
```
  - `Meta.@dump f(3)`
    - `Meta.@lower f(3)`
      - `@code_lowered f(3)`
        - `@code_warntype f(3)`
          - `@code_typed f(3)`
            - `@code_llvm f(3)`
              - `@code_native f(3)`
2. Trata de dar ejemplos para usar los siguientes macros
  - `@enter`, de `Debugger.jl`
  - `@which`
  - `@doc`
  - `@elapsed`
  - `@inbounds`
  - `@simd`
  - `@ndefs`
  - `@nloops`
  - `@views`
  - `@.`
  - `@test_broken`






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

TODO: GLOSARIO!
1. Juliaup
2. FileTrees.jl y procesamiento de contar palabras en un directorio
3. VSCode plugin
4. Revise
4. Makie.jl
5. Plots y cambiar de backend
6. Programmacion funcional y benchmarking y 
7. Franklin.jl y blog 
8. Punto2D, tipos parametricos y performance
9. PkgCompiler.jl
10. JET.jl, Aqua.jl
11. ThreadsX.jl y Folds.jl
12. CUDA.jl y 
13. Matriz de Strang, algebra lineal numerica
14. sparse arrays y multiplicacion de ellos
