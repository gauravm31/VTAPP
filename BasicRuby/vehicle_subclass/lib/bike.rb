require_relative "vehicle.rb"

class Bike < Vehicle

  attr_reader :dealer

  def initialize(name, price, dealer)
    @dealer = dealer
    super(name, price)
  end

  def to_s
    "Bike #{name} costs #{price}rs and is available at #{dealer}."
  end
end
