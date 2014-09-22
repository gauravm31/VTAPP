class MyString < String

  VOWELS = /[aeiou]/i

  def self.new(str)
    super
  end

  def exclude?(str)
    !include?(str)
  end

  def count_occurences
    count = Hash.new(0)
    each_char { |char| count[char] += 1 }
    count
  end

  def replace_vowels
    gsub(VOWELS, '*')
  end

end
