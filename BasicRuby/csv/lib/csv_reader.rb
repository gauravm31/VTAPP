require 'csv'
require_relative 'employee'

class CsvReader
  def initialize
    @employees = Hash.new { |hash, key| hash[key] = [] }
  end

  def read_csv
    CSV.foreach('sample.txt', headers: true, col_sep: ', ') do |row|
      @employees[row['Designation'].to_sym] << Employee.new(row['Name'], row['EmpId'], row['Designation'])
    end
  end

  def write_into_file
    File.open('output.txt', 'w') do |file|
      @employees.each do |key, value|
        file.puts "#{ key }s"
        file.puts value
        file.puts
      end
    end
  end
  
end
