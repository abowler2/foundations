def repeater(string)
  result = ''
  string.each_char { |char| result << char << char }
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''