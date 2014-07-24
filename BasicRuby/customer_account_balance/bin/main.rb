require_relative '../lib/customer'

customer1 = Customer.new('Gaurav')
customer2 = Customer.new('Dilpreet')
customer3 = Customer.new('Amit')
puts "#{ customer1.name } has account number: #{ customer1.account_no } with balance = #{ customer1.balance }"
puts "#{ customer2.name } has account number: #{ customer2.account_no } with balance = #{ customer2.balance }"
puts "#{ customer3.name } has account number: #{ customer3.account_no } with balance = #{ customer3.balance }"
puts 'Amit withdraws 200 rs.'
puts customer3.withdrawal(200)
puts 'Gaurav deposits 2200 rs.'
puts customer1.deposit(2200)
puts 'Dilpreet withdraws 1500rs.'
puts customer2.withdrawal(1500)
puts "#{ customer1.name } has account number: #{ customer1.account_no } with balance = #{ customer1.balance }"
puts "#{ customer2.name } has account number: #{ customer2.account_no } with balance = #{ customer2.balance }"
puts "#{ customer3.name } has account number: #{ customer3.account_no } with balance = #{ customer3.balance }"
