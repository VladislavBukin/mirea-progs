function main(r)
    go_to_right_top_corner(r)
    global sum = 0 
    Snake(r)
    print(sum)
end

function go_to_right_top_corner(r)
    while !(isborder(r,West) && isborder(r,Sud))
        if (!isborder(r,Sud))
            move!(r,Sud)
        end
        if (!isborder(r,West))
            move!(r,West)
        end
    end
end

function moves(::Robot,side::HorizonSide)::Bool
    A=[]
    global sum
    kof = false
    if !isborder(r,side)
        move!(r,side)
    else
        while (isborder(r,side) && !isborder(r,Ost))
            move!(r,Ost); push!(A,Ost)
        end
        if isborder(r,side) && isborder(r,Ost)
            kof=true
        else 
            move!(r,side)
            check_line=false
            while (isborder(r,West))
                move!(r,side)
                check_line=true
            end
        end
        if !kof 
            if (!check_line)  
                sum+=1
            else
                sum+=2
            end
        end
        while (length(A)>0)
            side1=pop!(A); move!(r,inverse(side1))
        end
    end
    return kof
end

function Snake(r)
    side=Nord
    while !isborder(r,Ost)
        kof=false
        while (!kof)
            kof=moves(r,side)
        end
        side=inverse(side)
        move!(r,Ost)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))
