puts "What is your name?"
name = gets.chomp.capitalize

if name.end_with?('!')
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end


