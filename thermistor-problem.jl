using Polynomials
using CSV: file
using DataFrames: DataFrame!
using Plots



T_R_raw = file("./data/temp_control_data.csv", 1) |> DataFrame!

data_points = convert(Matrix, T_R_raw[:,1:2])

poly = fit(data_points[:,1], data_points[:,2], 1)

y_lin = map(poly, data_points[:,1])

Plots.plot(data_points[:,1], [data_points[:,2] y_lin])