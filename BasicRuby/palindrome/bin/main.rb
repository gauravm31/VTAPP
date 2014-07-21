require_relative "../lib/string.rb"

while true
  print "Enter the string:"
  str = gets.chomp
  break if str =~ /^[qQ]$/
  str.palindrome? ? puts("It is a palindrome") : puts("It is not a palindrome.")

end
