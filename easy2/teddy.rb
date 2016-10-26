
age = rand(20..200)

puts "Give me a name please: "
name = gets.chomp.capitalize
if name.empty?
  name = "Teddy"
else
  name
end

puts "#{name} is #{age} years old!"
