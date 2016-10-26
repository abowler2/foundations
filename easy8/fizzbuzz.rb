def fizzbuzz(num1, num2)
  result = []
  num1.upto(num2) do |num|
    if num % 3 == 0 && num % 5 == 0
      result << 'FizzBuzz'
    elsif num % 5 == 0
      result << 'Buzz'
    elsif num % 3 == 0 
      result << 'Fizz'
    else
      result << num
    end
  end
  result
end

p fizzbuzz(1, 15)