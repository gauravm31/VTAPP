require_relative "../lib/string.rb"

print "Enter the string:"

str = gets.chomp

str.palindrome if str =~ /[^qQ$]/
