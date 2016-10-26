=begin

# my attempt 

def odd(num)
  num % 2 != 0  
end

p odd(2)
p odd(5)
p odd(-17)
p odd(-8)
p odd(7.1)
p odd(-5.0)

# does not handle floats
=end
def odd(num)
  num % 2 == 1
end

p odd(2)
p odd(5)
p odd(-17)
p odd(-8)
p odd(7.1)
p odd(-5.0)
