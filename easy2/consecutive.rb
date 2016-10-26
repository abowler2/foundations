def calculate_sum(num)
  (1..num).inject(:+)
end

def calculate_product(num)
  (1..num).inject(:*)
end

num = nil

loop do
  puts "Please enter an integer greater than 0:"
  num = gets.chomp.to_i
  break if num > 0
  puts "The number must be greater than 0" 
end

loop do
puts "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp.downcase

  if choice.start_with?('s')
    puts "The sum of the integers between 1 and #{num} is #{calculate_sum(num)}."
    break
  elsif choice.start_with?('p')
    puts "The product of the integers between 1 and #{num} is #{calculate_product(num)}"
    break
  else
    puts "That is not a valid choice."
  end
end

