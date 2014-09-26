require_relative '../lib/my_string'

puts 'Enter the object of class MyString'
str = MyString.new(gets.chomp)

puts "Enter the method:"
meth = gets.chomp
arguments = ''

if MyString.instance_methods.include?(meth.to_sym)
  formal_arguments = MyString.check_method_arguments(meth.to_sym)
  p formal_arguments
  if(!formal_arguments.empty?)
    puts "arguments = #{ formal_arguments }"
    arguments = gets.chomp
  end
  puts str.instance_eval(meth + arguments)
else
  puts "Method not found"
end

