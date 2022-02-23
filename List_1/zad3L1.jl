#Autor Tomasz Hałas

#Manualnie sprawdzenie czy liczby zmiennopozycyjne są równorozmieszczone
function maunal(begin_number,ending_number, gamma)
    current_number = nextfloat(begin_number)
    while current_number < ending_number
        if current_number + gamma != nextfloat(current_number)
            println("Nierównomiarnie rozmieszczone")
        end
        current_number = nextfloat(current_number)
    end
     println("Równomiarnie rozmieszczone")
end


maunal(Float64(1.0) ,Float64(2.0) ,Float64(2^(-52)))

function spread_numbers(first,last)
    return 2.0^(parse(Int,SubString(bitstring(first),2:12),base=2)-(2^10-1)) * 2.0^(-52)
end

spread_numbers(2.0,4.0)

spread_numbers(0.5,1)

spread_numbers(1.0,2.0)
