=begin
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

munsters.each do |name, value|
  puts "#{name} is a #{value['age']} year old #{value['gender']}."
end

#4

sentence = "Humpty Dumpty sat on a wall."

puts sentence.split(/\W/).reverse!.join(' ') + '.'

=end

