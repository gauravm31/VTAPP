class Vehicle

  attr_reader :name
  attr_accessor :price

  def initialize(name, aprice)
    @name = name
    @price = aprice
  end
end
