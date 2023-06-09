#Algoritmo del agente viajero
#Función para encontrar la trayectoria óptima del agente viajero

AgenteViajero <- function(numNodos, costos) {
  nodoActual <- 0
  nodosAsignados <- rep(FALSE, numNodos) #rep pone las 4 posiciones en FALSE
  trayectoria <- numeric(numNodos + 1) #Se aumenta uno porque debemos regresar al nodo inicio
  
  #Encontrar el siguiente nodo en cada iteración
  for (i in 1:numNodos) {
    nodosAsignados[nodoActual + 1] <- TRUE  #Se suma 1 porque inicializamos nodoActual en 0
    trayectoria[i] <- nodoActual
    nodoSiguiente <- BuscarMejorNodo(nodoActual, nodosAsignados, costos)
    nodoActual <- nodoSiguiente
  }

  #Agregar el primer nodo al final para cerrar la trayectoria
  trayectoria[numNodos + 1] <- 0
  #Calcular el costo total de la trayectoria
  costoTotal <- CalcularCosto(trayectoria, costos)
  #Regresar la trayectoria y el costo total
  return(list(trayectoria = trayectoria, costoTotal = costoTotal))
}

#Función para encontrar el siguiente nodo a visitar
BuscarMejorNodo <- function(nodoActual, nodosAsignados, costos) {
  numNodos <- length(nodosAsignados)
  menor <- Inf
  mejorNodo <- -1
  for (j in 1:numNodos) {
    if (j != (nodoActual + 1) && !nodosAsignados[j]) {
      if (costos[nodoActual + 1, j] < menor) {
        menor <- costos[nodoActual + 1, j]
        mejorNodo <- j - 1
      }
    }
  }
  return(mejorNodo)
}

#Función para calcular el costo total de la trayectoria
CalcularCosto <- function(trayectoria, costos) {
  numNodos <- length(trayectoria) - 1
  suma <- 0
  for (i in 1:numNodos) {
    nodoActual <- trayectoria[i] + 1
    nodoSiguiente <- trayectoria[i+1] + 1
    suma <- suma + costos[nodoActual, nodoSiguiente]
  }
  return(suma)
}

#ENTRADA
numNodos <- 5
costos <- matrix(c(0, 10, 15, 20, 25,
         		10, 0, 35, 40, 45,
         		15, 35, 0, 50, 55,
         		20, 40, 50, 0, 30,
         		25, 45, 55, 30, 0), nrow = numNodos, ncol = numNodos, byrow = TRUE)
start <- Sys.time()
resultado <- AgenteViajero(numNodos, costos)
print(Sys.time() - start)

#SALIDA
print(resultado$trayectoria) 	#Entrega el recorrido realizado (orden de nodos visitados)
print(resultado$costoTotal)	#Costo total del viaje 
