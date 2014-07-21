time1 = "22:33:33"
/(?<hours1>\d\d):(?<minutes1>\d+):(?<seconds1>\d+)/ =~ time1
puts hours1
time2 = "3:2:2"
time2 =~ /(?<hours2>\d+):(?<minutes2>\d+):(?<seconds2>\d+)/
puts $1

puts minutes1