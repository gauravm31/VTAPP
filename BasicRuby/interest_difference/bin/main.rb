require_relative "../lib/interest"

puts "Enter principal amount:"
principa = gets.to_i
puts "Enter time in years:"
tim = gets.to_i
interest = Interest.new  do |obj|
  obj.principal = principa
  obj.time = tim
end

puts interest.difference_in_interest