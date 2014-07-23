require_relative "../lib/fibonacci.rb"

puts "Enter the limit:"
Fibonacci.build(gets.to_i) {|number| puts number}
