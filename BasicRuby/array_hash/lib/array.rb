class Array

  def create_hash
    hash = Hash.new { |hash, key| hash[key] = Array.new() }
    for index in 0...size
      hash[self[index].to_s.length] << self[index]
    end

    hash

  end

end
