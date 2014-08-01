class Pascal

  def self.build(number)
    previous_row = []
    0.upto(number) do |row_number|
      row = [1]
      1.upto(row_number) do |column_number|
        row[column_number] = previous_row[column_number - 1] + (previous_row[column_number] || 0)
      end
      yield(row)
      previous_row = row
    end
  end

end
