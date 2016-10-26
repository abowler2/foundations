def reversed_number(num)
  number = num.to_s
  digits = number.chars
  reversed_digits = digits.reverse
  reversed_string = reversed_digits.join('')
  reversed_string.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1

# One line solution
def reversed_number(num)
  num.to_s.chars.reverse.join('').to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
