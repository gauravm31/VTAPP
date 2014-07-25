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
    else
      "#{ @@sum_hours }:#{ @@sum_minutes }:#{ @@sum_seconds }"
    end
  end

  def self.sum(time1, time2)
    @@days = 0
    if valid?(time1)
      if valid?(time2)
        time1 = Time.parse(time1)
        time2 = Time.parse(time2)
        @@sum_seconds = time1.sec + time2.sec
        @@sum_minutes = time1.min + time2.min
        @@sum_hours = time1.hour + time2.hour
        normalise
        show_sum
      else
        show_error(time2)
      end
    else
      show_error(time1)
    end
  end

end
