class Array

  def group_by_length
    hash = Hash.new { |hash, key| hash[key] = [] }
    for var in self
      hash[var.to_s.length] << var
    end
    hash
  end
end
