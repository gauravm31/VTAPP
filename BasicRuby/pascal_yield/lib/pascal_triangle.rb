class PascalTriangle

  def pascal(number)

    array = []

    for row in 0..number

      nested_array = []
      nested_array[0] = 1

      for column in 1..row
        nested_array[column] = array[row -1][column-1] + (array[row - 1][column] || 0)

      end

      yield(nested_array)
      array[row] = nested_array

    end

  end

end
