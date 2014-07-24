require 'prime'

class Fixnum

  def primes_upto(limit)
    primes = []
    primes << 2 if self <= 2
    start = self.even? ? self + 1 : self
    (start..limit).step(2) { |number| primes << number if number.prime? }
    primes
  end

end
