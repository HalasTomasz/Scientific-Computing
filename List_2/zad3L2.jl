#Autor Tomasz Hałas

using LinearAlgebra

function matcond(n::Int, c::Float64)
# Function generates a random square matrix A of size n with
# a given condition number c.
# Inputs:
# n: size of matrix A, n>1
# c: condition of matrix A, c>= 1.0
#
# Usage: matcond(10, 100.0)
#
# Pawel Zielinski
    if n < 2
        error("size n should be > 1")
    end
    if c< 1.0
        error("condition number  c of a matrix  should be >= 1.0")
    end
    (U,S,V)=svd(rand(n,n))
    return U*diagm(0 =>[LinRange(1.0,c,n);])*V'
end

function hilb(n::Int)
# Function generates the Hilbert matrix  A of size n,
# A (i, j) = 1 / (i + j - 1)
# Inputs:
# n: size of matrix A, n>=1
#
#
# Usage: hilb(10)
#
# Pawel Zielinski
    
        if n < 1
         error("size n should be >= 1")
        end
        return [1 / (i + j - 1) for i in 1:n, j in 1:n]
end


function test_hilb_matrix()
    
    for n in 1:30
        test_matrix = hilb(n)
        x = ones(n)
        b = test_matrix * x
        
        inversion = inv(test_matrix) * b
        gauss_solution = test_matrix \ b
         
        
        print(n)
        print("  & $(rank(test_matrix)) &  ")
        print("$(cond(test_matrix))")
        print("  & $(norm(inversion - x)/norm(x)) &  ")
        println("$(norm(gauss_solution - x)/norm(x))")
    end
end

test_hilb_matrix()

function test_random_matrix()
    array1 = [5, 10, 20]
    array2 = [1.0, 10.0, 10^3, 10^7, 10^12, 10^16]
    for n in array1
        for c in array2
            test_matrix = matcond(n,c)
            x = ones(Float64,n)
            b = test_matrix * x
        
            gauss_solution = test_matrix \ b
            inversion = inv(test_matrix) * b
            
            print(n)
            print("  & $(rank(test_matrix)) &  ")
            print("$(cond(test_matrix))")
            print("  & $(norm(inversion - x)/norm(x)) &  ")
            println("$(norm(gauss_solution - x)/norm(x))")
        end
    println("----------")
    end
end

test_random_matrix()
