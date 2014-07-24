require_relative '../lib/fibonacci'

print 'Enter the limit: '
Fibonacci.build(gets.to_i) { |number| puts number }
