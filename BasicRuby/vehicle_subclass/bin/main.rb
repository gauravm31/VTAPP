require_relative "../lib/bike.rb"

bike1 = Bike.new("Apache", 80000, "GK TVS")

puts "#{bike1.name} has a price of #{bike1.price} and its dealer is #{bike1.dealer}"

puts "Changing price of #{bike1.name}"

bike1.price = 85000

puts "#{bike1.name} has a new price of #{bike1.price} and its dealer is #{bike1.dealer}"
