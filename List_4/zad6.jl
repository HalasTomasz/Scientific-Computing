# Autor Tomasz Hałas
include("./Module.jl")
function f1(x)
    if x <=0 return -x
    else return x
    end
end
function g1(x)
    return 1/(1+x^2)
end


rysujNnfx(f1,-1.0,1.0,5)

rysujNnfx(f1,-1.0,1.0,10)

rysujNnfx(f1,-1.0,1.0,15)

rysujNnfx(g1,-5.0,5.0,5)

rysujNnfx(g1,-5.0,5.0,10)

rysujNnfx(g1,-5.0,5.0,15)


