class Product
  attr_reader :price

  def initialize(name, import, exempt, price)
    @name = name
    @import = import
    @exempt = exempt
    @price = price.to_i
  end

  def calculate_sales_tax
    tax = 0
    if @exempt != 'y'
      tax += @price / 10.0
    end
    if @import == 'y'
      tax += @price / 20.0
    end
    tax.round(3)
  end

  def to_s
    "#{ @name }'s price: #{ price }"
  end
end
