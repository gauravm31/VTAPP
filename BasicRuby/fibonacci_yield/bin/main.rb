require_relative "../lib/fibonacci.rb"

fibonacci = Fibonacci.new

fibonacci.fibo {|number| puts number}
