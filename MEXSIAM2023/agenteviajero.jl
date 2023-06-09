function AgenteViajero(numNodos, costos)
    nodoActual = 0
    nodosAsignados = [false for i in 1:numNodos]
    trayectoria = zeros(Int, numNodos)
    for i in 1:numNodos
        nodosAsignados[nodoActual+1] = true
        trayectoria[i] = nodoActual
        nodoSiguiente = BuscarMejorNodo(nodoActual, nodosAsignados, costos)
        nodoActual = nodoSiguiente
    end

    push!(trayectoria, 0)
    costoTotal = CalcularCosto(trayectoria, costos)

    return trayectoria, costoTotal
end

function BuscarMejorNodo(nodoActual, nodosAsignados, costos)
    numNodos = length(nodosAsignados)
    menor = Inf
    mejorNodo = -1
    for j in 1:numNodos
        if (j != nodoActual + 1) && !nodosAsignados[j]
            menor = costos[nodoActual+1, j]
            mejorNodo = j - 1
        end
    end

    return mejorNodo
end

function CalcularCosto(trayectoria, costos)
    numNodos = length(trayectoria) - 1
    suma = 0
    for i in 1:numNodos
        nodoActual = trayectoria[i] + 1
        nodoSiguiente = trayectoria[i+1] + 1
        suma += costos[nodoActual, nodoSiguiente]
    end
    return suma
end

# TODO
const numNodos = 5
const costos = [0 10 15 20 25
    10 0 35 40 45
    15 35 0 50 55
    20 40 50 0 30
    25 45 55 30 0];

@time AgenteViajero(numNodos, costos)




















