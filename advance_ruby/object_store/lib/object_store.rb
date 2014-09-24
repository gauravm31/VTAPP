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
