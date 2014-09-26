class MyString < String

  VOWELS = /[aeiou]/i

  def self.new(str)
    super
  end

  def exclude?(str, b = 10)
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

  def self.check_method_arguments(meth)
    params = self.new('asd').method(meth.to_s).parameters
    param_list = []
    params.each do |param|
      if param[0] == :req
        param_list << "required: #{param[1]}"
      elsif param[0] == :opt
        param_list << "optional: #{param[1]}"
      end
    end
    param_list.join(', ')
    
  end

end
