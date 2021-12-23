function main(::Robot)
    j = 2 
    while !ismarker(r)
      if !ismarker(r)
        move!(r, Nord)
      end
      if !ismarker(r)
        move!(r,West)
      end
      spiral!(r, j)
      j += 2
  
    end
end
  
  
function spiral!(::Robot, j::Int)
    help_moves!(r, j, Ost)
    help_moves!(r, j, Sud)
    help_moves!(r, j, West)
    help_moves!(r, j, Nord)
end
  
function help_moves!(::Robot, j::Int, side::HorizonSide)
    for i in 1:j 
      if !ismarker(r)
        move!(r, side)
      end
    end
end
