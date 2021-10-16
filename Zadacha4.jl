
function main(::Robot)
    ox=0
    oy=0
    maxx=0
    while (isborder(r,Sud)==false)
        move!(r,Sud)
        oy=oy+1
    end
    while (isborder(r,West)==false)
        move!(r,West)
        ox=ox+1
    end
    while (isborder(r,Ost)==false)
        move!(r,Ost)
        maxx=maxx+1
    end
    back(r)
    while((maxx>0) || (isborder(r,Nord)==false))
        for i in 1:maxx
            putmarker!(r)
            move!(r,Ost)
        end
        putmarker!(r)
        if (isborder(r,Nord)==false)
            move!(r,Nord)
        end;
        maxx=maxx-1
        back(r)
    end
    while (isborder(r,Sud)==false)
        move!(r,Sud)
    end
    return_back(r,ox,oy)
end

function return_back(::Robot,ox::Int,oy::Int)
    for i in 1:ox
        move!(r,Ost)
    end
    for i in 1:oy
        move!(r,Nord)
    end
end
function back(::Robot)
    while (isborder(r,West)==false)
        move!(r,West)
    end
end
