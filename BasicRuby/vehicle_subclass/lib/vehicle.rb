class Vehicle

  attr_reader :name
  attr_accessor :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{ name } costs #{ price }rs"
  end
end
