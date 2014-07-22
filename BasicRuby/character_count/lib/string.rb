class String

  def count_chars_by_type
    count = Hash.new(0)
    chars.each do |character|

      case character
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
