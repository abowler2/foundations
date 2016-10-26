# My solution 

def average(arr)
  sum = 0
  arr.each { |n| sum += n }
  sum / arr.length
end


puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Suggested solution

def average(numbers)
  sum = numbers.reduce(:+)  #(:+) equates to the block { |sum| sum + number }
  sum.to_f / numbers.count
end

puts average([1, 5, 87, 45, 8, 8]) == 25.0
puts average([9, 47, 23, 95, 16, 52]) == 40.0
