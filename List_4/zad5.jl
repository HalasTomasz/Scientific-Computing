# Autor Tomasz Hałas
include("./Module.jl")
function f(x)
    return Base.MathConstants.e^x
end
function g(x)
    return x^(2)*sin(x)
end
rysujNnfx(f,0.0,1.0,5)

rysujNnfx(f,0.0,1.0,10)

rysujNnfx(f,0.0,1.0,15)

#################
rysujNnfx(g,-1.0,1.0,5)

rysujNnfx(g,-1.0,1.0,10)

rysujNnfx(g,-1.0,1.0,15)


