def staggered_case(string)
  result = ''
  downcase = true
  string.chars.each do |char|
    if downcase
      result += char.upcase
    else
      result += char.downcase
    end
    downcase = !downcase
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'