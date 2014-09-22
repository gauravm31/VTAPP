class ShoppingList
  def initialize
    @list = {}
  end

  def items(&block)
    instance_eval &block
  end

  def add(item, quantity)
    @list[item] = quantity
  end

  def show
    puts @list
  end
end
