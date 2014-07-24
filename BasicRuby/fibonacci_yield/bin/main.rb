require_relative '../lib/fibonacci'

puts 'Enter the limit: '
Fibonacci.build(gets.to_i) { |number| puts number }
