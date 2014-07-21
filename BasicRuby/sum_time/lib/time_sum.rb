class TimeSum

  def sum_of_times(time1, time2)
    if /\d+:\d+:\d+/ !~ time1
      "time1 is not valid"
    elsif /\d+:\d+:\d+/ !~ time2
      "time2 is not valid"
    else
      /(?<hours1>\d+):(?<minutes1>\d+):(?<seconds1>\d+)/ =~ time1
      /(?<hours2>\d+):(?<minutes2>\d+):(?<seconds2>\d+)/ =~ time2
      if (hours1.to_i >= 24 || minutes1.to_i >= 60 || seconds1.to_i >= 60)
        "time1 is not valid"
      elsif (hours2.to_i >= 24 || minutes2.to_i >= 60 || seconds2.to_i >= 60)
        "time2 is not valid"
      else
        sum_seconds = seconds1.to_i + seconds2.to_i
        sum_minutes = minutes1.to_i + minutes2.to_i
        sum_hours = hours1.to_i + hours2.to_i

        if sum_seconds >= 60
          sum_seconds -= 60
          sum_minutes +=1
        end

        if sum_minutes >= 60
          sum_minutes -= 60
          sum_hours +=1
        end

        if sum_hours >= 24
          sum_hours -= 24
          "1 day and #{sum_hours}:#{sum_minutes}:#{sum_seconds}"
        else
          "#{sum_hours}:#{sum_minutes}:#{sum_seconds}"
        end
      end
    end
  end
end
