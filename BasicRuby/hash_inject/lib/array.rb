class Array

  def group_by_length  

    hash_by_length = Hash.new { |hash, key| hash[key] = [] }
    for index in 0...size
      hash_by_length[self[index].to_s.length] << self[index]
    end
    hash_by_length
  end

  def even_odd_hash
    hash_by_length = group_by_length
    hash_by_even_odd = Hash.new { |hash, key| hash[key] = [] }
    hash_by_length.inject(0) do |_, (key, value) |
      key.odd? ? (hash_by_even_odd[:odd] << value) : (hash_by_even_odd[:even] << value)
    end
    hash_by_even_odd
  end
end
