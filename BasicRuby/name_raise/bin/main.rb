require_relative '../lib/name'

puts 'Enter first name:'
first_name = gets.chomp
puts 'Enter second name:'
last_name = gets.chomp
begin
  name = Name.new(first_name, last_name)
  puts "#{ name.first_name } #{ name.last_name }"
rescue InvalidNameError => name_error
  puts name_error.message
end
