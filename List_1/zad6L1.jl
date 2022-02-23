#Autor Tomasz Hałas

function f(x) 
    sqrt(x^2 + 1) -1 
end
function g(x::Float64) 
    x^2/(sqrt(x^2 + 1) +1)
end

for i in 1:179
    println(f(8.0^(-i)))
    println(g(8.0^(-i)))
    println(" ---- ")
end
