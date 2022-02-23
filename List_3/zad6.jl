# Autor Tomasz Hałas
include("./Module.jl")


function f(x)
    Base.MathConstants.e^(1-x) -1
end

function g(x)
    -Base.MathConstants.e^(1-x) 
end
 
delta = 10^(-5)
epsilon = 10^(-5)

println(mbisekcji(f, 0.5, 1.5, delta,epsilon))
println(mstycznych(f,g, 0.0, delta,epsilon,100))
println(msiecznych(f,0.5, 1.5, delta,epsilon,100))
println(mbisekcji(f, 0.5, 2.0, delta,epsilon))
println()
println(mstycznych(f,g, 50.0, delta,epsilon,100))

include("./Module.jl")

function f2(x)
    x*Base.MathConstants.e^(-x)
end

function g2(x)
    -Base.MathConstants.e^(-x)*(x-1)
end
 
delta = 10^(-5)
epsilon = 10^(-5)

println(mbisekcji(f2, -0.5, 0.5, delta,epsilon))
println(mstycznych(f2,g2, -1.0, delta,epsilon,100))
println(msiecznych(f2,-0.5, 0.5, delta,epsilon,100))
println(mbisekcji(f2, -0.5, 1.0, delta,epsilon))
println()
println(mstycznych(f2,g2, 50.0, delta,epsilon,100))
println(mstycznych(f2,g2, 1.0, delta,epsilon,100))


