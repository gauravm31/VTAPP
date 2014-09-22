require_relative "../lib/my_class"

puts 'Enter name of method:'
method = gets.chomp
puts 'Enter code:'
code = gets.chomp

MyClass.class_eval %{
  def #{method}
    #{code}
  end
}

MyClass.new.send method