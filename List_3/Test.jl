# Autor Tomasz Hałas
include("./Module.jl")
using Test

function f(x) 
    return cos(2x)
end
function fprim(x)
    return -2sin(2x)
end
function g(x)
    return x^2 -5
end
function gprim(x)
    return 2x
end
delta = 10^(-5)
epsilon = 10^(-5)  

@testset "bisekcja" begin
           @test mbisekcji(f,0.0,pi/2,delta,epsilon)[1] ≈ pi/4 atol=0.00001
           @test mbisekcji(g,-5.0,1.0,delta,epsilon)[1] ≈ -sqrt(5) atol=0.00001
           @test mbisekcji(f,0.0,pi*1.0,delta,epsilon)[4] == 1
       end;

@testset "newton" begin
           @test mstycznych(f,fprim,3/4pi,delta,epsilon,100)[1] ≈ pi/4 atol=0.00001
           @test mstycznych(g,gprim,-5.0,delta,epsilon,100)[1] ≈ -sqrt(5) atol=0.00001
           @test mstycznych(f,fprim,3/4pi,delta,epsilon,3)[4] == 1
       end;

@testset "sieczna" begin
           @test msiecznych(f,0.0,pi/2,delta,epsilon,100)[1] ≈ pi/4 atol=0.00001
           @test msiecznych(g,-5.0,-3.0,delta,epsilon,100)[1]  ≈ -sqrt(5) atol=0.00001
           @test msiecznych(f,0.0,3/4pi,delta,epsilon,3)[4] == 1
       end;
