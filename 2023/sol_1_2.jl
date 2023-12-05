#=
Part Two
=#

data = open("2023/data_1.txt") do file
    readlines(file)
end

dictionary = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

for i in data 

    index = findfirst(==(i), data)
    temp = []
    position_vec = []
    
    for digit in dictionary

        if occursin(digit, i)
            push!(temp, digit)

        end

    end

    for each in temp 

        position = findfirst(each, i)
        push!(position_vec, position)

    end

    leng = length(temp)

    for len in 1:leng

        min_pos = minimum(position_vec)
        curr_pos = findfirst(==(min_pos), position_vec)
        dig = temp[curr_pos]

        i = replace(i, dig => string(findfirst(==(dig), dictionary)) * dig )

        deleteat!(temp, findfirst(==(dig), temp))
        deleteat!(position_vec, findfirst(==(min_pos), position_vec))

    end

    data[index] = i

end

sum = 0 

for i in data

    temp = []

    for element in i

        try
            element = parse(Int64, element)
            push