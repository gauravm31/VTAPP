module MyModule
  def chained_aliasing(method, functionality)
    method_string = method.to_s
    functionality_string = functionality.to_s

    if method_string.end_with?('?', '!', '=')
      functionality_string += method_string[-1]
      method_string.chop!
    end

    method_with_functionality = method_string + '_with_' + functionality_string
    method_without_functionality = method_string + '_without_' + functionality_string

    alias_method method_without_functionality, method
    define_method method do
      puts '--start logging'
      send method_without_functionality
      puts '--end logging'
    end
    alias_method method_with_functionality, method

    if private_instance_methods.include?(method_without_functionality.to_sym)
      private method.to_sym, method_with_functionality.to_sym
    elsif protected_instance_methods.include?(method_without_functionality.to_sym)
      protected method.to_sym, method_with_functionality.to_sym
    end
  end
end
