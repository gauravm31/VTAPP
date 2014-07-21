class Fixnum

  def factorial

    if self < 0
      "Enter a positive number."
    elsif self <= 1
      1
    else
      (2..self).inject(:*)
    end
  end
end
