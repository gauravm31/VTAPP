require "time"

class TimeSum

  def sum_of_times(*args)

    sum_seconds = 0
    sum_minutes = 0
    sum_hours = 0
    days = 0
    number = -1
    args.each_with_index do | element, index |
      if /(^\d\d?):(\d\d?):(\d\d?)/ !~ element
        number = index
        break

      else
        /(?<hour>^\d\d?):(?<min>\d\d?):(?<sec>\d\d?)/ =~ element
        if (hour.to_i >=24 || min.to_i >= 60 || sec.to_i >=60)
          number = index
          break

        else
          time = Time.parse(element)
          sum_seconds += time.sec
          sum_minutes += time.min
          sum_hours += time.hour

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
            days += 1
          end
        end
      end
    end
        if number >= 0
          "argument[#{number}] is not a valid time"
        elsif days > 1
          "#{days} days and #{sum_hours}:#{sum_minutes}:#{sum_seconds}"
        elsif days == 1
          "#{days} day and #{sum_hours}:#{sum_minutes}:#{sum_seconds}"
        else  
          "#{sum_hours}:#{sum_minutes}:#{sum_seconds}"
        
      
        end
  end
end
