#=
Part Two
=#

data = open("2023/data_4.txt") do file
    readlines(file)
end

result_array = []

for value in data
    
    b = findfirst(x -> x == ':', value) + 2
    row = value[b:end]
    row_split = split(row, "|")

    winning = split(row_split[1], " ")
    winning = [i for i in winning if i != ""]
    winning = [parse(Int64, x) for x in winning]

    my_num = split(row_split[2], " ")
    my_num = [i for i in my_num if i != ""]
    my_num = [parse(Int64, x) for x in my_num]

    count = 0

    for each in my_num

        if each in winning

            count = count + 1

        end
        
    end

    push!(result_array, count)

end

total_instances = fill(1, length(data))

for (index, value) in enumerate(result_array)

    for each in 1:total_instances[index]

        for i in 1:value

            total_instances[index + i] = total_instances[index + i] + 1

        end

    end

end

println(total_instances)

sum_result = sum(total_instances)

println(sum_result)