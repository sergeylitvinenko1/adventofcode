#=
Part One
=#

data = open("2023/data_4.txt") do file
    readlines(file)
end

sum = 0

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

    if count > 0

        global sum = sum + (2^(count-1))

    end

end

println("The answer is ", sum)