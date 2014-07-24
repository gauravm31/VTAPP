require_relative 'name_invalid_error'

class Name
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    if (first_name.nil? || first_name.empty?)
      raise NameInvalidError.new('First name can not be empty.')
    elsif (last_name.nil? || last_name.empty?)
      raise NameInvalidError.new('Last name can not be empty.')
    elsif first_name[0] !~ /[A-Z]/
      raise NameInvalidError.new('First letter of first name must be capital.')
    else
      @first_name = first_name
      @last_name = last_name
    end
  end

end
