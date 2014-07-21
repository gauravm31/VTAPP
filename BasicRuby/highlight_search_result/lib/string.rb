class String

  def highlight(pattern)
    occurences = 0
    str = gsub(pattern) do |substitution|
      occurences +=1
      "(#{substitution})"
      end
    puts(str)
    puts "Total occurences found: #{occurences}"
  end
end
