class DynamicClassCreator

  def self.create_class(file_name)
    attributes = CSV.read(file_name, headers: true).headers

    klass = Class.new do
      class_variable_set('@@file_name', file_name)
      class_variable_set('@@headers', attributes)
      class_variable_set('@@self_objects', Array.new)

      def self.headers
        class_variable_get('@@headers')
      end

      attr_accessor *self.headers

      def initialize row
        self.class.headers.each do |attr|
          instance_variable_set('@' + attr, row[attr])
        end
      end

      def to_s
        str = ''
        self.class.headers.each do |attr|
          str += attr + ": "
          str += (instance_variable_get('@' + attr)) + " "
        end
        str
      end

      def self.save(obj)
        class_variable_get('@@self_objects') << obj
      end

      def self.show_objects
        puts class_variable_get('@@self_objects')
      end

    end

    Object.const_set('Person', klass)
  end

end
