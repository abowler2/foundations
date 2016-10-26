def reverse(array)
  new_list = []
  array.reverse_each { |element| new_list << element}
  new_list
end

p reverse([1, 2, 3, 4, 5])