require_relative "name_blank_error"

class Name

  attr_accessor :first_name, :last_name

  def initialize(f_name, l_name)
    begin
      raise NameBlankError, "First or last name can't be empty." if (f_name.empty? || l_name.empty?)
      raise RuntimeError, "First letter of first name is not capital." if f_name[0] !~ /[A-Z]/
      self.first_name = f_name
      self.last_name = l_name
    rescue NameBlankError => name_error
      puts name_error.message
    rescue RuntimeError => arg_error
      puts arg_error.message
    end
  end
end
