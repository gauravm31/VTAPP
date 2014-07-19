class String
  VOWELS = /[aeiou]/i

  def replace_vowels
    gsub(VOWELS, '*')

  end

end
