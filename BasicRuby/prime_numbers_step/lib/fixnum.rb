require "prime"

class Fixnum

  def primes_upto
    primes = [2]
    if self <= 1
      puts "No prime numbers."
    else
      (1..self).step(2) { |number| primes << number if number.prime?}

      primes

    end

  end

end
