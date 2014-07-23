require "time"

class Times

  def initialize(*args)
    @times = args
    @days = 0
    @check = -1
    @sum_seconds = 0
    @sum_minutes = 0
    @sum_hours = 0
    @time = []
  end

  def validate
    @times.each_with_index do | element, index |
      if /(^\d\d?):(\d\d?):(\d\d?)/ !~ element
        @check = index
        break
      else
        /(?<hour>^\d\d?):(?<min>\d\d?):(?<sec>\d\d?)/ =~ element
        if (hour.to_i >= 24 || min.to_i >= 60 || sec.to_i >= 60)
          @check = index
          break
        else
          @time[index] = Time.parse(element)
        end
      end
    end
  end

  def normalise
    if @sum_seconds >= 60
      @sum_seconds -= 60
      @sum_minutes +=1
    end

    if @sum_minutes >= 60
      @sum_minutes -= 60
      @sum_hours +=1
    end

    if @sum_hours >= 24
      @sum_hours -= 24
      @days += 1
    end
  end

  def sum_of_times
    @time.each do |time|
      @sum_seconds += time.sec
      @sum_minutes += time.min
      @sum_hours += time.hour
      normalise
    end
  end

  def show_sum
    validate
    if @check == -1
      sum_of_times
      if @days == 1
        "1 day and #{ @sum_hours }:#{ @sum_minutes }:#{ @sum_seconds }"
      elsif @days > 1
        "#{ @days } days and #{ @sum_hours }:#{ @sum_minutes }:#{ @sum_seconds }"
      else
        "#{ @sum_hours }:#{ @sum_minutes }:#{ @sum_seconds }"
      end
    else
      "argument[#{ @check }] is not a valid time"
    end
  end
end
