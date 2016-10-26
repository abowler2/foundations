def print_in_box(msg)
   width = msg.length
   puts "+-#{'-' * width}-+"
   puts "| #{" " * width} |"
   puts "| #{      msg} |"
   puts "| #{" " * width} |"
   puts "+-#{'-' * width}-+"
end

print_in_box('To boldly go where no one has gone before.')