module MyObjectStore

  @@saved_objects = []

  def self.included(cls)
    cls.extend ClassMethods
    cls.extend Enumerable
  end

  def save
    if defined?(validate) && !validate
      puts msg = 'This object is not valid.'
    else
      @@saved_objects << self
    end
  end

  ClassMethods = Module.new do

    def each(&block)
      @@saved_objects.each do |object|
        yield object
      end
    end

    def validate(attribute, property)
      property.each_key do |key|
        if key == :uniqueness
          check_uniqueness(attribute)
        elsif key == :presence
          check_presence('@' + attribute.to_s)
        end
      end
    end

    def check_uniqueness(attribute)
      class_eval do
        define_method :save do
          if defined?(validate) && !validate
            puts 'This object is not valid.'
          elsif @@saved_objects.map(&attribute).include?(instance_variable_get('@' + attribute.to_s))
            p "The #{ attribute.to_s } is not unique"
          else
            @@saved_objects << self
          end
        end
      end 
    end

    def check_presence(attribute)
      class_eval do
        define_method :save do
          if defined?(validate) && !validate
            puts 'This object is not valid.'
          elsif instance_variable_get(attribute).empty? || instance_variable_get(attribute).nil?
            p "The #{ attribute.to_s } is empty"
          else
            @@saved_objects << self
          end
        end
      end 
    end

    def method_missing (meth, *args)
    if meth !~ /find_by_/
      super
    else
      value = meth.to_s.split('_')[2]
      result = []
      @@saved_objects.each do |obj|
        if args[0] == obj.instance_variable_get('@' + value)
          result << obj
        end
      end
      return result
    end
  end
  end
end
