class Array

  def even_odd_hash  

    hash = Hash.new { |hash, key| hash[key] = [] }
    for index in 0...size
      hash[self[index].to_s.length] << self[index]
    end

    hash1 = Hash.new { |hash, key| hash[key] = [] }

    hash.inject(0) do |_, (key, value) |

      key.odd? ? (hash1["odd"] << value) : (hash1["even"] << value)
    end

    hash1
  end

end
