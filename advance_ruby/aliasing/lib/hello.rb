require_relative 'my_module'

class Hello
  extend MyModule
  def greet
    puts 'hello'
  end

  chained_aliasing :greet, :logger
end
