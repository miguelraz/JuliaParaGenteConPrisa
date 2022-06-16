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


