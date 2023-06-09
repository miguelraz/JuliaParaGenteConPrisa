begin
    using Plots
    using Roots
    using SpecialFunctions
    
    #------------------#
    #---Solucionador---#
    #------------------#
    
    # La función Euler regresará una lista con todos la solución de la ecuación principal. La utilizaremos para 
    # hacer una gráfica y visualizar la solucioón.
    
    function euler(y0)
        
        function dif_eq(x,y,t)
            dx = y
            dy = -9.8
            return [dx,dy]
        end
        
        h = 1/100
        
        lt = Float64[]
        lx = Float64[]
        ly = Float64[]
        
        
        t = 0
        tf = 5
    
        x = 0 # El cohete se tirará desde el suelo
        y = y0
        
        res = 0
        while t < tf
            t += h        
            x += h * dif_eq(x,y,t)[1]
            y += h * dif_eq(x,y,t)[2]
            push!(lt, t)
            push!(lx, x)  
            push!(ly, y)
            res += 1
        end
    
        @show res
        return [lt, lx] # Devuelve el dominio y la función
    
    end
    
    #----------------------#
    #---Función de error---#
    #----------------------#
    
    function error(y0)
        error = euler(y0)[2][end]-50
        return error
    end    
    
    #-----------------#
    #---Root finder---#
    #-----------------#
    
    # Esta función de julia encontrará los ceros de la función error
    
    v0 = find_zero(error, 30)
    println(v0)
    
    # Ahora aimplemente graficaremos para visualizar la solución
    
    plot(euler(v0)[1], euler(v0)[2], xlabel="t", ylabel="altura (m)")
    scatter!([5], [50], color=:red, markersize=5, label=false)
end
