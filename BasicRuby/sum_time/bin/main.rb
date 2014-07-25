require_relative '../lib/time'

puts 'Enter 1st time(hh:mm:ss):'
time1 = gets.chomp
puts 'Enter 2nd time(hh:mm:ss):'
time2 = gets.chomp
puts Time.sum(time1, time2)
