require "time"

class TimeSum

  def sum_of_times(arg1, arg2)
    if arg1 !~ /(^\d\d?):(\d\d?):(\d\d?)/
      "time1 is not valid"
    elsif arg2 !~ /(^\d\d?):(\d\d?):(\d\d?)/
      "time2 is not valid"
    else
      /(?<hour1>^\d\d?):(?<min1>\d\d?):(?<sec1>\d\d?)/ =~ arg1
      /(?<hour2>^\d\d?):(?<min2>\d\d?):(?<sec2>\d\d?)/ =~ arg2
      if (hour1.to_i >=24 || min1.to_i >= 60 || sec1.to_i >=60)
        "time1 is not valid"
      elsif (hour2.to_i >=24 || min2.to_i >= 60 || sec2.to_i >=60)
        "time2 is not valid"
      else
        time1 = Time.parse(arg1)
        time2 = Time.parse(arg2)
        sum_seconds = time1.sec + time2.sec
        sum_minutes = time1.min + time2.min
        sum_hours = time1.hour + time2.hour

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
