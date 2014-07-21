require_relative "../lib/time_sum.rb"

puts "Enter 1st time(hh:mm:ss):"
time1 = gets
puts "Enter 2nd time(hh:mm:ss):"
time2 = gets
timesum = TimeSum.new
puts timesum.sum_of_times('23:23:23', '23:23:23')
