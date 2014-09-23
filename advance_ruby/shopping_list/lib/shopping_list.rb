require_relative 'item'

class ShoppingList
  def initialize
    @list = []
  end

  def items(&block)
    instance_eval &block
  end

  def add(name, quantity)
    @list << Item.new(name, quantity)
  end

  def show
    puts @list
  end
end
