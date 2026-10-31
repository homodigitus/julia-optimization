using JuMP
using HiGHS

"""İki ürün için kaynak kısıtlı üretim planlaması çöz."""
function solve_production(; capacity=100.0, material=80.0, silent=true)
    model = Model(HiGHS.Optimizer)
    silent && set_silent(model)
    @variable(model, x[1:2] >= 0)
    @objective(model, Max, 40x[1] + 30x[2])
    @constraint(model, 2x[1] + x[2] <= capacity)
    @constraint(model, x[1] + x[2] <= material)
    optimize!(model)
    termination_status(model) == MOI.OPTIMAL || error("Çözüm bulunamadı: $(termination_status(model))")
    return (product_a=value(x[1]), product_b=value(x[2]), profit=objective_value(model))
end
