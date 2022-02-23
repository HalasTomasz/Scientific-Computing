#Autor Tomasz Hałas

function maker()
    x = one(Float64)
    while (nextfloat(x)*(one(Float64)/nextfloat(x)) == one(Float64)) && (x < 2)
        x = nextfloat(x)
    end
    x = nextfloat(x)
end

maker()

function min_number()
     y = nextfloat(zero(Float64))
    while nextfloat(y)*(one(Float64)/nextfloat(y)) == one(Float64)
        y = nextfloat(y)
    end
    y = nextfloat(y)
end 

min_number()
