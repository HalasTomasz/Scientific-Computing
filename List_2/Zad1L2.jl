#Autor Tomasz Hałas

x = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

println(a(x,y))
println(b(x,y))
println(c(x,y))
println(d(x,y))

x = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
x32 = collect(Float32,x)
y32 = collect(Float32,y)

println(a(x32,y32))
println(b(x32,y32))
println(c(x32,y32))
println(d(x32,y32)) 

# a
function a(first_array,second_array)
    S = Float32(0.0)
    for i in (1:length(first_array))
        S = S + first_array[i]*second_array[i]
    end
    return S
end

# b
function b(first_array,second_array)
    S = Float32(0.0)
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
