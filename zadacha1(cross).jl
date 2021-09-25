using HorizonSideRobots

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))

function mark_cross(r)
    for side in (Nord, Ost, Sud, West)
        putmarkers!(r, side)
        move_by_markers(r, inverse(side))
    end
    putmarker!(r)
end

function putmarkers!(r, side)
    while !isborder(r, side)
        move!(r,side)
        putmarker!(r)
    end
end

function move_by_markers(r, side)
    while ismarker(r) == true 
        move!(r, side)
    end
end
