class CharCounter

  def counts_occurences(chars)
    count = Hash.new(0)

    chars.each { |c| count[c] += 1 }

    count

  end

end
