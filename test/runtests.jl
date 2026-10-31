using Test
include(joinpath(@__DIR__, "..", "src", "production_model.jl"))

@testset "Üretim planlama" begin
    r = solve_production()
    @test r.product_a ≈ 20.0 atol=1e-6
    @test r.product_b ≈ 60.0 atol=1e-6
    @test r.profit ≈ 2600.0 atol=1e-6
end
