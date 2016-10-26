def substrings_at_start(string)
  substrings = []
  0.upto(string.size - 1) do |index|
    substrings << string[0..index]
  end
  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

