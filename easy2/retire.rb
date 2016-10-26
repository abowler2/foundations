puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

now = Time.now.year

years_to_retire = retire_age - age
retire_year = now + years_to_retire

puts "It's #{now}. You will retire in #{retire_year}."
puts "You have only #{years_to_retire} years of work to go!"
