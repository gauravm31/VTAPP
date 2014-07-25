require 'time'

class Time

  REGEXP = /^([0-1]?\d|2[0-3]):([0-5]?\d):([0-5]?\d)$/

  def self.valid?(time)
    time =~ REGEXP
  end

  def self.normalise
    if @@sum_seconds >= 60
      @@sum_seconds -= 60
      @@sum_minutes +=1
    end

    if @@sum_minutes >= 60
      @@sum_minutes -= 60
      @@sum_hours +=1
    end

    if @@sum_hours >= 24
      @@sum_hours -= 24
      @@days += 1
    end
  end

  def self.show_error(time)
    "#{ time } is not valid."
  end

  def self.show_sum
    if @@days == 1
      "1 day and #{ @@sum_hours }:#{ @@sum_minutes }:#{ @@sum_seconds }"
    elsif @@days > 1
      "#{ @@days } days and #{ @@sum_hours }:#{ @@sum_minutes }:#{ @@sum_seconds }"
    else
      "#{ @@sum_hours }:#{ @@sum_minutes }:#{ @@sum_seconds }"
    end
  end

  def self.sum(*times)
    @@sum_seconds = @@sum_minutes = @@sum_hours = 0
    @@days = 0
    @@check = -1
    times.each do |time|
      if valid?(time)
        time = parse(time)
        @@sum_seconds += time.sec
        @@sum_minutes += time.min
        @@sum_hours += time.hour
        normalise
      else
        return show_error(time)
      end
    end
    show_sum
  end

end
