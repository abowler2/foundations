def triangle(num)
  space = num - 1
  star = 1

  num.times do |n|
    puts (' ' * space) + ('*' * star)
    space -= 1
    star += 1
  end
end

triangle(5)
triangle(9)