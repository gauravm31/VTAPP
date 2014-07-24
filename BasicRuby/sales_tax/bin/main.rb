require_relative '../lib/cart'

cart = Cart.new
cart.add do |message|
  print message
  gets.chomp
end

puts "Grand total: #{ cart.show_total }"
