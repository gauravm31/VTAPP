require_relative 'product'

class Cart

  USER_INPUT = Product::PROMPT_VALUES.values.join("/")

  def initialize
    @products = []
  end

  def add
    begin
      product = Product.new
      product.name = yield 'Name of the product: '
      product.import = yield "Is product imported?(#{ USER_INPUT }): "
      product.exempt = yield "Is product exempted from sales tax?(#{ USER_INPUT }): "
      product.price = (yield 'Price: ').to_i
      @products << product
    end while (yield("Do you want to add more items to your list?(#{ USER_INPUT }): ") == Product::PROMPT_VALUES[:yes])
  end

  def show_total
    total = @products.inject(Hash.new(0)) do |summation, product|
      summation[:price] += product.price
      summation[:sales_tax] += product.sales_tax
      summation[:import_tax] += product.import_tax
      summation[:gross_price] += product.gross_price
      puts product
      summation
    end
    puts "total  #{ total[:price] }  #{ total[:sales_tax] }  #{ total[:import_tax] } #{ total[:gross_price].round }"
  end

end
