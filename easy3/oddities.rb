
=begin
# Version 1
def oddities(array)
  array.select { |x| array.index(x) % 2 == 0 }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
=end

# Version 2
def oddities(array)
  odd = []
  array.each_index { |x| odd << array[x] if x % 2 == 0 }
  odd
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []