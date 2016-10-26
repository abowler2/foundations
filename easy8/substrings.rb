def substrings_at_start(string)
  substrings = []
  0.upto(string.size - 1) do |index|
    substrings << string[0..index]
  end
  substrings
end

def substrings(string)
  result = []
  (0...string.size).each do |start|
    substring = string[start..- 1]
    result.concat(substrings_at_start(substring))
  end
  result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
