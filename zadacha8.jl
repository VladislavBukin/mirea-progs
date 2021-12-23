function main(::Robot)
  i = 1 
  while isborder(r, Nord)
    move_to_the_side!(r, i, West)
    move_to_the_side!(r, i, Ost)
    move_to_the_side!(r, i, Ost)
    move_to_the_side!(r, i, West)
    i += 1 
  end
end


function move_to_the_side!(::Robot, j::Int, side::HorizonSide)
  for i in 1:j
    if isborder(r,Nord)
      move!(r, side)
    end
  end
end
