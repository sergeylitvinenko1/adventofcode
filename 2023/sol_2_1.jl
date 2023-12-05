#=
Part One
=#

data = open("2023/data_2.txt") do file
    readlines(file)
end

red_cubes = 12
green_cubes = 13
blue_cubes = 14

dictionary = ["red", "green", "blue"]

sum = 0

for i in data
    
    curr_game_id = index = findfirst(==(i), data)
    trial_red = 0
    trial_green = 0
    trial_blue = 0
    num_games = count(==(';'), i) + 1
    i_split = split(i, ";")
    value = 0
    
    for j in 1:num_games
        
        try
            index_red = findfirst(dictionary[1], i_split[j])[1] - 2
            trial_red = parse(Int64, string(i_split[j][(index_red-1):index_red]))
        catch
            trial_red = 0
        end 

        try
            index_green = findfirst(dictionary[2], i_split[j])[1] - 2
            trial_green = parse(Int64, string(i_split[j][(index_green-1):index_green]))
        catch
            trial_green = 0
        end

        try
            index_blue = findfirst(dictionary[3], i_split[j])[1] - 2
            trial_blue = parse(Int64, string(i_split[j][(index_blue-1):index_blue]))
        catch
            trial_blue = 0
        end

        # println(trial_red, "-", trial_green, "-", trial_blue)

        if trial_red > red_cubes || trial_green > green_cubes || trial_blue > blue_cubes
            value = 1
        end 

    end


    if value == 0

        global sum = sum + curr_game_id

    end 

end 

println(sum)