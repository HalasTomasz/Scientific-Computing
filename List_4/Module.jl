# Autor Tomasz Hałas
using PyPlot

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    len_of_f = length(f)
    tmp = [val for val in f] 
    for i in 1:len_of_f
        for j in len_of_f:-1:i+1
            tmp[j] = (tmp[j] - tmp[j-1])/(x[j] - x[j-i])
        end
    end
    return tmp
end

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    len_of_x = length(x)
    tmp = fx[len_of_x]
    
    for i in len_of_x-1:-1:1
        tmp = fx[i] + (t -x[i])*tmp
    end
    return tmp
end

function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    len_of_x = length(x)
    
    tmp = [val for val in fx] 
    
    for i in len_of_x-1:-1:1
        tmp[i] = fx[i] - tmp[i+1]*x[i]
        for j in i+1:len_of_x-1
            tmp[j] = tmp[j] - tmp[j+1] *x[i]
        end
    end
    return tmp
end

function rysujNnfx(f,a::Float64,b::Float64,n::Int)
    size = n+1
    x_i = zeros(size)
    y_i = zeros(size)
    f_i = zeros(size)
    
    h = (b-a)/n
    tmp = a
    for i in 1:size
        x_i[i] = tmp
        y_i[i] = f(tmp)
        tmp = tmp + h
    end
    
    f_i = ilorazyRoznicowe(x_i, y_i)
    number = 10
    p_x = zeros(number * size)
    p_f = zeros(number * size)
    p_r = zeros(number * size)
    
    size = size * number
    tmp = a
    h = (b - a) / (size - 1)
    for i in 1:size
        p_x[i] = tmp
        p_f[i] = warNewton(x_i, f_i, tmp)
        p_r[i] = f(tmp)
        tmp += h
    end
    
    clf()
    plot(p_x, p_f, linewidth = 2.5)
    plot(p_x, p_r, linewidth = 1.5)
    grid(true)
    savefig(string("plot-", n, f,".png"))
end
