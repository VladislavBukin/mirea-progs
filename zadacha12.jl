function main(r::Robot,n::Int)
    x,y=go_to_left_bottom_corner_and_get_x_y(r)
    go_and_get_num_steps(r,Nord)
    all=go_and_get_num_steps(r,Sud)+1
    side=Nord
    t=0
    k=n
    kk=2n
    while isborder(r,Ost)==false
        if t>=k && t<kk
            for i in 1:n
                if isborder(r,side)==false
                    move!(r,side)
                end
            end
        end
        put_markers_in_direction(r,side,n,all)
        move!(r,Ost)
        side=inverse(side)
        go_and_get_num_steps(r,side)
        side=inverse(side)
        t=t+1
        if t>kk
            k=k+2n
            kk=kk+2n
        end
    end
    if t>=k && t<kk
        for i in 1:n
            if isborder(r,side)==false
                move!(r,side)
            end
        end
    end
    put_markers_in_direction(r,side,n,all)
    go_to_left_bottom_corner_and_get_x_y(r)
    go_back(r,x,y)
end


function put_markers_in_direction(r::Robot,side::HorizonSide,n::Int,all::Int)
    k=0
    ii=0
    while isborder(r,side)==false
        ii=0
        for i in 1:n
            if isborder(r,side)==false
                putmarker!(r)
                move!(r,side)
                k=k+1
                ii=ii+1
            end
        end
        if isborder(r,side)==true && ii!=n
            putmarker!(r)
        end
        for j in 1:n
            if isborder(r,side)==false
                move!(r,side)
                k=k+1
            end
        end
    end
    mm=2n+1
    while all>=mm
        if all==mm
            move!(r,HorizonSide(mod(Int(side)+2,4)))
            if ismarker(r)==false
                move!(r,side)
                putmarker!(r)
            end
        end
        mm=mm+3n
    end

    return k
end


function go_to_left_bottom_corner_and_get_x_y(r::Robot)
    x=0
    y=0
    while isborder(r,West)==false
        move!(r,West)
        x=x+1
    end
    while isborder(r,Sud)==false
        move!(r,Sud)
        y=y+1
    end
    return (x,y)
end

function go_and_get_num_steps(r::Robot,side::HorizonSide) :: Int
    n=0
    while isborder(r,side)==false
        move!(r,side)
        n=n+1
    end 
    return n
end

function go_back(r,x,y)
    for i in 1:x
        move!(r,Ost)
    end
    for j in 1:y
        move!(r,Nord)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))
