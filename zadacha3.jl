using HorizonSideRobots
inverse(side::HorizonSide) = HorizonSide(mod(int(side)+2,4))


function markall(r::Robot)
    Nnord = moves!(r, Nord)
    Oost = moves!(r, Ost)
    while !isborder(r, Sud)
        putmarkers!(r, West)
        putmarker!(r)
        move!(r, Sud)
        putmarkers!(r, Ost)
        putmarker!(r)
        move!(r,Sud)
    end
    putmarkers!(r, West)
    putmarker!(r)
    while !isborder(r, Nord)
        move!(r, Nord)
    end
    while !isborder(r, Ost)
        move!(r, Ost)
    end
    putmarker!(r)
    moves!(r, Sud, Nnord)
    moves!(r, West, Oost)

end

function moves!(r, side)
    counter = 0 
    while !isborder(r, side)
        move!(r, side)
        counter += 1 
    end 
    return counter 
end 

function putmarkers!(r, side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
    end
end


function moves!(r::Robot, side::HorizonSide, num_steps::Int)
    for steps in 1:num_steps
        move!(r, side)
    end
end
