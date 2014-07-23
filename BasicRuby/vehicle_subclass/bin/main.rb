require_relative "../lib/bike.rb"

bike1 = Bike.new("Apache", 80000, "GK TVS")
puts bike1
puts "Changing price of #{bike1.name}"
bike1.price = 85000
puts bike1
