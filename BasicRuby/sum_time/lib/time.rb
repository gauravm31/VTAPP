require "time"

class Time

  REGEXP1 = /(?<hour1>^\d\d?):(?<min1>\d\d?):(?<sec1>\d\d?)/
  REGEXP2 = /(?<hour2>^\d\d?):(?<min2>\d\d?):(?<sec2>\d\d?)/

  def self.valid?(time1, time2)
    if time1 !~ REGEXP1
      $check = 1
      false
    elsif time2 !~ REGEXP2
      $check = 2
      false
    else
      /(?<hour1>^\d\d?):(?<min1>\d\d?):(?<sec1>\d\d?)/ =~ time1
      /(?<hour2>^\d\d?):(?<min2>\d\d?):(?<sec2>\d\d?)/ =~ time2
      if (hour1.to_i >= 24 || min1.to_i >= 60 || sec1.to_i >= 60)
        $check = 1
        false
      elsif (hour2.to_i >= 24 || min2.to_i >= 60 || sec2.to_i >= 60)
        $check = 2
        false
      else
        true
      end
    end
  end

  def self.sum_of_times(time1, time2)
    $sum_seconds = time1.sec + time2.sec
    $sum_minutes = time1.min + time2.min
    $sum_hours = time1.hour + time2.hour
  end

  def self.normalise
    if $sum_seconds >= 60
      $sum_seconds -= 60
      $sum_minutes +=1
    end

    if $sum_minutes >= 60
      $sum_minutes -= 60
      $sum_hours +=1
    end

    if $sum_hours >= 24
      $sum_hours -= 24
      $days += 1
    end
  end

  def self.sum(time1, time2)
    $days = 0
    $check
    if valid?(time1, time2)
      time1 = Time.parse(time1)
      time2 = Time.parse(time2)
      sum_of_times(time1, time2)
      normalise
      if $days == 1
        "1 day and #{ $sum_hours }:#{ $sum_minutes }:#{ $sum_seconds }"
      else
        "#{ $sum_hours }:#{ $sum_minutes }:#{ $sum_seconds }"
      end
    else
      if $check == 1
        "#{ time1 } is not valid"
      else
        "#{ time2 } is not valid"
      end
    end
  end
end
