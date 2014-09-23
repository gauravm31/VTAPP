str = 'patrick'
another_str = 'patrick'

# First way to define singleton method
def str.palindrome?
    reverse == self
  end

p str.palindrome?
p another_str.palindrome?

# Second way to define singleton method
class << str
  def count_occurences
    count = Hash.new(0)
    each_char { |char| count[char] += 1 }
    count
  end
end

p str.count_occurences
p another_str.count_occurences
