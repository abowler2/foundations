# my solution

def stringy(int)
  string = []
  str = nil
  int.times do |num|
    if num % 2 == 0
      str = '1'
    else
      str = '0'
    end
    string << str
  end
   string.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Given solution

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Further exploration
# Add optional argument set to 0 ; method should return starting with 0 instead of 1

def stringy(size, start = 0)
  numbers = []
  size.times do |index|
    if start == 1
      number = index.even? ? 1 : 0
      numbers << number
    else 
      number = index.even? ? 0 : 1
      numbers << number
    end
  end
  numbers.join
end

puts stringy(6)
puts stringy(9)
puts stringy(4, 1)
puts stringy(7, 1)

