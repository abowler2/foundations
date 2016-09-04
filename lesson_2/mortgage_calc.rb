# Mortgage Calculator

# need loan amount
# need APR (annual percentage rate)
# need loan duration

# calculate monthly interest rate
# calculate duration in months

# formula: m = p * (j / (1 - (1 + j)**-n))
# m = monthly payment, p = loan amount,
# j = monthly interest rate, n = loan duration in months

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num && num.to_f > 0
end

def valid_float?(num)
  num.to_f.to_s == num && num.to_f > 0
end

def number?(input)
  valid_float?(input) || valid_number?(input)
end

prompt "Welcome to the Mortgage Calculator!"

p = ''

loop do
  prompt "Please enter your loan amount:"
  p = gets.chomp

  if valid_number?(p)
    break
  else
    puts "Please enter a valid loan amount."
  end
end

j = ''

loop do
  prompt "What is your Annual Percentage Rate (APR)?"
  j = gets.chomp

  if number?(j)
    break
  else
    puts "Please enter a valid interest rate."
  end
end

duration = ''

loop do
  prompt "How many years is your loan duration?"
  duration = gets.chomp

  if valid_number?(duration)
    break
  else
    puts "Please enter a valid duration in years for your loan."
  end
end

months = duration.to_i * 12

interest = (j.to_f / 12) / 100

m = p.to_i * (interest / (1 - (1 + interest)**-months))

puts "Your montly payment is $#{m.round(2)}"
