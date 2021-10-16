moves = []
function mark_angles(r::Robot)
    go_to_corner!(r, moves)
    print_markers(r)
    return_back!(r::Robot, moves)
end

function go_to_corner!(r, moves)
    while !(isborder(r, West) && isborder(r, Sud))
        if !isborder(r, West)
            move!(r, West)
            push!(moves, West)
        end
        if !isborder(r, Sud)
            move!(r, Sud)
            push!(moves, Sud)
        end
    end
end


function moves!(r, side)
    while !isborder(r, side)
        move!(r, side)
    end
end

function print_markers(r)
    for side in (Nord, Ost, Sud, West)
        moves!(r,side)
        putmarker!(r)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))

function return_back!(r::Robot, moves)
    while length(moves) > 0 
        side = pop!(moves)
        move!(r, inverse(side))
    end
end
