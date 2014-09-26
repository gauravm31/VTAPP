require_relative '../lib/my_string'

puts 'Enter the object of class MyString'
str = MyString.new(gets.chomp)

puts "Enter the method:"
meth = gets.chomp
arguments = ''

if (MyString.instance_methods(false).include?(meth.to_sym)) && (str.method(meth.to_s).parameters.length > 0)
  puts "arguments = #{ str.method(meth.to_s).parameters.to_s }"
  arguments += gets.chomp
end

puts str.instance_eval(meth + arguments)
