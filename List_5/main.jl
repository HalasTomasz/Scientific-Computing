#Autor Tomasz Hałas

using SparseArrays
using Statistics
using LinearAlgebra
include("./blocksys.jl")
include("./matrixgen.jl")
using .matrixgen

gauss_time = [];
gauss_memory = [];

gauss_pivot_time = [];
gauss_pivot_memory = [];

gauss_lu_time = [];
gauss_lu_memory = [];

gauss_lu_pivot_time = [];
gauss_lu_pivot_memory = [];

function runner(A,b,n,l)
   
    gauss(A,b,n,l)
    gauss_solver(A,b,n,l)
end

n = [500,1000, 1500, 2000, 3000, 4000, 5000, 10000,20000, 30000, 40000, 50000]
l = 4
number_of_series = 20
cond = Float64(1.0)

function data_collector()
       for i in 1:length(n)
        print(i)
        timer = []; memory = []
        for j in 1:number_of_series
            
            blockmat(n[i], l, cond,"gausstest2.txt")
            IOStreamA = open("gausstest2.txt")
            line = readline(IOStreamA)
            A = matrixA(IOStreamA,n[i])
            b = create_B(A, n[i], l)
            results  = @timed runner(A, b, n[i], l)
            push!(timer,results[2])
            push!(memory,results[3])
        end
        push!(gauss_time,mean(timer))
        push!(gauss_memory,mean(memory))
    end
end

data_collector()

using Plots

plot(n, gauss_time, label="Gauss_time", linewidth=1.0)
plot!(n, gauss_pivot_time, label="Gauss_pivot_time", linewidth=1.0)
plot!(n, gauss_lu_time, label="Gauss_lu_time", linewidth=1.0)
plot!(n, gauss_lu_pivot_time, label="Gauss_lu_pivot_time", linewidth=1.0)
savefig("solving2.png")

plot(n, gauss_memory, label="Gauss_memory", linewidth=1.0)
plot!(n, gauss_pivot_memory, label="Gauss_pivot_memory", linewidth=1.0)
plot!(n, gauss_lu_memory, label="Gauss_lu_memory", linewidth=1.0)
plot!(n, gauss_lu_pivot_memory, label="Gauss_lu_pivot_memory", linewidth=1.0)
savefig("memory2.png")

IOStreamA = open("Input/16/A.txt")
IOStreamB = open("Input/16/b.txt")
line = readline(IOStreamA)
inputs = split(line)
n = parse(Int, inputs[1])
l = parse(Int, inputs[2])
A = matrixA(IOStreamA,n)
b = vecB(IOStreamB)
gauss(A,b,n,l)
saver("name.txt",gauss_solver(A,b,n,l),n)
