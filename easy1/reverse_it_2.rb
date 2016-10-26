# my solution (does not account for words smaller than 5 chars)

def reverse_words(string)
  string.reverse.split.reverse.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => klaW dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Given solution

def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS