module Primero

    const α = 42
   f(x) = println("Hola $x") 

   export f
   export α
end


function g(x)
     if isa(x, Number) 
        println("Número") 
    elseif isa(x, String)
        println("Cadena")
    elseif isa(x, Char)
        println("Char")
    end
 end 

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

@profview profile_test(1)
@profview profile_test(10)
using Base.Threads
function fib(n)
    if n < 2
        return n
    end
    t = @spawn fib(n - 1)
    return fib(n-2) + fetch(t)
end

fib(8)

@sync begin
    @spawn #download 1
    @spawn #download 2
    @spwan #download 3
    @spawn #download
end