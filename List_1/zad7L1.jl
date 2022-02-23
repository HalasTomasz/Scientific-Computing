# Autor Tomasz Hałas

function f(x)
    sin(x) + cos(3*x)
end

function der_f(x::Float64)
    cos(x) - 3sin(3*x)
end

for i in 0:54
    print((f(1.0 + 2.0^(-i)) - f(1.0) )/(2.0^(-i)))
    print("    ----------     ")
    println(abs((f(1.0 + 2.0^(-i)) - f(1.0) )/(2.0^(-i)) - der_f(1.0)))
end


