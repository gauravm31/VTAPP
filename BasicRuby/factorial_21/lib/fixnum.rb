class Fixnum

  def factorial

    begin
      raise Math::DomainError if self < 0
      if self == 0
        1
      else
        (1..self).inject(:*)
      end
    rescue Math::DomainError
      "Exception caught. Please enter a positive number."
    end
  end
end
