# Autor Tomasz Hałas
include("./Module.jl")
using Test

x = [3.0, 1.0, 5.0, 6.0]
fx = [1.0, -3.0, 2.0, 4.0]

result = [1.0,2.0,-0.375,0.175]

@testset "iloraz" begin
           @test isapprox(ilorazyRoznicowe(x,fx), result)
       end;

@testset "warnewton" begin
            @test warNewton(x,ilorazyRoznicowe(x,fx),5.0) ≈ 2
            @test warNewton(x,ilorazyRoznicowe(x,fx),7.0) ≈ 8.4 atol=0.00001
        end;
 
result_nat = [-8.75, 7.525, -1.95, 0.175]
@testset "naturalna" begin
            @test isapprox(naturalna(x,ilorazyRoznicowe(x,fx)),result_nat)
        end;


