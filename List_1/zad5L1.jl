#Autor Tomasz Hałas

x = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

println(a(x,y))
println(b(x,y))
println(c(x,y))
println(d(x,y))

x32 = [] 
y32 = []
for (_,element) in enumerate(x)
    push!(x32,Float32(element))
end
for (_,element) in enumerate(y)
     push!(y32,Float32(element))
end
x32 = convert(Array{Float32,1}, x32)
y32 = convert(Array{Float32,1}, y32)

println(a(x32,y32))
println(b(x32,y32))
println(c(x32,y32))
println(d(x32,y32))

# a
function a(first_array,second_array)
    S = 0.0
    for i in (1:length(first_array))
        S = S + first_array[i]*second_array[i]
    end
    return S
end

# b
function b(first_array,second_array)
    S = 0.0
    for i=length(first_array):-1:1
        S = S + first_array[i]*second_array[i]
    end
    return S
end

#c
function c(first_array,second_array)
    S1 = typeof(first_array)([])
    S2 = typeof(first_array)([])
    for i in (1:length(first_array))
        tmp = first_array[i]*second_array[i]
        if tmp >= 0.0
            append!(S1,tmp)
        else
            append!(S2,tmp)
          
        end
        
    end
    return sum(sort(S1,rev=true)) + sum(sort(S2,rev=false))
end

#d
function d(first_array,second_array)
    S1 = typeof(first_array)([])
    S2 = typeof(first_array)([])
    for i in (1:length(first_array))
        tmp = first_array[i]*second_array[i]
        if tmp >= 0.0
            append!(S1,tmp)
        else
            append!(S2,tmp)
          
        end
        
    end
    return sum(sort(S1,rev=false)) + sum(sort(S2,rev=true))
end
