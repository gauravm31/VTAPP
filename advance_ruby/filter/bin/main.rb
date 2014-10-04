require_relative '../lib/filter'

class A
  extend Filter

  def a
    puts 'a'
  end

  after_filter [:d], except: :a
  before_filter [:c], only: :b

  def b
    puts 'b'
  end


  private
  def d
    puts 'd'
  end

  def c
    puts 'c'
  end
end

A.new.a
A.new.b
