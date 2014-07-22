class Pascal

  def Pascal.build(number)
    array = []

    (0..number).each do | row |
      nested_array = []
      nested_array[0] = 1
      (1..row).each do | column |
        nested_array[column] = array[row - 1][column - 1] + (array[row - 1][column] || 0)
      end

      yield(nested_array)
      array[row] = nested_array
    end
  end
end
