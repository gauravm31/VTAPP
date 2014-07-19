class String

  def count_occurences
    count = Hash.new(0)
    chomp.split(//).each { |c| count[c] += 1 }
    count

  end

end
