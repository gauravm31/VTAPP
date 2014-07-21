require_relative "../lib/string.rb"

puts "Enter the word to be searched"
word = gets.chomp
puts "Enter a string:"
str = gets.chomp
occurences = str.highlight!(/(?<result>)#{Regexp.quote(word)}/i)

puts str
puts "Total occurences found: #{occurences}"
