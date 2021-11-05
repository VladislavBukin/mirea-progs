function ex6(::Robot)
    x1=x2=y1=y2=0
    chetn=1
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        y1=y1+1
    end
    while (isborder(r,West)==false)
        move!(r,West)
        x1=x1+1
    end
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        y2=y2+1
    end
    while (isborder(r,West)==false)
        move!(r,West)
        x2=x2+1
    end
    while (isborder(r,Nord)==false)
        while (isborder(r,Nord)==false && isborder(r,Ost)==false)
            move!(r,Ost)
        end
        if (isborder(r,Nord)==false)
            move!(r,Nord)
            chetn=2;
        end
        while (isborder(r,Nord)==false && isborder(r,West)==false)
            move!(r,West)
        end
        if (isborder(r,Nord)==false)
            move!(r,Nord)
            chetn=1
        end
    end
    if (chetn==1)
        moves2(r,Nord,Ost)
        putmarker!(r)
        move!(r,Nord)
        moves2(r,West,Nord)
        putmarker!(r)
        move!(r,West)
        moves2(r,Sud,West)
        putmarker!(r)
        move!(r,Sud)
        moves2(r,Ost,Sud)
        putmarker!(r)
    else
        moves2(r,Nord,West)
        putmarker!(r)
        move!(r,Nord)
        moves2(r,Ost,Nord)
        putmarker!(r)
        move!(r,Ost)
        moves2(r,Sud,Ost)
        putmarker!(r)
        move!(r,Sud)
        moves2(r,West,Sud)
        putmarker!(r)
    end
    while (isborder(r,Sud)==false)
        move!(r,Sud)
    end
    while (isborder(r,West)==false)
        move!(r,West)
    end
    return_back(r,x1,x2,y1,y2)
end

function moves2(::Robot, side1::HorizonSide, side2::HorizonSide)
    while isborder(r,side1)
        putmarker!(r)
        move!(r,side2)
    end
end

function return_back(r::Robot, x1,x2,y1,y2)
    for i in 1:x2
        move!(r, Ost)
    end
    for i in 1:y2
        move!(r, Nord)
    end
    for i in 1:x1
        move!(r, Ost)
    end
    for i in 1:y1
        move!(r,Nord)
    end
end