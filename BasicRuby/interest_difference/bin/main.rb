require_relative "../lib/interest"

interest = Interest.new do | principal, time |
  rate = 10
  compound_intrest = (principal * ((1 + (rate/100.0)) ** time )) - principal
  simple_interest = principal * rate * time / 100
  compound_intrest - simple_interest
end

puts "Enter principal amount:"
principal = gets.to_i
puts "Enter time in years:"
time = gets.to_i

puts interest.difference_in_interest(principal, time)
