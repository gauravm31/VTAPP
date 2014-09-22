require_relative '../lib/my_string'

puts 'Enter the object of class MyString'
str = MyString.new(gets.chomp)

puts "Enter the method: #{MyString.instance_methods(false)}"
method = gets.chomp

puts str.instance_eval method
