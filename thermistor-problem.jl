using Polynomials
using CSV
using DataFrames
using Plots



T_R_raw = CSV.file("./data/temp_control_data.csv", 1) |> DataFrames.DataFrame!

data_points = convert(Matrix, T_R_raw[:,1:2])

poly = fit(data_points[:,1], data_points[:,2], 1)

y_lin = map(poly, data_points[:,1])

poly_tri = fit(data_points[:,1], data_points[:,2], 3) # sufficient polynominal approxymation

y_tri = map(poly_tri, data_points[:,1])

Plots.plot(data_points[:,1], [data_points[:,2] y_lin y_tri])