### A Pluto.jl notebook ###
# v0.19.8

using Markdown
using InteractiveUtils

# ╔═╡ 450744e4-82b6-11eb-3469-035abde38d6e
let 
	using Pkg
	Pkg.add("PlutoUI")
	using PlutoUI
end;

# ╔═╡ 5911a928-82b3-11eb-1dfe-d3907c686554
let 
	md"""
	# Julia Para gente con prisa - IIMAS 2022
	## Una breve exposición de pícaros por qués para considerar si Julia puede ser bueno para tí
	por Miguel Raz Guzmán (@miguelraz)
	
	"""
end

# ╔═╡ 13f6a24e-82d6-11eb-2ec3-b5deeb992705
md""" ## Julia ... sí de Ju + Py + R => JuPyteR o.0"""

# ╔═╡ c0421740-82b3-11eb-1d7f-33ea8a12c6e6
md"""
Julia tiene muchas cosas que ya conocen:
- dinámico, pero ~tan rápido como C
- basado en el paradigma de despacho múltiple (cercano a OOP)
- altamente interactivo
- manejo de memoria automatizado (tiene un GC)
- homoicónico => metaprogramación
- Empezó por hartazgo a MATLAB y otros, pero ha robado lo bueno de los demás
- código libre, todo el desarrollo pasa ahorita en GitHub
- disponible aquí [para descargar (usen 1.6!)](https://julialang.org/downloads/)
- joven (circa 2012ish, v1.0 en 2018)
- tiene un manejador de paquetes muuuuy pulido (estilo cargo!)
- te encantan los REPLs e iterar tus diseños rápidamente
- test driven development (TDD) incluido con la paquetería base
- Código de Conducta [internacionalmente reconocido](https://julialang.org/community/standards/) para evitar 🐻
"""

# ╔═╡ cdf1284e-82b4-11eb-1db9-a3e460250262
🌐 = "Hola IIMAS! 👋"

# ╔═╡ 4dbebf16-82b8-11eb-0e2a-9feb8c17dbc2
md"""
Esta plática con suerte y te va a gustar si
- te gusta la programación funcional estilo Lisp pero no la lentitud 💩
- te encanta prototipar en Python pero deploy en C++ 🙎
- te gusta el sentimiento de "empoderamiento" que te da el mundo de Rust
- estás buscando dejar todos los dolores de cabeza de `pip install ya-mátame`
- quieres la estadística fácil de R pero da mucho meyo meterse a los lares del compilador
- si quieres que tus loops no sean lentísimos 🐢
"""

# ╔═╡ a365c62a-0f71-4c6a-911f-b6ad1dc1039a
md""" # TEMARIO: HOY
1. Todxs se presentan en el chat
2. Todxs confirma que tienen Julia instalado
3. Empezamos a trabajar ejercicios
4. Llenar encuesta de habilidades

# Expectativas y Filosofía del curso
1. Vamos a ser ambiciosos - desde prepa hasta doctorado
2. No nos sirve la humillación - cualquier duda se resuelva
3. "Flipped Classroom" - yo hablo poco, ustedes programan mucho. Manos en la masa!
4. Proyecto final - código corriendo
5. PREGUNTEN TOOOOOODO

"""

# ╔═╡ e487276c-3a51-4845-bace-302c6fff5bd8
if 2 < 3
	print("menor")
end

# ╔═╡ c0952edc-a04c-47f2-af0c-d7f6585ecff5
if 2 < 3 < 4 
	print("Holi")
end

# ╔═╡ c4f5a0cf-71ef-462c-abd0-761b37da48be
if 3 < 4 && 7 < 3
	print("menores")
end

# ╔═╡ 7060b8ba-82b5-11eb-3e85-1b2eb7e3b031
xs = 1:100

# ╔═╡ 18c3dbe6-82b5-11eb-3f64-33b5582fd811
α₁ = [i for i in 1:10 if i % 2 == 0] # Haskell y Python, alguien?

