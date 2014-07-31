require_relative '../lib/pascal'

Pascal.build(6) do |row|
  puts row.join(" ")
end
