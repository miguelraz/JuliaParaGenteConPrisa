Mu = 0
d = 0.1
δt = 0.001
v = 1
Σ = √(2 * d * δt)
Σ1 = √(2δt)

Ntrayectorias = 1000
angulo = zeros(Ntrayectorias)
x = zeros(Ntrayectorias)
y = zeros(Ntrayectorias)

# TODO - funcion!!!
# NO EN ESTADO GLOBALLLLL
Npasos = 1000
lista = Tuple{Float64,Float64}[]

@profview_allocs for j in 1:Npasos
    sumx2 = 0
    sumy2 = 0
    for i in 1:Ntrayectorias
        angulo[i] += Σ1 * randn()
        x[i] += δt * v * cos(angulo[i]) + Σ * randn()
        y[i] += δt * v * sin(angulo[i]) + Σ * randn()
        #sumx = x[i] + x[i]
        #sumy = y[i] 
        sumx2 += x[i]^2
        sumy2 += y[i]^2
        # TODO
        push!(lista, (δt * j, (sumx2 + sumy2) / Ntrayectorias))
    end
end

lista