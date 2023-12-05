#=
Part One
=#

data = open("2023/data_1.txt") do file
    readlines(file)
end

sum = 0 

for i in data

    temp = []

    for element in i

        try
            element = parse(Int64, element)
            push!(temp, element)
        catch

        end

    end

    num = first(temp) * 10 + last(temp)
    global sum = sum + num
    
end

println(sum)