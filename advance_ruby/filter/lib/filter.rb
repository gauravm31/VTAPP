module Filter

  def self.extended(cls)
    filter_hash = Hash.new { |h, k| h[k] = {} }
    filter_hash[:all_before] = filter_hash[:all_after] = filter_hash[:filter_methods] = []
    cls.instance_variable_set(:@filter_hash, filter_hash)
  end

  def before_filter(array, hash = {})
    populate_filter(array, hash, 'before')
  end

  def after_filter(array, hash = {})
    populate_filter(array, hash, 'after')
  end

  def populate_filter(array, hash = {}, place)
    @filter_hash[:filter_methods] += array
    if(hash.length == 0)
      @filter_hash[('all_' + place).to_sym] += array
    elsif (hash.has_key?(:except))
      @filter_hash[('except_' + place).to_sym][array] = hash[:except]
    elsif (hash.has_key?(:only))
      @filter_hash[('only_' + place).to_sym][array] = hash[:only]
    end
  end

    @@check = true
  def method_added method
    if(@@check)
      @@check = false
      Filter.redefine_method(self, method)
      @@check = true
    end
  end

  def self.redefine_method(cls, method)
    old_method = cls.instance_method(method)
    filter_hash = cls.instance_variable_get(:@filter_hash)
    cls.class_eval do
      define_method method do
        filter_hash[:all_before].each do |val|
          send val unless filter_hash[:filter_methods].include?(method)
        end
        filter_hash[:except_before].each do |key, value|
          if (value != method) && (!filter_hash[:filter_methods].include?(method))
            key.each { |key| send key}
          end
        end
        filter_hash[:only_before].each do |key, value|
          if (value == method) && (!filter_hash[:filter_methods].include?(method))
            key.each { |key| send key}
          end
        end

        old_method.bind(self).call

        filter_hash[:all_after].each do |val|
          send val unless filter_hash[:filter_methods].include?(method)
        end
        filter_hash[:except_after].each do |key, value|
          if (value != method) && (!filter_hash[:filter_methods].include?(method))
            key.each { |key| send key}
          end
        end
        filter_hash[:only_after].each do |key, value|
          if (value == method) && (!filter_hash[:filter_methods].include?(method))
            key.each { |key| send key}
          end
        end  
      end
    end
  end
end