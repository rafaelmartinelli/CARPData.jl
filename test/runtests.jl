using CARPData
using Test

@testset "kshs" begin
    data = load(:kshs3)
    @test data.lb == 9320
    @test data.ub == 9320
    @test data.name == "kshs3"
    @test length(data.vertices) == 6
    @test length(data.edges) == 15
    @test length(data.requireds) == 15
end

@testset "gdb" begin
    data = load(:gdb8)
    @test data.lb == 348
    @test data.ub == 348
    @test data.name == "gdb8"
    @test length(data.vertices) == 27
    @test length(data.edges) == 46
    @test length(data.requireds) == 46
end

@testset "val" begin
    data = load(:val9B)
    @test data.lb == 326
    @test data.lb == 326
    @test data.name == "val9B"
    @test length(data.vertices) == 50
    @test length(data.edges) == 92
    @test length(data.requireds) == 92
end

@testset "egl" begin
    data = load(:egl_s2_A)
    @test data.lb == 9838
    @test data.ub == 9875
    @test data.name == "egl-s2-A"
    @test length(data.vertices) == 140
    @test length(data.edges) == 190
    @test length(data.requireds) == 147
end

@testset "beullens" begin
    data = load(:F16)
    @test data.lb == 2725
    @test data.ub == 2725
    @test data.name == "F16"
    @test length(data.vertices) == 60
    @test length(data.edges) == 80
    @test length(data.requireds) == 54
end

@testset "egl-large" begin
    data = load(:egl_g1_E)
    @test data.lb == 1461469
    @test data.ub == 1506493
    @test data.name == "egl-g1-E"
    @test length(data.vertices) == 255
    @test length(data.edges) == 375
    @test length(data.requireds) == 347
end

@testset "other" begin
    data = load(:A10A)
    @test data.lb == 80
    @test data.ub == 93
    @test data.name == "A10A"
    @test length(data.vertices) == 10
    @test length(data.edges) == 15
    @test length(data.requireds) == 11
end

@testset "Load string" begin
    data = load(joinpath(@__DIR__, "../data/kshs1.dat"))
    @test data !== nothing
    data = load("not a file")
    @test data === nothing
end

@testset "Base.show methods" begin
    data = load(:kshs3)
    show(stderr, data)
    print("\n")
    show(stderr, data.edges[1])
    print("\n")
    show(stderr, data.vertices[1])
    print("\n")
end