class Irb
  def start
    statements = []
    begin
      print '==>'
      line = gets
      statements << line
      if line.chomp == ""
        puts eval(statements.join("\n"))
        statements = []
      end
    end while line.chomp !~ /^q$/i
  end
end
