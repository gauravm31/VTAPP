require_relative '../lib/name'

puts 'Enter first name:'
first_name = gets.chomp
puts 'Enter second name:'
last_name = gets.chomp
name1 = Name.new(first_name, last_name)
puts name1.first_name
puts name1.last_name
