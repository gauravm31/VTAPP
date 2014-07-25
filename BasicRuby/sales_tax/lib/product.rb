class Product
  attr_reader :price

  def initialize(name, import, exempt, price)
    @name = name
    @import = import
    @exempt = exempt
    @price = price.to_i
  end

  INPUT = { :one => 'y', :two => 'n' }

  def sales_tax
    @exempt == INPUT[:one] ? 0 : 0.1 * @price
  end

  def import_tax
    @import == INPUT[:one] ? 0.05 * @price : 0
  end

  def gross_price
    (price + sales_tax + import_tax).round(2)
  end

  def to_s
    "#{ @name }  #{ price }  #{ sales_tax }  #{ import_tax }  #{ gross_price }"
  end
  
end
