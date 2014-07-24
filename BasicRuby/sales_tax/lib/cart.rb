require_relative 'product'

class Cart

  def initialize
    @products = []
    @tax_on_products = []
  end

  def add
    begin
      name = yield 'Name of the product: '
      import = yield 'press y is product is imported: '
      exempt = yield 'press y if product is exempted from sales tax: '
      price = (yield 'Price: ').to_i
      @products << Product.new(name, import, exempt, price)
    end while (yield('Press y if you want to add more items to your list: ') == 'y')
  end

  def show_total
    @products.each do |product|
      @tax_on_products << product.calculate_sales_tax
    end

    total = 0
    0.upto(@products.length - 1) do |index|
    puts @products[index]
    puts "tax: #{ @tax_on_products[index] }"
    total += @products[index].price + @tax_on_products[index]
    end
    total.round
  end

end