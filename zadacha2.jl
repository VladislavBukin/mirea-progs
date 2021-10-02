function perimeter(r)
    oy = moves!(r, Nord)
    ox = moves!(r, Ost)
    for side in [Sud, West, Nord, Ost]
        putmarkers!(r,side)
    end
    moves!(r,Sud, oy)
    moves!(r, West, ox)
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
