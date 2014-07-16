require_relative "../lib/char_counter"

puts "Enter the string:"

count_char = CharCounter.new.counts_occurences(gets.chomp.split(//))

puts count_char
