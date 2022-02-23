#Autor Tomasz Hałas

"""
Function matrixA 
returns sparse array A
"""
function matrixA(IOStreamA,n)
    
    A = spzeros(Float64,n,n)
    
    while !eof(IOStreamA)
        line = readline(IOStreamA)
        inputs = split(line)
        A[parse(Int, inputs[1]),parse(Int, inputs[2])] = parse(Float64, inputs[3])
    end

    return A
end

"""
Function vecB
returns right-sided vector B
"""
function vecB(IOStreamB)
    
    val = []; 
    line = readline(IOStreamB)
    while !eof(IOStreamB)
        line = readline(IOStreamB)
        push!(val, parse(Float64, line))
    end

    return val
end

"""
Creates right sided vector
"""
function create_B(A,n,l)
    
   solution = zeros(Float64, n)

    for i in 1:n
        beginner = max(i - l - 2, 1)
        ennder = min(i + l, n)
        for j in beginner:ennder
            solution[i] += A[i, j]
        end
    end
        
    return solution
end


"""
Save data to file
"""
function saver(name,result, n)

    open(name, "w") do file
        x_ones= ones(n)
        normal = norm(x_ones - result) / norm(result)
        println(file, normal)
        for i = 1:n
            println(file, result[i])
        end
    end
end

"""
Function gauss does Gauss Elimination on array A
"""
function gauss(A,b,n,l)
    
    for k in 1:n-1
        for i in k+1:min((k+1) + l,n) 
            tmp = A[i,k]/A[k,k]      
            A[i,k] = 0.0
            
            for j in k+1:min(k + l, n) 
                A[i,j] = A[i,j] - tmp*A[k,j]
            end
        b[i] = b[i] - tmp * b[k]
        end
    end
end

"""
Function gauss does Gaussian Elimination with Partial Pivoting on array A
"""
function gauss_with_pivot(A,b,n,l)
    
    pivot_array = collect(1:n)
    for k in 1:n-1
            
        p = 0
        maxPivot = 0
            for i in k:min((k + 1) + l, n)
                if abs(A[pivot_array[i], k]) > p
                    p = abs(A[pivot_array[i], k])
                    maxPivot = i
                end
            end
        
            pivot_array[maxPivot],pivot_array[k] = pivot_array[k],pivot_array[maxPivot]
        
            for i in k+1:min((k+1) + l,n)
                tmp = A[pivot_array[i],k]/A[pivot_array[k],k]      
                A[pivot_array[i],k] = 0.0

                for j in k+1:min(k + 2 * l, n) 
                    A[pivot_array[i],j] = A[pivot_array[i],j] - tmp*A[pivot_array[k],j]
                end
                b[pivot_array[i]] = b[pivot_array[i]] - tmp * b[pivot_array[k]]
            end
        end
    return pivot_array
end

"""
Function gauss_solver solve and retunns x's using back substitute
"""
function gauss_solver(A,b,n,l)
    res = zeros(Float64, n)

    for i in n:-1:1
        sum = 0
        for j in i+1:min(i + l, n)
            sum += A[i, j] * res[j]
        end
        res[i] = (b[i] - sum) / A[i, i]
    end
    
    return res
end

"""
Function gauss_solver_with_pivot solve and retunns x's using back substitute
"""
function gauss_solver_with_pivot(A,b,n,l,pivot_array)
    
    res = zeros(Float64, n)
    for i in n:-1:1
        sum = 0
        for j in i+1:min(i + l * 2 , n) 
            sum += A[pivot_array[i], j] * res[j]
        end

        res[i] = (b[pivot_array[i]] - sum) / A[pivot_array[i], i]
    end
    return res
end

"""
Function gauss_lu creates LU using Gauss Elimination
"""
function gauss_lu(U,L,n,l)
    
    for k in 1:n-1
        L[k, k] = 1.0
        for i in k+1:min((k+1) + l,n) 
            tmp = U[i,k]/U[k,k]       
            U[i,k] = 0.0
            L[i, k] = tmp
            for j in k+1:min(k + l, n)
                U[i,j] = U[i,j] - tmp*U[k,j]
            end
        end
    end
    L[n, n] = 1.0
end

"""
Function gauss_lu_with_pivot creates LU using Gauss Elimination with pivots
"""
function gauss_lu_with_pivot(U,L,n,l)
    
    pivot_array = collect(1:n)
    
    for k in 1:n-1
            
        p = 0
        maxPivot = 0
        
            for i in k:min((k +1) + l, n)
                if abs(U[pivot_array[i], k]) > p
                    p = abs(U[pivot_array[i], k])
                    maxPivot = i
                end
            end
        
            pivot_array[maxPivot],pivot_array[k] =pivot_array[k],pivot_array[maxPivot]
        
            for i in k+1:min((k+1) + l,n)
                tmp = U[pivot_array[i],k]/U[pivot_array[k],k]      
                U[pivot_array[i],k] = 0
                L[pivot_array[i], k] = tmp

                for j in k+1:min(k + 2 * l, n)
                    U[pivot_array[i],j] = U[pivot_array[i],j] - tmp*U[pivot_array[k],j]
                end
            end
        end
    return pivot_array
end

"""
Function gauss_solver_lu solve and returns x's using back substitute
"""
function gauss_solver_lu(U,L,b,n,l)
    
    res = zeros(Float64, n)
  
    for k in 1:n-1
        for i in k+1:min((k+1) + l,n)
            b[i] = b[i] -  L[i, k] * b[k]
        end
    end 
    
    for i in n:-1:1
        sum = 0
        for j in i+1:min(i + l + 1, n) 
            sum += U[i, j] * res[j]
        end
        res[i] = (b[i] - sum) / U[i, i]
    end

    return res
end

"""
Function gauss_solver_lu_with_pivot solve and returns x's using back substitute
"""
function gauss_solver_lu_with_pivot(U,L,b,n,l,pivot_array)
    
    res = zeros(Float64, n)
    
    for k in 1:n-1
        for i in k+1:min((k+1) + l,n)
            b[pivot_array[i]] = b[pivot_array[i]] - L[pivot_array[i], k] * b[pivot_array[k]]
        end
    end
    
    for i in n:-1:1
        sum = 0
        for j in i+1:min(i + l *2, n)
            sum += U[pivot_array[i], j] * res[j]
        end
        res[i] = (b[pivot_array[i]] - sum) / U[pivot_array[i], i]
    end

    return res
end
