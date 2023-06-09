using LinearAlgebra

function Dbehind(A)
  n = size(A)[1]
  X = [0.0 for _ in 1:size(A)[1]]

  X[n] = A[n, n+1] / A[n, n]
  #K=sort(seq(1,n-1),decreasing = T)
  K = n-1:-1:1

  for k in K
    Aux = [0.0 for _ in 1:n]
    for j in (k+1):n
      Aux[n-(j-1)] = A[k, j] * X[j]
    end
    X[k] = A[k, n+1] / A[k, k] - sum(Aux) / A[k, k]
  end
  return (X)
end

function Dnow(A)
  n = size(A)[1]
  S = [0.0 for _ in 1:n]
  Aux = S
  S[1] = A[1, n+1]

  for i in 2:n
    for j in 1:(i-1)
      Aux[j] = A[i, j] * S[j]
    end
    S[i] = A[i, n+1] - sum(Aux)
  end
  return (S)
end


function FLU(A, Solution)
  Asdim = size(A)[1]
  U = A[1:Asdim, 1:Asdim]
  L = fill(0.0, Asdim, Asdim)
  if det(U) != 0.0
    for pivote in 1:(Asdim-1)
      for i in (pivote+1):Asdim
        L[pivote, i] = U[i, pivote] / U[pivote, pivote]
        U[i, :] .= -(U[i, pivote] / U[pivote, pivote]) * U[pivote, :] + U[i, :]
      end
    end

    L = I(Asdim) .+ tr(L)

    if Solution == 1
      b = A[:, Asdim+1]
      Lb = [L b]
      Y = Dnow(Lb)
      Uy = [U, Y]
      Solution = Dbehind(Uy)
      return L, U, Solution
    else
      return L, U
    end
    println("Esta parte se vera mas adelante")
  end
end

#Caso Ejemplo 
Ab = [-1.0 3.0 2.0; 3.0 -4.0 1.0; 2.0 5.0 -2.0];
@show Ab

@profview FLU(Ab, 0)
@profview_allocs FLU(Ab, 0)

@time FLU(Ab, 0)
@time FLU(Ab, 0)
@btime FLU($Ab, 0)