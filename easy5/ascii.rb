def ascii_value(string)
  string.empty? ? 0 : string.split('').map { |i| i = i.ord }.reduce(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0