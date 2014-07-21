class Interest

  def initialize (&block)
    @block = block
  end

  def difference_in_interest(p,t)
    "Difference in interest is #{ @block.call(p,t) }"
  end
end