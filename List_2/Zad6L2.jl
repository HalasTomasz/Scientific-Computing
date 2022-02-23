#Autor Tomasz Hałas
using Plots
function recursion_1(number,cons,i,tmp)
    
    if i == 41 
        push!(tmp, (i-1,number))
        return tmp
    else
        push!(tmp, (i-1,number^2 + cons))
        return recursion_1(number^2 + cons,cons,i+1,tmp)
    end
end

array1 = [1,2,1.99999999999999,1,-1,0.75,0.25]
array2 = [-2,-2,-2,-1,-1,-1,-1]
collect = []
for i in 1:length(array1)
    tmp = [] 
    tmp = recursion_1(array1[i],array2[i],1,tmp)
    push!(collect,tmp)
end

plot([i[1] for i in collect[7]],[i[2] for i in collect[7]],seriestype = :scatter, title = "c = -1, x_0 = 0.25")


