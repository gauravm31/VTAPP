class String

  def highlight!(pattern)
    occurences = 0
    str = gsub!(pattern) do |substitution|
      occurences +=1
      "(#{substitution})"
      end
      occurences
  end
end
