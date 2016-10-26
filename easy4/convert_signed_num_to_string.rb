CHARS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(num)
  result = ''
  loop do
    num, remainder = num.divmod(10)
    result.prepend(CHARS[remainder])
    break if num == 0    
  end
  result
end

def signed_integer_to_string(num)
case num <=> 0
  when -1 then "-#{integer_to_string(-num)}"
  when +1 then "+#{integer_to_string(num)}"
  else         integer_to_string(num)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
