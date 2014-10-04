require_relative 'filter'

class Example
  extend Filter

  def a
    puts 'in a'
  end

  after_filter [:d], except: :a
  before_filter [:c], only: :b

  def b
    puts 'in b'
  end


  private
  def d
    puts 'in d'
  end

  def c
    puts 'in c'
  end
end
