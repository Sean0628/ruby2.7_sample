a = 0
begin
case 1
in ^a
  :unreachable
end
rescue NoMatchingPatternError => e
  p e
end

a = 0
case 1
in a
  p :reachable
end
