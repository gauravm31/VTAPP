class String

  def count_various_char
    count = Hash.new(0)
    chomp.split(//).each do |c| 

      case c
      when '0'..'9'
        count[:digits] += 1
      when 'a'..'z'
        count[:lowercase] += 1
      when 'A'..'Z'
        count[:uppercase] += 1
      else
        count[:specials] += 1
      end

    end

    count

  end

end
