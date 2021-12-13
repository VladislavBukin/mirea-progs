function main(r::Robot)
    path = go_to_left_bottom_corner_and_get_path(r)

    for side in (Nord, Ost, Sud, West)
        go_and_get_num_steps(r,side)
        putmarker!(r)
    end

    go_back(r,path)
end

function go_to_left_bottom_corner_and_get_path(r::Robot) ::Array
    path=[]
    while isborder(r,Sud)==false || isborder(r,West)==false
        if isborder(r,Sud)==false
            move!(r,Sud)
            push!(path,Nord)
        end
        if isborder(r,West)==false
            move!(r,West)
            push!(path,Ost)
        end
    end
    return path
end

function go_and_get_num_steps(r::Robot,side::HorizonSide) :: Int
    n=0
    while isborder(r,side)==false
        move!(r,side)
        n=n+1
    end 
    return n
end

function go_back(r,path::Array)
    n=length(path)
    while n>0
        move!(r,path[n])
        n=n-1
    end
end
