function ex13(r::Robot)
  x = 0
  y = 0 
  while !isborder(r, Sud)
    move!(r, Sud)
    y += 1 
  end 
  while !isborder(r, West)
    move!(r, West)
    x += 1 
  end 

  putmarkerss(r)

  for i in 1:x
    move!(r, Ost)
  end

  for i in 1:y
    move!(r, Nord)
  end

end

function putmarkerss(r::Robot)
  putmarker!(r)
  funcname(r, Nord)
  while !isborder(r, West)
    move!(r, West)
  end
  putmarker!(r)
  funcname(r, Sud)
  while !isborder(r, West)
    move!(r, West)
  end
end


function funcname(r::Robot, side::HorizonSide)
  while !isborder(r, side) && !isborder(r, Ost)
    move!(r, side)
    move!(r, Ost)
    putmarker!(r)
  end
end
