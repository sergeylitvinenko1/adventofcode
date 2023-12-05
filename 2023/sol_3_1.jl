#=
Part One
=#

data = open("2023/data_3.txt") do file
    readlines(file)
end

sum = 0 
num_array = Array[]
position_array = Array[]

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
            index = findnext(j, i, last)
            push!(position_vec, index)
            last = position_vec[end][end]

        catch
        end

    end
    push!(num_array, new_vec)
    push!(position_array, position_vec)
end 

# println(position_array[1])
println(num_array[46])


for (index_i, value_i) in enumerate(position_array)

    if index_i == 1

        for (index_j, value_j)  in enumerate(value_i)

            begin_index = first(value_j) - 1
            end_index = last(value_j) + 1

            if begin_index == 0

                try
            
                    if string(data[index_i][end_index]) != "." || string(data[index_i+1][end_index]) != "." || !(all(x -> x == '.', string(data[index_i+1][value_j]))) # !(all(ispunct, string(data[index_i+1][value_j])))
                        
                        # println(num_array[index_i][index_j])
                        global sum = sum + num_array[index_i][index_j]
        
                    end
        
                catch
                        
                end

            elseif end_index > length(data[index_i])
            
                try
            
                    if string(data[index_i][begin_index]) != "." || string(data[index_i+1][begin_index]) != "." || !(all(x -> x == '.', string(data[index_i+1][value_j]))) # !(all(ispunct, string(data[index_i+1][value_j])))
                        
                        global sum = sum + num_array[index_i][index_j]
        
                    end
        
                catch
                        
                end
            
            else

                try
            
            
                    if string(data[index_i][begin_index]) != "." || string(data[index_i][end_index]) != "." || string(data[index_i+1][begin_index]) != "." || string(data[index_i+1][end_index]) != "." || !(all(x -> x == '.', string(data[index_i+1][value_j]))) # !(all(ispunct, string(data[index_i+1][value_j])))
                        
                        global sum = sum + num_array[index_i][index_j]
        
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

                    if string(data[index_i][end_index]) != "." || string(data[index_i-1][end_index]) != "." || string(data[index_i+1][end_index]) != "." || !(all(x -> x == '.', string(data[index_i+1][value_j]))) || !(all(x -> x == '.', string(data[index_i-1][value_j]))) # !(all(ispunct, string(data[index_i-1][value_j]))) || !(all(ispunct, string(data[index_i+1][value_j])))
        
                        global sum = sum + num_array[index_i][index_j]
        
                    end 
        
                catch
        
                end


            elseif end_index > length(data[index_i])

                try

                    if string(data[index_i][begin_index]) != "." || string(data[index_i-1][begin_index]) != "." || string(data[index_i+1][begin_index]) != "." || !(all(x -> x == '.', string(data[index_i+1][value_j]))) || !(all(x -> x == '.', string(data[index_i-1][value_j]))) # !(all(ispunct, string(data[index_i-1][value_j]))) || !(all(ispunct, string(data[index_i+1][value_j])))
        
                        global sum = sum + num_array[index_i][index_j]
        
                    end 
        
                catch
        
                end

            else

                try

                    if string(data[index_i][begin_index]) != "." || string(data[index_i][end_index]) != "." || string(data[index_i-1][begin_index]) != "." || string(data[index_i+1][begin_index]) != "." || string(data[index_i-1][end_index]) != "." || string(data[index_i+1][end_index]) != "." || !(all(x -> x == '.', string(data[index_i+1][value_j]))) || !(all(x -> x == '.', string(data[index_i-1][value_j]))) # !(all(ispunct, string(data[index_i-1][value_j]))) || !(all(ispunct, string(data[index_i+1][value_j])))
        
                        global sum = sum + num_array[index_i][index_j]
        
                    end 
        
                catch
        
                end

            end

        end

    else 

        for (index_j, value_j)  in enumerate(value_i)

            begin_index = first(value_j) - 1
            end_index = last(value_j) + 1

            if begin_index == 0

                try
            
                    if string(data[index_i][end_index]) != "." || string(data[index_i-1][end_index]) != "." || !(all(x -> x == '.', string(data[index_i-1][value_j]))) # !(all(ispunct, string(data[index_i-1][value_j])))
        
                        global sum = sum + num_array[index_i][index_j]
        
                    end 
                        
                catch
        
                end


            elseif end_index > length(data[index_i])

                try
            
                    if string(data[index_i][begin_index]) != "." || string(data[index_i-1][begin_index]) != "." || !(all(x -> x == '.', string(data[index_i-1][value_j]))) # !(all(ispunct, string(data[index_i-1][value_j])))
        
                        global sum = sum + num_array[index_i][index_j]
        
                    end 
                        
                catch
        
                end


            else

                try
            
                    if string(data[index_i][begin_index]) != "." || string(data[index_i][end_index]) != "." || string(data[index_i-1][begin_index]) != "." || string(data[index_i-1][end_index]) != "." || !(all(x -> x == '.', string(data[index_i-1][value_j]))) # !(all(ispunct, string(data[index_i-1][value_j])))
        
                        global sum = sum + num_array[index_i][index_j]
        
                    end 
                        
                catch
        
                end
           
            end

        end

    end

end

println("The sum is ", sum)