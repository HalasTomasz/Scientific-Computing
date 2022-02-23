# Autor Tomasz Hałas
function recursive_1(number,i)
    if i == 41 return number
    else return recursive_1(number+r*number*(1-number),i+1)
    end
end

function recursive_2(number,i)
    if i == 41 
        return number
    elseif i == 11 
        number = floor(10^3*number)/10^3
        println(number)
        return recursive_2(number+r*number*(1-number),i+1)
    else 
        return recursive_2(number+r*number*(1-number),i+1)
    end
end

r = 3
start = Float32(0.01)
ending = recursive_1(start,1)
println(ending)
println(recursive_2(start,1))

r = 3
start = Float64(0.01)
ending = recursive_1(start,1)
println(ending)
println(recursive_2(start,1))


