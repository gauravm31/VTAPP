class IRB
  def self.start
    statements = []
    begin
      print '==>'
      line = gets.chomp
      statements << line
      if line == ''
        puts eval(statements.join("\n"), TOPLEVEL_BINDING)
        statements = []
      end
    end while line !~ /^q$/i
  end
end
