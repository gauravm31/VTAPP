class Customer
  @@number_of_accounts = 0
  attr_reader :name, :account_no, :balance

  def initialize(name)
    @name = name
    @account_no = @@number_of_accounts += 1
    @balance = 1000
  end

  def deposit(amount)
    if amount < 0
      'Please enter a positive amount.'
    else
      "Balance = #{ @balance += amount }"
    end
  end

  def withdrawal(amount)
    if amount < 0
      'Please enter a positive amount.'
    elsif amount > @balance
      'Not enough funds'
    else
      "Balance = #{ @balance -= amount }"
    end
  end

end
