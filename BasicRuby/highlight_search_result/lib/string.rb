class String

  def highlight!(word)
    occurences = 0
    str = gsub!(/#{ Regexp.quote(word) }/i) do |substitution|
      occurences += 1
      "(#{ substitution })"
    end
    occurences
  end

end
