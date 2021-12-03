function main(::Robot)
  i = 1 
  while isborder(r, Nord)
    movess!(r, i, West)
    movess!(r, i, Ost)
    movess!(r, i, Ost)
    movess!(r, i, West)
    i += 1 
  end
end


function movess!(::Robot, j::Int, side::HorizonSide)
  for i in 1:j
    if isborder(r,Nord)
      move!(r, side)
    end
  end
end
