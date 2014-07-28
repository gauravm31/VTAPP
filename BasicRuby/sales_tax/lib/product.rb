class Product
  attr_accessor :price
  attr_writer :name, :exempt, :import

  YES_OR_NO = { :yes => 'y', :no => 'n' }

  def sales_tax
    (@exempt == YES_OR_NO[:yes] ? 0 : 0.1 * @price).round(2)
  end

  def import_tax
    (@import == YES_OR_NO[:yes] ? 0.05 * @price : 0).round(2)
  end

  def gross_price
    (price + sales_tax + import_tax).round(2)
  end

  def to_s
    "#{ @name }  #{ price }  #{ sales_tax }  #{ import_tax }  #{ gross_price }"
  end
  
end
