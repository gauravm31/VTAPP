require_relative "invalid_value_exception"

class Fixnum

  def factorial
    #raise Math::DomainError if self < 0
    raise InvalidValueException if self < 0
    self.zero? ? 1 : (1..self).inject(:*)
  end
end
