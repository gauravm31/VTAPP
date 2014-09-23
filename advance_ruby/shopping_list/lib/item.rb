class Item
  def initialize(name, quantity)
    @name = name
    @quantity = quantity
  end

  def to_s
    "Name: #{@name}, Quantity: #{@quantity}"
  end
end