#=
Part One
=#

data = open("2023/data_4.txt") do file
    readlines(file)
end

sum = 0

for value in data
    b = findfirst(x -> x == ':', value) + 2
    row = value[b: