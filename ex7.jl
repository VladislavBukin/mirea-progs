function main(r)
    x=y=0
    koaf=1
    while (!isborder(r,Sud))
        move!(r,Sud)
        y+=1
        koaf=(koaf+1)%2
    end
    while (!isborder(r,West))
        move!(r,West)
        x+=1
        koaf=(koaf+1)%2
    end
    moveess(r,Ost,koaf)
    while (!isborder(r,Nord))
        for i in (West,Ost)
            if (!isborder(r,Nord))      
                move!(r,Nord)         
                moveess(r,i,koaf)
            end
        end
    end
    while (!isborder(r,Sud))
        move!(r,Sud)
    end
    while (!isborder(r,West))
        move!(r,West)
    end
    go_back(r,x,y)
end

function moveess(r, side,koaf::Int)
    if (koaf==1)
        putmarker!(r)
    end
    while (!isborder(r,side))
        move!(r,side)
        koaf=(koaf+1)%2
        if (koaf==1)
            putmarker!(r)
        end
    end
end

function go_back(r, x::Int , y::Int)
    for i in 1:x 
        move!(r, Ost)
    end
    for i in 1:y
        move!(r, Nord)
    end
end

