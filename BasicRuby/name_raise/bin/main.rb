require_relative '../lib/name'

puts 'Enter first name:'
first_name = gets.chomp
puts 'Enter second name:'
last_name = gets.chomp
begin
  name1 = Name.new(first_name, last_name)
  print "#{ name1.first_name } "
  puts name1.last_name
rescue NameInvalidError => name_error
      puts name_error.message
end
