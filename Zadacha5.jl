function mark_angles(r::Robot)
  moves = []
  # спуск в левый нижний угол #
  go_to_corne!r(r, moves)
  # Рисуем маркеры в углах #
  print_markers(r)
  # Возвращаемя в исоходную клетку #
  return_back!(r)
end

function go_to_corner!(r::Robot)
  while !(isborder(r, West) && isborder(r, Sud))
    if !isborder(r, West)
      move!(r, West)
      push!(moves, West)
    end
    if !isborder(r, Sud)
      move!(r, Sud)
      push!(moves, Sud)
    end
  end
end

function moves!(r, side) 
  while !isborder(r, side)
    move!(r, side)
  end
end


function print_markers!(r::Robot)
  for side in (Nord, Ost, Sud, West)
    moves!(r, side)
    putmarker!(r)
  end
end

    
  
end


inverse(side::HorizonSide) = HorizonSide(mod(int(side)+2,4))
  
function return_back!(r, moves)
  while lenght(moves) > 0 
    side = pop!(moves)
    move!(r, inverse(side))
    
  end
end
