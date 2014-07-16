require_relative "vehicle.rb"

class Bike < Vehicle

  attr_reader :dealer

  def initialize(name, price, dealer)
    @dealer = dealer
    super(name, price)
  end

end