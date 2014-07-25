class Customer
  @@number_of_objects = 0

  def initialize(name)
    @name = name
    @account_no = @@number_of_objects += 1
    @balance = 1000
  end
 
  def negative_amount_error_message
    'Please enter a positive amount.'
  end

  def low_funds_error_message
    'Not enough funds'
  end

  def deposit(amount)
    if amount < 0
      negative_amount_error_message
    else
      @balance += amount
    end
  end

  def withdraw(amount)
    if amount < 0
      negative_amount_error_message
    elsif amount > @balance
      low_funds_error_message
    else
      @balance -= amount
    end
  end

  def to_s
    "#{ @name } has account number: #{ @account_no } with balance = #{ @balance }"
  end

end
