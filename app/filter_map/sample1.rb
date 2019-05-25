p (1..10).filter_map { |i| i * 2 if i.even? }

p (1..10).inject([]) { |a, i| i.even? ? a << (i * 2) : a }
p (1..10).reduce([]) { |a, i| i.even? ? a << (i * 2) : a }

p (1..10).each_with_object([]) { |i, a| a << i * 2 if i.even? }