# ╔═╡ 45a513ec-82e4-11eb-2a8f-cd805392ce7e
β = 3

# ╔═╡ 8430d38a-82b4-11eb-3bc0-153e4716a176
md"""
Esta plática es para contar
- las ventajas de Julia
- las desventajas de Julia
- en qué es muy, muy útil
- para qué no lo es tanto

No vengo a evangelizar o a decir que deberían usar Julia, o que Julia es la respuesta a todo. El chiste es exponer las razones por las cuáles vale la pena considerar a Julia como una alternativa a su workflow si viven con el problema de los 2 lenguajes.
"""

# ╔═╡ 5707bffa-82b3-11eb-384c-bbe6615c5db4
md"""
# ¿Cuál es el problema de los 2 lenguajes?
Es un problema muy conocido por cualquier que hace bastante cómputo interactivo y de producción.

[Tienes 1 lenguaje](https://www.quora.com/What-is-the-2-language-problem-in-data-science?share=1) para prototipar (digamos Python, un lenguaje dinámico) usado por un grupo de gente (tus data scientists) y 1 lenguaje para producción (digamos C++, compilado) que usan tus devs de backend.

Todos son felices hasta que un día los requisitos cambian y tu separación de problemas ya no es tan fácil y un grupo tiene que hablar con el otro y acabas reimplementando todo porque tu código no es componible. Aunado a eso, hay una separacíon de tus equipos, pues ni siquiera hablan el mismo lenguaje por las distintas restricciones.

"""

# ╔═╡ 2443fc60-82b7-11eb-060a-911942b7efa1
md"""
### Ok, y si me quiero unir al culto de Julia? ¿Reescribo todo o qué?

¡No es necesario! [La interoperabilidad es lo de hoy, no](https://www.youtube.com/watch?v=PsjANO10KgM) hay porque dejar de usar herramientas o lenguajes que ya sirven.

### Demo interop
"""

# ╔═╡ 249e5cc6-82be-11eb-328f-c3674d356706
md"""
### ¡Oh wow! ¡Esa terminal de Julia se ve súper chula!

Clarín clarinetes, por eso mismo hice un tutorial para aprender todos los truquitos. La [liga aquí merito](https://www.youtube.com/watch?v=EkgCENBFrAY)
"""

# ╔═╡ 33b0ba3c-82ba-11eb-1b91-3d50bde8dd8b
md"""
### ¿Cómo es distinto Julia?

"Métele Numpy y ya - no veo el gran problema..."

1. Pierdes algoritmos genéricos
2. Si no juegas dentro del arenero de Numpy, dios te ampare
3. Otra vez tienes la división entre los magos que saben las entrañas de C de Numpy y los usarios...

Julia es distinto porque
1. Usa un JIT para optimizar el código en run-time
2. usa un algoritmo de subtipado para saber los tipos de los argumentos
3. cachear los resultados para generar código óptimo la primera vez

### Demo

1. Primera vez es lento,
2. Segunda vez ⏩
"""

# ╔═╡ e7d1f850-82c4-11eb-1c11-0988b6036194
begin
			# Esto ya no es Python..
		
		abstract type AmfibioAbstracto end
		
		struct Sapo <: AmfibioAbstracto
		end
		
		struct Rana <: AmfibioAbstracto
		end
		
		pedrada(::AmfibioAbstracto) = "Ouch"
		
		canta(x::Sapo) = "Ribbit"
		canta(x::Rana) = "Burp"
	
end

# ╔═╡ 840ba852-82e7-11eb-38b6-13b9580b3210
rana = Rana()

# ╔═╡ 8c4dd4b8-82e7-11eb-25d4-ad28ca385ace
sapo = Sapo()

# ╔═╡ 8f4d3514-82e7-11eb-2f75-41530c333b0c
pedrada(rana)

# ╔═╡ 92481f72-82e7-11eb-2f60-4fa184c51455
pedrada(sapo)

# ╔═╡ b05fb66e-82e7-11eb-1d36-079761438a04


