require_relative '../lib/play'

p2 = Play.new
p2.fname = "abc"
p2.lname = "def"
p2.age = 21
p2.email = "abc@gmail.com"
p2.save

p1 = Play.new
p1.fname = "ab"
p1.lname = "def"
p1.age = 22
p1.email = "ab@gmail.com"
p1.save

puts Play.find_by_age(22) ; 
puts Play.find_by_email("abc@gmail.com") 
puts Play.collect
puts Play.count