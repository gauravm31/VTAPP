str = 'patrick'

def str.show_self
  puts self
end

str.show_self

class << str
  def show_self
    puts self
  end
end

str.show_self