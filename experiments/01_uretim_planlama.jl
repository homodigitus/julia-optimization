include(joinpath(@__DIR__, "..", "src", "production_model.jl"))

result = solve_production()
println("Ürün A: ", result.product_a)
println("Ürün B: ", result.product_b)
println("Maksimum kâr: ", result.profit)
