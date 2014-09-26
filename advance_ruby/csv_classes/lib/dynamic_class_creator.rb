class DynamicClassCreator

  def initialize(file_name)
    @file_name = file_name
  end

  def create_class()
    attributes = CSV.read(@file_name, headers: true).headers
    Object.const_set(generate_class_name, Class.new do
      attributes.each do |attr|
        attr_accessor attr.to_sym
      end
    end)
  end

  def get_headers
    @headers ||= CSV.read(@file_name, headers: true).headers
  end

  private

  def generate_class_name
    @file_name.capitalize.partition(/\.csv/)[0]
  end

end
