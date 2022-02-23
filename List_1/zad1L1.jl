#Autor Tomasz Hałas

#macheps

macheps16 = one(Float16)
macheps32 = one(Float32)
macheps64 = one(Float64)

println(find_macheps(macheps16))
println(find_macheps(macheps32))
println(find_macheps(macheps64))

function find_macheps(macheps)
    tmp = Any
    while typeof(macheps)(1.0+macheps) > 1.0 && typeof(macheps)(1.0 + macheps)== 1 + macheps
        tmp = macheps
        macheps = macheps/2
    end
    return tmp
end

# Float.h
# Float16 nie istnieje
# FLT_EPSILON -> 1.19209290E-07F
# DBL_EPSILON -> 2.2204460492503131E-016

# Julia Data Macheps
println(eps(Float16))
println(eps(Float32))
println(eps(Float64))




#eta

eta16 = one(Float16)
eta32 = one(Float32)
eta64 = one(Float64)

println(find_eta(eta16))
println(find_eta(eta32))
println(find_eta(eta64))

function find_eta(eta)
    current_number = Any
    while !(eta == 0)
        current_number = eta
        eta = eta/2
    end
    return current_number
end

# Julia Data Eta
println(nextfloat(Float16(0.0)))
println(nextfloat(Float32(0.0)))
println(nextfloat(Float64(0.0)))




#Max

max16 = Float16(2-2^(-10))
max32 = Float32(2-2^(-23))
max64 = Float64(2-2^(-52))

println(find_max(max16))
println(find_max(max32))
println(find_max(max64))

function find_max(max)
    tmp = Any
    while !(isinf(max))
        tmp = max
        max = 2*max
    end
    return tmp
end

# Julia Data Max
println(floatmax(Float16))
println(floatmax(Float32))
println(floatmax(Float64))

# C max
# FLT_MAX  ->  3.40282347E+38F
# DBL_MAX  ->  1.7976931348623157E+308



## Zwracanie funkcji -> pytanie zad 1
println(floatmin(Float32))
println(floatmin(Float64))
