def multisum(num)
  multiples = []
  sum = 0
  (1..num).each { |x| multiples << x if x % 3 == 0 || x % 5 == 0 }
  sum = multiples.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168