# ╔═╡ 38b69be0-82c5-11eb-3fe6-159549c2b7a7
md"""
Aquí es donde yo digo que Julia es capaz de resolver el [problema de expresión](https://en.wikipedia.org/wiki/Expression_problem):

> The expression problem is a new name for an old problem.[2][3] The goal is to define a datatype by cases, where one can add new cases to the datatype and new functions over the datatype, without recompiling existing code, and while retaining static type safety (e.g., no casts).

Como se cubre súper bien en [esta plática de Stefan Karpinski, co-creador de Julia)](https://www.youtube.com/watch?v=kc9HwsxE1OY&t=346s)
1. En los lenguajes OOP, es fácil agregar nuevos tipos/clases a los que les aplican operadores ya existentes, pero difícil definier nuevas operaciones a tipos ya existentes
2. En los lenguajes funcionales, es fácil definir nueavas operaciones a tipos ya existentes, pero difícil definir nuevos tipos a los que les apliquen métodos ya existentes.

"""

# ╔═╡ 14bb06b6-82c5-11eb-0f53-d725b13ad820
# Sin embargo en Julia puedo hacer esto
struct Renacuajo <: AmfibioAbstracto # Esto cuesta en C++ 
end

# ╔═╡ 0b4c3804-82c5-11eb-2c15-efbe121fc15a
canta(x::Renacuajo) = "Mimimimimi" # Esto cuesta en Lisp/Haskell

# ╔═╡ 96784a68-82e7-11eb-1287-576d16b15f55
canta(sapo)

# ╔═╡ ac300f8a-82e7-11eb-082c-2b9d7c94fc9d
canta(rana)

# ╔═╡ 3df5b43e-82c6-11eb-2d67-9772873da8b7
a = canta(Sapo())

# ╔═╡ 746e58f2-82c6-11eb-36a9-ab54ff3bb6ad
b = canta(Rana())

# ╔═╡ 66752c9e-82c6-11eb-118a-b18a4e2be4ed
c = canta(Renacuajo())

# ╔═╡ 58bedae6-82c6-11eb-1223-49c7c07902bb
# Pero ya tengo esto de a gratis, pues Renacuajo <: Amfibio
pedrada(Renacuajo())

# ╔═╡ b116f6ba-82c6-11eb-1b55-a1f5086601db
md"""
### En Julia no existen los problemas de identidad, o de Rectángulo/Cuadrado, porque los operadores no le pertenecen a nadie

`3.foo(2) vs foo(x::Rana, y::Sapo) = ...`

N.B: Julia no fue el primer lenguaje en tener despacho múltiple. Viene desde Lisp en los 80s, y Dylan lo implementó, pero no de una manera fácil, reusable, y rápida para que se adoptara en todo su ecosistema. Es difícil pensarlo sin JITs, que son algo recientes.

### ¡Esto no es nuevo! Pero sí choca con OOP...

1. 1/2 + 1/2
2. .5 + .5 
3. .5 + 1/2


"""

# ╔═╡ 3f9d2318-8395-11eb-18ae-614afc30cbc2


# ╔═╡ f73311d8-82c6-11eb-3701-67d48aabcff1
+(x::Rana, y::Sapo) = "lol"

# ╔═╡ e498da6a-82b4-11eb-0dae-b1cbd0dd8f62
function misuma(xs)
	res = 0
	for i in xs
		res += i
	end
	res
end

# ╔═╡ 0bab24a0-82b5-11eb-2daa-933a486b222b
misuma(xs)

# ╔═╡ 5ae2e7da-82b8-11eb-0ba1-cb74f9671ce5
# pueden sacar el ensamblador en Python? 👓
with_terminal() do
	@code_native debuginfo=:none misuma(xs)
end

# ╔═╡ 2c08794c-8395-11eb-1040-3965833051cb
1//2 + 1//2

# ╔═╡ 38f049fa-8395-11eb-2bb4-8151f1237c63
.5 + .5

