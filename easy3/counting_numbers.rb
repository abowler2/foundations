puts "Please write word or multiple words:"
words = gets.chomp

char_count = words.delete(" ").size

puts "There are #{char_count} characters in #{words}"
