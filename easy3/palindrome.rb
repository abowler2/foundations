def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

def palindrome2?(array)
  array == array.reverse
end

p palindrome2?([1, 2, 3, 2, 1]) == true
p palindrome2?([1, 2, 3, 1, 1]) == false

def palindrome3?(obj)
  obj == obj.reverse
end

p palindrome3?('madam') == true
p palindrome3?('Madam') == false
p palindrome3?([1, 2, 3, 2, 1]) == true
p palindrome3?([1, 2, 3, 4, 1]) == false