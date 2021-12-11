function main(r)
    x = go_and_get_num_steps(r, West)
    y = go_and_get_num_steps(r, Sud)

    go_up_and_right(r)

    start_mark(r, Sud)
    if isborder(r, Sud)
        mark_side(r, Nord)
    end
    mark_side(r, Sud)

    move_n_steps(r, Nord, y)
    move_n_steps(r, Ost, x)
end


function go_and_get_num_steps(r::Robot, side::HorizonSide) :: Int
    n = 0 
    while !isborder(r, side)
        move!(r,side)
        n += 1
    end
    return n
end


function go_up_and_right(r::Robot)
    while !isborder(r, Nord)
        move!(r,Nord)
    end
    while !isborder(r, Ost)
        move!(r, Ost)
    end
end


function start_mark(r, side)
    while !isborder(r, West)
        mark_side(r, side)
        side = inverse(side)
        move!(r, West)
    end
end


function mark_side(r, side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
    end
    putmarker!(r)
end

inverse(side) = HorizonSide(mod(Int(side)+2,4))


function move_n_steps(r, side, n)
    while n>0
        move!(r, side)
        n = n - 1
    end
end
