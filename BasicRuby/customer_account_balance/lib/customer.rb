class Customer
  @@account_number = 0
  attr_reader :name, :account_no, :balance

  def initialize(name)
    @name = name
    @account_no = @@account_number += 1
    @balance = 1000
  end

  def deposit(amount)
    amount < 0 ? puts('Please enter a positive amount.') : @balance += amount
  end

  def withdrawal(amount)
    #amount > @balance ? puts('Not enough balance.') : @balance -= amount
    if amount < 0
      puts 'Please enter a positive amount.'

    elsif amount > @balance
      puts 'Not enough funds'

    else
      @balance -= amount

    end

  end

end
