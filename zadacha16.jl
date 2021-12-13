function main(r::Robot)
    x=Ost
    y=Nord
    path = go_to_left_bottom_corner_and_get_path(r)
    while !isborder(r,x)
        mark_direction(r,y)
        if !isborder(r,x)
            move!(r,x)
        end
        side_vert=inverse(y)
    end
    mark_direction(r,y)
    go_to_left_bottom_corner(r)
    go_back(r,path)
end

function mark_direction(r::Robot,side::HorizonSide)
    putmarker!(r)
    while try_move(r,side) == true
        putmarker!(r)
    end
    while try_move(r,inverse(side))
        ;
    end
end


function go_to_left_bottom_corner_and_get_path(r::Robot) ::Array
    path=[]
    while !isborder(r,Sud) || !isborder(r,West)
        if !isborder(r,Sud)
            move!(r,Sud)
            push!(path,Nord)
        end
        if !isborder(r,West)
            move!(r,West)
            push!(path,Ost)
        end
    end
    return path
end


function mark_direction(r,side::HorizonSide)
    while !isborder(r,side)
        putmarker!(r)    
        move!(r,side)
    end
    putmarker!(r)
end


inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))
next_clockwise(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))

function go_to_left_bottom_corner(r::Robot)
    while !isborder(r,West) || !isborder(r,Sud)
        if !isborder(r,West)
            move!(r,West)
        end
        if !isborder(r,Sud)
            move!(r,Sud)
        end
    end
end


function go_back(r,path::Array)
    n=length(path)
    while n>0
        move!(r,path[n])
        n=n-1
    end
end


function try_move(r::Robot, direct_side::HorizonSide)::Bool
    orthogonal_side = next_clockwise(direct_side)
    reverse_side = inverse(orthogonal_side)
    num_steps=0
    if !isborder(r,direct_side)
        move!(r,direct_side)
        result=true
    else
        while isborder(r,direct_side) == true
            if !isborder(r, orthogonal_side)
                move!(r, orthogonal_side)
                num_steps += 1
            else
                break
            end
        end
        if !isborder(r,direct_side)
            move!(r,direct_side)
            while isborder(r,reverse_side) == true
                move!(r,direct_side)
            end
            result = true
        else
            result = false
        end
        while num_steps>0
            num_steps=num_steps-1
            move!(r,reverse_side)
        end
    end
    return result
end
