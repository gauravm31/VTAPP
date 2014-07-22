require_relative "../lib/time_sum.rb"

puts "Enter 1st time(hh:mm:ss):"
time1 = gets
puts "Enter 2nd time(hh:mm:ss):"
time2 = gets
timesum = Times.new(time1, time2)
puts timesum.show_sum
