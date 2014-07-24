class Interest
  attr_accessor :principal, :time, :rate

  def initialize
    yield self
  end

  def difference_in_interest
    simple_interest = @principal * @time * @rate / 100.0
    compound_interest = (@principal * ((1 + (@rate / 100.0)) ** @time)) - @principal
    compound_interest - simple_interest
  end

end
