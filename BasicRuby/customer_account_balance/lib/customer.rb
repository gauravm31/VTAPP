class Customer
  @@number_of_objects = 0
  attr_reader :name, :account_no, :balance
  MESSAGE = 'Please enter a positive amount.'

  def initialize(name)
    @name = name
    @account_no = @@number_of_objects += 1
    @balance = 1000
  end

  def deposit(amount)
    if amount < 0
      MESSAGE
    else
      @balance += amount
    end
  end

  def withdrawal(amount)
    if amount < 0
      MESSAGE
    elsif amount > @balance
      'Not enough funds'
    else
      @balance -= amount
    end
  end

  def to_s
    "#{ @name } has account number: #{ @account_no } with balance = #{ @balance }"
  end

end
