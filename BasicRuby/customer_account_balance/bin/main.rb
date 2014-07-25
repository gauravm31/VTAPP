require_relative '../lib/customer'

customer1 = Customer.new('Gaurav')
customer2 = Customer.new('Dilpreet')
customer3 = Customer.new('Amit')
puts customer1
puts customer2
puts customer3
puts 'Amit withdraws 200 rs.'
puts customer3.withdraw(200)
puts 'Gaurav deposits 2200 rs.'
puts customer1.deposit(2200)
puts 'Dilpreet withdraws 1500rs.'
puts customer2.withdraw(1500)
puts customer1
puts customer2
puts customer3
