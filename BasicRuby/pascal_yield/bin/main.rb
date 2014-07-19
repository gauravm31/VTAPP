require_relative "../lib/pascal_triangle.rb"

triangle1 = PascalTriangle.new
triangle1.pascal(6) do |row|
  
  row.each { |element| print "#{element} " }
  print "\n"

end
