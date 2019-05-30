case 0
in Integer => a
  p "Integer: #{a}"
end

case [0, [1, 2]]
in [0, [1, _] => a]
  p a
end
