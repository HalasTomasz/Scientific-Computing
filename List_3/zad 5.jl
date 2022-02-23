# Autor Tomasz Hałas
include("./Module.jl")

function f(x)
    3x-Base.MathConstants.e^x
end

delta = 10^(-4)
epsilon = 10^(-4)

println(mbisekcji(f, 0.0, 1.0, delta,epsilon))
println(mbisekcji(f, 1.0, 2.0, delta,epsilon))


