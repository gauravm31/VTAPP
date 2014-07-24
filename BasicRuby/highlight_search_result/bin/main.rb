require_relative '../lib/string'

puts 'Enter the word to be searched'
word = gets.chomp
puts 'Enter a string:'
str = gets.chomp
occurences = str.highlight!(word)
puts str
puts "Total occurences found: #{ occurences }"
