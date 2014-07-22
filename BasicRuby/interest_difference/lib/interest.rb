class Interest

  attr_accessor :principal, :time

  def initialize
    yield(self)
  end

  def difference_in_interest
    rate = 10
    simple_interest = @principal * @time * rate / 100.0
    compund_interest = (@principal * ((1 + (rate / 100.0)) ** @time)) - @principal
    "Difference in interest is #{compund_interest - simple_interest}"
  end
end