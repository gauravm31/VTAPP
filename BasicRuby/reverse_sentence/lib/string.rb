class String

  def reverse_words
    scan(/\w+/).reverse.join(" ")

  end

end
