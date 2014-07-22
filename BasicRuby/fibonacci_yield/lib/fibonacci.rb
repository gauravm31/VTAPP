class Fibonacci
  def Fibonacci.build
    n1, n2 = 1, 1

    while(n1 < 1000)
      yield(n1)
      n1, n2 = n2, n1 + n2
    end
  end
end
