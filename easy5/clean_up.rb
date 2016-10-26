def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '

# without regular expressions
LETTERS = ('a'..'z').to_a

def cleanup2(string)
  arr = string.downcase.split("").each do |char|
    if !LETTERS.include?(char)
      char.gsub(" ")
    end
  end
    arr.join.squeeze
end


p cleanup("---what's my +*& line?") == ' what s my line '