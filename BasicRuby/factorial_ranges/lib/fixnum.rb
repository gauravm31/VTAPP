class Fixnum

  def factorial

    if self < 0
      puts "Enter a positive number."
    elsif self <= 1
      1
    else
      (2..self).inject(:*)
    end

  end

end
