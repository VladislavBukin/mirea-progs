function main(::Robot)
  j = 2 
  while !ismarker(r)
    if !ismarker(r)
      move!(r, Nord)
    end
    if !ismarker(r)
      move!(r,West)
    end
    movess!(r, j)
    j += 2

  end
end


function movess!(::Robot, j::Int)
  help_movess!(r, j, Ost)
  help_movess!(r, j, Sud)
  help_movess!(r, j, West)
  help_movess!(r, j, Nord)
end

function help_movess!(::Robot, j::Int, side::HorizonSide)
  for i in 1:j 
    if !ismarker(r)
      move!(r, side)
    end
  end
end
