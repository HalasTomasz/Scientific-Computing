# Autor Tomasz Hałas
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    
    u = f(a) #set u and v 
    v = f(b)
    
    if sign(u) == sign(v)
        #error("Bad range")
        return (0,0,0,1)
    end
    
    
    number = 0 # Number of iteration
  
    while true
        
        number = number +1
        e = b-a
        e = e/2
        c = a + e # Safe method to get middle of range
    
        w = f(c) # Calucation w <- f(c) 
        
        if (abs(e) < delta || abs(w) < epsilon) #End while if  |b-a|< e and |f(c)| < epsilon
            return (c, w, number, 0)
        end
        
        if sign(w) != sign(u) # not same signs 
            b = c
            v = w
        else
            a = c
            u = w
        end
    end
end

function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    v = f(x0)
    
    if abs(v) < epsilon   #Check value
        return (0,x0,v,0)
    end
    
    if abs(pf(x0)) < epsilon #Check derative
        return (0, 0, 0, 2)
    end
    
    for i in 1:maxit
    
        x1 = x0 -v/pf(x0) 
        v = f(x1)
        
        if (abs(x1 - x0) < delta || abs(v) < epsilon) #Return x1 and its value
            return (x1, v, i, 0)
        end
        
        x0 = x1
        end
    
    return (0, 0, 0, 1) # Not enough precision
end

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64,maxit::Int)
    fa = f(x0)
    fb = f(x1)
    
    # a,b values for f(x0) and f(x1)
    
    for i in 1:maxit
        
        if abs(a) > abs(b) # swap
            x1,x0=x0,x1
            fa,fb = fb,fa
        end
        
        s = (x1-x0)/(fb-fa) #Creating hn
        x1 = x0
        fb = fa
        x0 = x0 - fa*s #Creating xn+1
        fa = f(x0)
        
        if abs(x1-x0) < delta || abs(fa) < epsilon # precison
            return (x0,fa,i,0) 
        end
    end
    return(0,0,0,1)# Not enough precision 
end


