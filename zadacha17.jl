function main(r::Robot)
    num=0
    path = go_to_left_bottom_cormer_and_get_path(r)

    putmarker!(r)
    while !isborder(r,Ost)
        move!(r,Ost)
        putmarker!(r)
    end
    field_length=go_and_get_num_steps(r,West)

    while !isborder(r,Nord) && field_length > 0
        how_many_markers_must_delivery = field_length
        move!(r,Nord)
        while how_many_markers_must_delivery > 0
            putmarker!(r)
            how_many_markers_must_delivery -= go_left_through_the_obstacles_and_turn_steps(r,Ost)
        end
        return_through_obstacles(r,West)
        field_length-=1
    end

    go_left_bottom_corner(r)
    go_back(r,path)
end

function go_left_through_the_obstacles_and_turn_steps(r::Robot, side::HorizonSide) ::Int
    num_steps=0
    while isborder(r,side) && !isborder(r,next_oposite_clockwise(side))
        move!(r,next_oposite_clockwise(side))
        num_steps+=1
    end
    done_steps =0
    if !isborder(r,side)
        move!(r,side)
        done_steps +=1
    end
    if num_steps != 0
        while isborder(r, inverse(next_oposite_clockwise(side)))
            move!(r,side)
            done_steps +=1
        end
        for _ in 1:num_steps
            move!(r, inverse(next_oposite_clockwise(side)))
        end
    end
    return done_steps 
end

function return_through_obstacles(r::Robot, side::HorizonSide)
    done_steps = 1
    while done_steps !=0
        done_steps = go_left_through_the_obstacles_and_turn_steps(r,side)
    end
end


function go_left_bottom_corner(r::Robot)
    while isborder(r,West)==false || isborder(r,Sud)==false
        if isborder(r,West)==false
            move!(r,West)
        end
        if isborder(r,Sud)==false
            move!(r,Sud)
        end
    end
end


function go_and_get_num_steps(r::Robot,side::HorizonSide) :: Int
    n=0
    while isborder(r,side)==false
        move!(r,side)
        n=n+1
    end 
    return n
end

function go_to_left_bottom_cormer_and_get_path(r::Robot) ::Array
    path=[]
    while isborder(r,Sud)==false || isborder(r,West)==false
        if isborder(r,Sud)==false
            move!(r,Sud)
            push!(path,Nord)
        end
        if isborder(r,West)==false
            move!(r,West)
            push!(path,Ost)
        end
    end
    return path
end

next_oposite_clockwise(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))
