require_relative '../lib/cart'

cart = Cart.new
cart.add do |message|
  print message
  gets.chomp
end
cart.show_total
