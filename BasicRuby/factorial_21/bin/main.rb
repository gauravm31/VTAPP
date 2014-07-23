require_relative "../lib/fixnum.rb"

puts 6.factorial
begin
  puts -1.factorial
rescue InvalidValueException => error
  puts error.message
end
puts 0.factorial
