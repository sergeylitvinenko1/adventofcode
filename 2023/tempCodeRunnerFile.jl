        try
        !(isa(parse(Int64, j[end]), Number))

        catch 
        j = chop(j, tail=1)
            # println(j)
        end