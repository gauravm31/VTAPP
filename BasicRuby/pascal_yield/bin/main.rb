require_relative "../lib/pascal"

Pascal.build(6) do |row|
  row.each { |element| print "#{ element } " }
  print "\n"
end
