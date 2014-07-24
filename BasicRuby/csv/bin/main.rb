require_relative '../lib/csv_reader'

csv_reader = CsvReader.new
csv_reader.read_csv
csv_reader.write_into_file