class Array

  def reverse_itirate
    reversed_array = reverse
    for index in 0...reversed_array.length
      yield reversed_array[index]
    end
  end
end