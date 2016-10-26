# My solution

puts "Enter the length of the room in meters: "
length = gets.chomp.to_f

puts "Enter the width of the room in meters: "
width = gets.chomp.to_f

meters = length * width.round(2)
feet = meters * 10.7639.round(2)

puts "The area of the room is #{meters} " + \
      "square meters (#{feet} square feet)"

# Suggested solution used constant for meter to feet conversion
# SQMETERS_TO_SQFEET = 10.7639 
# feet = meters * SQMETERS_TO_SQFEET.round(2)