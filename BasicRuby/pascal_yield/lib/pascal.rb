class Pascal

  def self.build(number)
    array = []
    0.upto(number) do |row|
      nested_array = [1]
      1.upto(row) do |column|
        nested_array[column] = array[column - 1] + (array[column] || 0)
      end
      yield(nested_array)
      array = nested_array
    end
  end

end
