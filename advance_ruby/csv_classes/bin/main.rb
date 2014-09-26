require 'csv'
require_relative '../lib/dynamic_class_creator'

file_name = 'persons.csv'
dynamic_class_creator = DynamicClassCreator.new(file_name)

created_class = dynamic_class_creator.create_class

created_class.class_eval do
  @self_objects = []
  attributes = dynamic_class_creator.get_headers
  define_method :initialize do |row|
    attributes.each do |attr|
      public_send(attr + '=', row[attr])
    end
  end
  define_method :to_s do
    str = ''
    attributes.each do |attr|
      str += attr + ": "
      str += public_send(attr) + " "
    end
    str
  end

  def self.save(obj)
    @self_objects << obj
  end

  def self.show_objects
    puts @self_objects
  end
end

CSV.foreach(file_name, headers: true) do |row|
  object = created_class.new(row)
  created_class.save(object)
end

created_class.show_objects