# ╔═╡ 3d53aa1e-8395-11eb-18e5-afebe4d61494
.5 + 1//2

# ╔═╡ 2b5963fe-82c7-11eb-0a1f-5fc9a3782689
x = Rana()

# ╔═╡ 7ce4159e-82d5-11eb-1661-91455b4d87e0
y = Sapo()

# ╔═╡ 7f240508-82d5-11eb-1573-070508720cc9
x + y

# ╔═╡ c3d9ebee-82d6-11eb-263d-61a869d15395
f(x) = x^2

# ╔═╡ cb407952-82d6-11eb-32e5-3d8801b063d1
map(f, ["a", 1, 3.0])

# ╔═╡ d83b1872-82d6-11eb-07c0-2ba4eef03349
findfirst(<(0), [1, 2, 3, 4, -5, -8])

# ╔═╡ bd800c62-82d4-11eb-03ba-b3c725ee40f2
md"""

### Entonces, ¿dónde NO vale la pena Julia?

HOY:
1. Hard real time - puedes apagar el GC para ciertas actividades, pero si eres hiper-sensible a microlatencias probablemente no es lo mejor.
2. Sistemas embebidos - es posible apagar el JIT, pero no ha sido el enfoque de la comunidad
3. Quieres poder copy/pastear décadas de resultados en Stack Overflow y que todo funcione "out of the box". Julia tiene muchas veces mejores herramientas que otros ecosistemas, pero hay que familiarizarse eso no es opción para todo.
4. Microservicios - empezar y apagar Julia puede doler si no conoces el sistema. Pensar que es "otro Python/R" te va a doler, y hay que invertir algo de tiempo en saber la interacción del JIT y el subtipado.
"""

# ╔═╡ 03e13754-82bb-11eb-1687-97c14468eca7
md"""

### ¿Dónde vale la pena clavarse más?

0. Leer el manual, y de perdis los ["Performance Tips"](https://docs.julialang.org/en/v1/manual/performance-tips/)
1. [Checa la liga en julialang.org/learning](https://julialang.org/learning/)
2. ☎ con gente en el [Slack/Zulip]()
3. ¿🎥 Videos? [las charlas de JuliaCon en Youtube son lo mejor](https://www.youtube.com/watch?v=kc9HwsxE1OY&t=346s)
4. ¿📚 Cursos universitarios? [Computational Thinking de MIT](https://www.youtube.com/watch?v=vxjRWtWoD_w&list=PLP8iPy9hna6Q2Kr16aWPOKE0dz9OnsnIJ)
5. ¿Y en español para la 🎺 🎷 🎸? [El libro de "Intro A Julia"](https://introajulia.org/) empieza desde 0
6. Dudas en [Discourse](https://discourse.julialang.org/) para discusiones más a gusto (porque luego Stack Overflow es muy escueto)
"""

# ╔═╡ 3666e6d2-82bc-11eb-327c-b9d1392f639d
md"""

Sobra, pero sobra...

0. Despacho múltiple
1. Paralelismo estilo fork-join
2. GPUs, TPUs, Deep Learning
3. Manejo de paquetes
4. Deploys con BinaryBuilder
5. Optimización
6. Técnicas del Garbage Collector

Y falta el ecosistema de DifferentialEquations.jl, LightGraphs.jl, JuMP.jl...

"""

# ╔═╡ 60f20f22-b108-4d53-896e-7f4ecbcef53d
zz = 1

# ╔═╡ 6828fcd7-0553-4c17-a134-79d6ef98e195
if (zz += 1) > 2
	print("mayor")
end
	

