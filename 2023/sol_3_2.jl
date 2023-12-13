#=
Part Two
=#

data = open("2023/data_3.txt") do file
    readlines(file)
end

sum = 0 
num_array = Array[]
position_array = Array[]

num_array_ast = []
position_array_ast = []
position_array_ast_loc = []
position_array_triggers = []

data_1 = []

for i in data
    push!(data_1, replace(i, '*'=> "."))
end

for i in data_1

    last = 1
    new_vec = []
    position_vec = []
    i_split = split(i, ".")

    for j in i_split

        try isa(parse(Int64, j[1]), Number)

        catch 
            j = chop(j, head=1, tail=0)
        end
        
        try isa(parse(Int64, j[end]), Number)

        catch 
            j = chop(j)
        end   

        try

            j_num = parse(Int64, j)
            push!(new_vec, j_num)
            j_str = string(j_num)

            if last == 1
                last = 0
            end 

            index = findnext(j, i, last+1)
            push!(position_vec, index)
            last = position_vec[end][end]

        catch
        end

    end
    push!(num_array, new_vec)
    push!(position_array, position_vec)
end 

for (index_i, value_i) in enumerate(position_array)

    if index_i == 1

        for (index_j, value_j)  in enumerate(value_i)

            begin_index = first(value_j) - 1
            end_index = last(value_j) + 1

            if begin_index == 0

                try
            
                    if string(data[index_i][end_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i, end_index])

                    elseif string(data[index_i+1][end_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i+1, end_index])

                    elseif any(x -> x == '*', string(data[index_i+1][value_j]))

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        # push!(position_array_triggers, [index_i+1, value_j])

                        push!(position_array_triggers, [index_i+1, value_j[findfirst(x -> x == '*', data[index_i+1][value_j])]])
        
                    end
        
                catch
                        
                end

            elseif end_index > length(data[index_i])
            
                try
            
                    if string(data[index_i][begin_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i, begin_index])

                    elseif string(data[index_i+1][begin_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i+1, begin_index])

                    elseif any(x -> x == '*', string(data[index_i+1][value_j]))

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        # push!(position_array_triggers, [index_i+1, value_j])

                        push!(position_array_triggers, [index_i+1, value_j[findfirst(x -> x == '*', data[index_i+1][value_j])]])
        
                    end
        
                catch
                        
                end
            
            else

                try
            
            
                    if string(data[index_i][begin_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i, begin_index])

                    elseif string(data[index_i][end_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i, end_index])

                    elseif string(data[index_i+1][begin_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i+1, begin_index])

                    elseif string(data[index_i+1][end_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i+1, end_index])

                    elseif any(x -> x == '*', string(data[index_i+1][value_j]))

                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        # push!(position_array_triggers, [index_i+1, value_j])

                        push!(position_array_triggers, [index_i+1, value_j[findfirst(x -> x == '*', data[index_i+1][value_j])]])
        
                    end
        
                catch
                        
                end

            end 

        end 
    
    elseif index_i > 1 && index_i < length(position_array)

        for (index_j, value_j)  in enumerate(value_i)

            begin_index = first(value_j) - 1
            end_index = last(value_j) + 1

            if begin_index == 0

                try

                    if string(data[index_i][end_index]) == "*"
        
                        temp = num_array[index_i][index_j]
                        
                        push!(num_array_ast, temp)

                        push!(position_array_ast, [index_i, index_j])

                        push!(position_array_triggers, [index_i, end_index])

                    elseif string(data[index_i-1][end_index]) == "*"

                        temp = num_array[index_i][index_j]
                        
                        push!(n