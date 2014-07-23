require "time"

class Time


  REGEXP = /(?<hour>^\d\d?):(?<min>\d\d?):(?<sec>\d\d?)/
  def self.valid?(times)
    times.each_with_index do |element, index|
      if REGEXP !~ element
        $check = index
        false
        break
      else
        /(?<hour>^\d\d?):(?<min>\d\d?):(?<sec>\d\d?)/ =~ element
        if (hour.to_i >= 24 || min.to_i >= 60 || sec.to_i >= 60)
          $check = index
          false
          break
        else
          true
        end
      end
    end
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

  def self.sum_of_times
    $time.each do |time|
      $sum_seconds += time.sec
      $sum_minutes += time.min
      $sum_hours += time.hour
      normalise
    end
  end

  def self.sum(*times)
    if valid?(times)
      $time = times.collect { |time| Time.parse(time) }
      $sum_seconds = $sum_minutes = $sum_hours = 0
      $days = 0
      $check = -1
      sum_of_times
      if $days == 1
        "1 day and #{ $sum_hours }:#{ $sum_minutes }:#{ $sum_seconds }"
      elsif $days > 1
        "#{ $days } days and #{ $sum_hours }:#{ $sum_minutes }:#{ $sum_seconds }"
      else
        "#{ $sum_hours }:#{ $sum_minutes }:#{ $sum_seconds }"
      end
    else
      "#{ times[$check] } is not a valid time"
    end
  end
end
