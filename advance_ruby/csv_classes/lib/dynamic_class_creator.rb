require 'csv'
class DynamicClassCreator

  def initialize(file_name)
    @file_name = file_name
    @objects = []
  end

  def create_class
      attributes = get_headers
      @class_name = Object.const_set(generate_class_name, Class.new do
      attributes.each do |attr|
        attr_accessor attr.to_sym
      end
    end)
      define_to_s
  end

  def generate_class_name
    @file_name.capitalize.partition(/\.csv/)[0]
  end

  def get_headers
    CSV.read(@file_name, headers: true).headers
  end

  def create_objects
    CSV.foreach(@file_name, headers: true) do |row|
      object = @class_name.new
      attributes = get_headers
      object.instance_eval do
        attributes.each do |attr|
          object.public_send(attr + '=', row[attr])
        end
      end
      @objects << object
    end
  end

  def define_to_s
    attributes = get_headers
    @class_name.class_eval do
      define_method :to_s do
        str = ''
        attributes.each do |attr|
          str += attr + ": "
          str += public_send(attr) + " "
        end
        str
      end
    end
  end

  def show_objects
    puts @objects
  end
end
