require_relative 'product'

class Cart

  USER_INPUT = Product::INPUT.values.join("/")

  def initialize
    @products = []
  end

  def add
    begin
      name = yield 'Name of the product: '
      import = yield "Product is imported?(#{ USER_INPUT }): "
      exempt = yield "Product is exempted from sales tax?(#{ USER_INPUT }): "
      price = (yield 'Price: ').to_i
      @products << Product.new(name, import, exempt, price)
    end while (yield("Do you want to add more items to your list?(#{ USER_INPUT }): ") == 'y')
  end

  def show_total
    total_price = (@products.map { |product| product.price }).inject(:+)
    total_sales_tax = (@products.map { |product| product.sales_tax }).inject(:+)
    total_import_tax = (@products.map { |product| product.import_tax }).inject(:+)
    total_gross_price = ((@products.map { |product| product.gross_price }).inject(:+)).round
    @products.each { |product| puts product }
    puts "total  #{ total_price }  #{ total_sales_tax }  #{ total_import_tax } #{ total_gross_price }"
  end

end