# ╔═╡ Cell order:
# ╠═450744e4-82b6-11eb-3469-035abde38d6e
# ╟─5911a928-82b3-11eb-1dfe-d3907c686554
# ╟─13f6a24e-82d6-11eb-2ec3-b5deeb992705
# ╟─c0421740-82b3-11eb-1d7f-33ea8a12c6e6
# ╠═cdf1284e-82b4-11eb-1db9-a3e460250262
# ╠═e498da6a-82b4-11eb-0dae-b1cbd0dd8f62
# ╟─4dbebf16-82b8-11eb-0e2a-9feb8c17dbc2
# ╟─a365c62a-0f71-4c6a-911f-b6ad1dc1039a
# ╠═e487276c-3a51-4845-bace-302c6fff5bd8
# ╠═c0952edc-a04c-47f2-af0c-d7f6585ecff5
# ╠═60f20f22-b108-4d53-896e-7f4ecbcef53d
# ╠═6828fcd7-0553-4c17-a134-79d6ef98e195
# ╠═c4f5a0cf-71ef-462c-abd0-761b37da48be
# ╠═7060b8ba-82b5-11eb-3e85-1b2eb7e3b031
# ╠═0bab24a0-82b5-11eb-2daa-933a486b222b
# ╠═18c3dbe6-82b5-11eb-3f64-33b5582fd811
# ╠═45a513ec-82e4-11eb-2a8f-cd805392ce7e
# ╠═5ae2e7da-82b8-11eb-0ba1-cb74f9671ce5
# ╟─8430d38a-82b4-11eb-3bc0-153e4716a176
# ╟─5707bffa-82b3-11eb-384c-bbe6615c5db4
# ╟─2443fc60-82b7-11eb-060a-911942b7efa1
# ╟─249e5cc6-82be-11eb-328f-c3674d356706
# ╟─33b0ba3c-82ba-11eb-1b91-3d50bde8dd8b
# ╠═e7d1f850-82c4-11eb-1c11-0988b6036194
# ╠═840ba852-82e7-11eb-38b6-13b9580b3210
# ╠═8c4dd4b8-82e7-11eb-25d4-ad28ca385ace
# ╠═8f4d3514-82e7-11eb-2f75-41530c333b0c
# ╠═92481f72-82e7-11eb-2f60-4fa184c51455
# ╠═96784a68-82e7-11eb-1287-576d16b15f55
# ╠═ac300f8a-82e7-11eb-082c-2b9d7c94fc9d
# ╠═b05fb66e-82e7-11eb-1d36-079761438a04
# ╟─38b69be0-82c5-11eb-3fe6-159549c2b7a7
# ╠═14bb06b6-82c5-11eb-0f53-d725b13ad820
# ╠═0b4c3804-82c5-11eb-2c15-efbe121fc15a
# ╠═3df5b43e-82c6-11eb-2d67-9772873da8b7
# ╠═746e58f2-82c6-11eb-36a9-ab54ff3bb6ad
# ╠═66752c9e-82c6-11eb-118a-b18a4e2be4ed
# ╠═58bedae6-82c6-11eb-1223-49c7c07902bb
# ╟─b116f6ba-82c6-11eb-1b55-a1f5086601db
# ╠═2c08794c-8395-11eb-1040-3965833051cb
# ╠═38f049fa-8395-11eb-2bb4-8151f1237c63
# ╠═3d53aa1e-8395-11eb-18e5-afebe4d61494
# ╠═3f9d2318-8395-11eb-18ae-614afc30cbc2
# ╠═f73311d8-82c6-11eb-3701-67d48aabcff1
# ╠═2b5963fe-82c7-11eb-0a1f-5fc9a3782689
# ╠═7ce4159e-82d5-11eb-1661-91455b4d87e0
# ╠═7f240508-82d5-11eb-1573-070508720cc9
# ╠═c3d9ebee-82d6-11eb-263d-61a869d15395
# ╠═cb407952-82d6-11eb-32e5-3d8801b063d1
# ╠═d83b1872-82d6-11eb-07c0-2ba4eef03349
# ╟─bd800c62-82d4-11eb-03ba-b3c725ee40f2
# ╟─03e13754-82bb-11eb-1687-97c14468eca7
# ╟─3666e6d2-82bc-11eb-327c-b9d1392f639d
