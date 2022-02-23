# Autor Tomasz Hałas
include("./Module.jl")

using ForwardDiff
function f(x)
    sin(x) - (1/4)x^2
end

g = x->ForwardDiff.derivative(f, x)
 
delta = (1/2)*10^(-5)
epsilon = (1/2)*10^(-5)
println(mbisekcji(f, 1.5, 2.0, delta,epsilon))
println(mstycznych(f,g, 1.5, delta,epsilon,100))
println(msiecznych(f,1.0, 2.0, delta,epsilon,100))


