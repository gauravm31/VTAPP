a = [100, 101, 102, 103, 104, 105, 50, 110]

i, min_index = 0
j, max_index = a.length - 1

min = 9999999999
max = 0

while(i < j)
  if((a[i] < min) && (a[i] <= max))
    min = a[i]
    min_index = i
    i += 1
  elsif((a[i] < min) && (a[i] > max))
    min = a[i]
    min_index = i
  elsif((a[i] >= min) && (a[i] <= max))
    i += 1
  else

  end

  if((a[j] > max) && (a[j] >= min))
    max = a[j]
    max_index = j
    j -= 1
  elsif((a[j] > max) && (a[j] < min))
    max = a[j]
    max_index = j
  elsif((a[j] < max) && (a[j] >= min))
    j -= 1
  else
  end
end
puts"max_value: #{max}, max_index: #{max_index}"
puts "min_value: #{min}, min_index: #{min_index}"
