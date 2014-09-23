str = 'patrick'

# First way to define singleton method
def str.palindrome?
    reverse == self
  end

p str.palindrome?

# Second way to define singleton method
class << str
  def count_occurences
    count = Hash.new(0)
    each_char { |c| count[c] += 1 }
    count
  end
end

p str.count_occurences


# Another string with these methods not defined
another_str = 'patrick'

another_str.show_self