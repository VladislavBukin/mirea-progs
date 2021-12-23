function main(r::Robot)

    path=go_to_right_upper_corner_and_get_path(r)
    i=0
    while !isborder(r,West)
        move!(r,West)
        i=i+1
    end

    n=i
    m=West
    while n==i
        move!(r,Sud)
        n=0
        m=inverse(m)
        while !isborder(r,m)
            move!(r,m)
            n=n+1
        end
    end

    while isborder(r,m)==true
        putmarker!(r)
        move!(r,Sud)
    end

    putmarker!(r)
    move!(r,m)

    while isborder(r,Nord)==true
        putmarker!(r)
        move!(r,m)
    end

    putmarker!(r)
    move!(r,Nord)

    m=inverse(m)

    while isborder(r,m)==true
        putmarker!(r)
        move!(r,Nord)
    end

    putmarker!(r)
    move!(r,m)

    while isborder(r,Sud)==true
        putmarker!(r)
        move!(r,m)
    end

    putmarker!(r)

    go_to_right_upper_corner_and_get_path(r)
    go_back(r,path)
end


inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))


function go_to_right_upper_corner_and_get_path(r::Robot) ::Array
    path=[]
    while isborder(r,Nord)==false || isborder(r,Ost)==false
        if isborder(r,Nord)==false
            move!(r,Nord)
            push!(path,Sud)
        end
        if isborder(r,Ost)==false
            move!(r,Ost)
            push!(path,West)
        end
    end
    return path
end


function go_back(r,path::Array)
    n=length(path)
    while n>0
        move!(r,path[n])
        n=n-1
    end
end
