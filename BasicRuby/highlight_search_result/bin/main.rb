require_relative "../lib/string.rb"

puts "Enter the word to be searched"
word = gets.chomp
puts "Enter a string:"
puts gets.highlight(/(?<result>)#{Regexp.quote(word)}/i)
