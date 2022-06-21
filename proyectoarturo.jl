using CSV, DataFrames, Dates, Folds

## Cargar datos

tipos = [Date, String7, UInt8, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8, UInt8,
        Date, Date, String15, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8, UInt8,
        UInt8, UInt8, UInt8, UInt8, UInt8, 
        UInt8, UInt8, UInt8, UInt8, UInt8, 
        UInt8, UInt8, UInt8, UInt8, UInt8, 
        UInt8, UInt8, String7, UInt8, UInt8]
@time begin
    fechaDate = Date(2022,6,16)
    # "https://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/historicos/2022/06/datos_abiertos_covid19_16.06.2022.zip" 
    archivo = "220616COVID19MEXICO.csv"    
    println("Fecha de los datos: ", fechaDate, "\n")
    df = DataFrame(CSV.File(archivo, limit = 200, types = tipos))
    println(size(df))
    println(names(df), "\n")
end # 30 s

## Depurar fecha de las NO defunciones y convertir todo a formato Date

eltype(df.FECHA_DEF)
df.FECHA_DEF

@time begin
    i999 = findall(df.FECHA_DEF .== "9999-99-99")
    df.FECHA_DEF[i999] .= "2100-01-01"
    colFechaDef = fill(Date(2000,1,1), length(df.FECHA_DEF))
    for i ∈ 1:length(df.FECHA_DEF)
        colFechaDef[i] = Date(df.FECHA_DEF[i], DateFormat("y-m-d"))
    end
    df.FECHA_DEF = colFechaDef
    eltype(df.FECHA_DEF)
end # 55 s



## Valores iniciales y factores

begin
    censo2020 = 126_014_024 # Población mexicana 15-marzo-2020 (INEGI censo 2020)
    factor_anual_crec_pobl = 1.011 # 1.1% de tasa anual de crecimiento poblacional pre-pandemia
    factor_diario_crec = factor_anual_crec_pobl ^ (1/365)
    PobMex = Int(round(censo2020 / (factor_diario_crec ^ 75))) # pobl mex estimada al 01-enero-2020
    factorPos = 30.0 # factor que mutiplicado por los casos confirmados da los estimados
    factorMue = 2.27 # factor que multiplicado por muertes confirmadas da las estimadas (SE09: 05-Marzo-2022)
    dact = 14 # número de días que se considera una infección activa a partir del inicio de síntomas
end;


## Clasificación de casos

@time begin
    iPos = findall(x -> x ∈ [1,2,3], df.CLASIFICACION_FINAL)
    iMue = findall(x -> x ≠ Date(2100,1,1), df.FECHA_DEF) ∩ iPos # muertos positivos
    iSos = findall(x -> x ∈ [4,5,6], df.CLASIFICACION_FINAL)
    iNeg = findall(df.CLASIFICACION_FINAL .== 7)
    println("Positivos: ", length(iPos))
    println("Muertos: ", length(iMue))
    println("Sospechosos: ", length(iSos))
    println("Negativos: ", length(iNeg), "\n")
end # 1.8 s

## Fechas

begin
    fechaInicio = Date(2020,1,1) # inicio de la epidemia
    fechaFinal = fechaDate # fecha final últimos datos
    serieFechas = collect(fechaInicio:Day(1):fechaFinal)
    n = length(serieFechas)
end

begin 
    setiPos = BitSet(iPos)
    setiMue = BitSet(iMue)
end

@time begin
    @info "Miguel"
    P = zeros(Int, n) # Positivos por fecha de inicio de síntomas
    #PP = zeros(Int, n) # Positivos acumulados (vivos o muertos)
    M = zeros(Int, n) # Muertos por fecha de defunción
    #MM = zeros(Int, n) # Muertos acumulados
    S = zeros(Int, n) # Susceptibles
    S[1] = PobMex 
    I = zeros(Int, n) # Infectados activos
    #RR = zeros(Int, n) # Recuperados acumulados (aliviados + muertos) => R(t) = PP(t) - I(t) 
    for t ∈ 2:n
        #@info "Iter"
        d = serieFechas[t]
        #@info "Viejo"
        # Fecha de inicio de sintomas
        #@time iFechaPos = findall(df.FECHA_SINTOMAS .== d) ∩ setiPos
        iFechaPos = Folds.findall(df.FECHA_SINTOMAS .== d) ∩ setiPos
        #@info "Nuevo"
        #iFechaPos = Set(df.FECHA_SINTOMAS .== d) ∩ setiPos
        P[t] = Int(round(length(iFechaPos) * factorPos))
        #@time iFechaMue = findall(df.FECHA_DEF .== d) ∩ setiMue
        iFechaMue = Folds.findall(df.FECHA_DEF .== d) ∩ setiMue
        M[t] = Int(round(length(iFechaMue) * factorMue))
        #@time iInfecActivo = findall(d - Day(dact) .< df.FECHA_SINTOMAS .≤ d) ∩ setiPos ∩ findall(df.FECHA_DEF .> d)
        #@time iInfecActivo = findall((d - Day(dact) .< df.FECHA_SINTOMAS .≤ d) .&& df.FECHA_DEF .> d) ∩ setiPos
        iInfecActivo = Folds.findall((d - Day(dact) .< df.FECHA_SINTOMAS .≤ d) .&& df.FECHA_DEF .> d) ∩ setiPos
        I[t] = Int(round(length(iInfecActivo) * factorPos))
        S[t] = Int(round(factor_diario_crec * S[t-1])) - (I[t] - I[t-1]) - M[t]
    end
    #@info "cumsum"
    #@time PP = cumsum(P); 
    PP = cumsum(P); 
    #@time MM = cumsum(M); 
    MM = cumsum(M); 
    #@time RR = PP .- I 
    RR = PP .- I 
end; # 26 m


@time begin
    @info "Arturo"
    P = zeros(Int, n) # Positivos por fecha de inicio de síntomas
    PP = zeros(Int, n) # Positivos acumulados (vivos o muertos)
    M = zeros(Int, n) # Muertos por fecha de defunción
    MM = zeros(Int, n) # Muertos acumulados
    S = zeros(Int, n) # Susceptibles
    S[1] = PobMex 
    I = zeros(Int, n) # Infectados activos
    RR = zeros(Int, n) # Recuperados acumulados (aliviados + muertos) => R(t) = PP(t) - I(t) 
    for t ∈ 2:n
        #@info "Iter"
        d = serieFechas[t]
        iFechaPos = findall(df.FECHA_SINTOMAS .== d) ∩ iPos
        P[t] = Int(round(length(iFechaPos) * factorPos))
        iFechaMue = findall(df.FECHA_DEF .== d) ∩ iMue
        M[t] = Int(round(length(iFechaMue) * factorMue))
        iInfecActivo = findall(d - Day(dact) .< df.FECHA_SINTOMAS .≤ d) ∩ iPos ∩ findall(df.FECHA_DEF .> d)
        I[t] = Int(round(length(iInfecActivo) * factorPos))
        S[t] = Int(round(factor_diario_crec * S[t-1])) - (I[t] - I[t-1]) - M[t]
    end
    PP = cumsum(P); 
    MM = cumsum(M); 
    RR = PP .- I 
end; # 26 m

# Base.summarysize(df) == 67312
# Despues de conversiones de tipo
# Despues de cambiar todos los ints a UInt8 y la columna 13 a String15
# Base.summarysize(df) == 19608

# Considerar usar folds
