class Fibonacci

  def self.build(limit)
    n1, n2 = 1, 1
    while(n1 <= limit)
      yield(n1)
      n1, n2 = n2, n1 + n2
    end
  end

end
