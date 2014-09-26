require 'csv'
require_relative '../lib/dynamic_class_creator'

file_name = 'persons.csv'

created_class = DynamicClassCreator.create_class(file_name)

CSV.foreach(file_name, headers: true) do |row|
  object = created_class.new(row)
  created_class.save(object)
end

created_class.show_objects
