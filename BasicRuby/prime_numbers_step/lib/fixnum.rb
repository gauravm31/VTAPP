require 'prime'

class Fixnum

  def primes_upto(limit)
    primes = []
    if self <= 2
      primes << 2
    end
    if (self % 2) == 0
      ((self + 1)..limit).step(2) { |number| primes << number if number.prime? }
    else
      (self..limit).step(2) { |number| primes << number if number.prime? }
    end
    primes
  end

end
