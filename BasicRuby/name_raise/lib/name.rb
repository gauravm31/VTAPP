require_relative 'name_invalid_error'

class Name
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    begin
      if (first_name.nil? || first_name.empty?)
        raise NameInvalidError, 'First name can not be blank.'
      elsif (last_name.nil? || last_name.empty?)
        raise NameInvalidError, 'Second name can not be blank.'
      elsif first_name[0] !~ /[A-Z]/
        raise NameInvalidError, 'First letter of first name is not capital.'
      else
        @first_name = first_name
        @last_name = last_name
      end
    rescue NameInvalidError => name_error
      puts name_error.message
    end
  end
end
