#=
Part Two
=#

data = open("2023/data_2.txt") do file
    readlines(file)
end

dictionary = ["red", "green", "blue"]

sum = 0

for i in data
    
    power = 0 

    trial_red = 0
    trial_green = 0
    trial_blue = 0

    num_games = count(==(';'), i) + 1
    i_split = split(i, ";")

    reds = []
    greens = []
    blues = []
    
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

        push!(reds, trial_red)
        push!(greens, trial_green)
        push!(blues, trial_blue)

        # println(trial_red, "-", trial_green, "-", trial_blue)

    end

    max_red = maximum(reds)
    max_green = maximum(greens)
    max_blue = maximum(blues)

    power = max_red * max_green * max_blue

    global sum = sum + power

end 

println(sum)