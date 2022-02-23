# Autor Tomasz Hałas
using Plots
using SymPy

function f(x)
    return Base.MathConstants.e^x * log(1+Base.MathConstants.e^(-x))
end

plot(f,-20,60)
