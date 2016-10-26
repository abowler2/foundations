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

def palindrome?(string)
  string == string.reverse && string.size > 1
end

def palindromes(string)
  substring_result = substrings(string)
  result = []
  substring_result.each do |substring|
    result << substring if palindrome?(substring)
  end
  result
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]