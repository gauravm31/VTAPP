class Customer

  @@account_no = 0

  attr_reader :name, :account_no, :balance

  def initialize(name)
    @name = name
    @account_no = @@account_no += 1
    @balance = 1000
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(amount)

    if amount > @balance
      puts "Can not withdraw because there is not enough balance"
    else
      @balance -= amount
    end
    
  end

end