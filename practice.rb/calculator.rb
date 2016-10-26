def prompt(msg)
  puts "=> #{msg}"
end

def valid_num?(number)
  number.to_i.to_s == number
end

prompt "Welcome to Calculator!"

loop do
num1 = ''
num2 = ''

loop do
  prompt "Please give me a number:"
  num1 = gets.chomp
    if valid_num?(num1)
      break
    else
      prompt "That is not a valid number!"
    end
end

loop do
  prompt "Please give me another number:"
  num2 = gets.chomp
    if valid_num?(num2)
      break
    else
      prompt "That is not a valid number!"
    end
end

operation = ''

loop do
  prompt "What operation would you like to perform? (+, -, *, /)"
  operation = gets.chomp
    if %w(+ - * /).include?(operation)
      break
    else
      prompt "That is not a valid choice."
    end
end  

  result = case operation
    
    when '+'
     num1.to_i + num2.to_i
    when '-'
      num1.to_i - num2.to_i
    when '*'
      num1.to_i * num2.to_i
    when '/'
      num1.to_f / num2.to_f
    end

prompt "The result of (#{num1} #{operation} #{num2}) is #{result}"

prompt "Do you want to do another calculation?"
answer = gets.chomp.downcase
break unless answer.start_with?('y')

end

prompt "Thank you for using Caluclator!"

