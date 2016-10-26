def reverse!(array)
  list = []
  array.length.times { list << array.pop }
  array = list
end

p reverse!(['a', 'b', 'c', 'd', 'e'])