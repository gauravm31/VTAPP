require_relative "../lib/customer.rb"

customer1 = Customer.new("Gaurav")
customer2 = Customer.new("dilpreet")
customer3 = Customer.new("AMIT")

puts "#{customer1.name} has account number: #{customer1.account_no} with balance = #{customer1.balance}"

puts "#{customer2.name} has account number: #{customer2.account_no} with balance = #{customer2.balance}"

puts "#{customer3.name} has account number: #{customer3.account_no} with balance = #{customer3.balance}"

puts "Amit deposits 1100 rs."

customer3.deposit(1100)

puts "Gaurav deposits 2200 rs."

customer1.deposit(2200)

puts "Dilpreet withdraws 500 rs."

customer2.withdrawal(500)

puts "#{customer1.name} has account number: #{customer1.account_no} with balance = #{customer1.balance}"

puts "#{customer2.name} has account number: #{customer2.account_no} with balance = #{customer2.balance}"

puts "#{customer3.name} has account number: #{customer3.account_no} with balance = #{customer3.balance}"
