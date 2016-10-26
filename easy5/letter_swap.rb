def swap_chars(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap (string)
  result = string.split.map do |word|
    swap_chars(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'