require_relative 'object_store'

class Play
  include MyObjectStore

  attr_accessor :age, :fname, :lname, :email

  def validate
    true
  end

  validate :email, uniqueness: true

  def to_s
    "name => #{fname} #{lname}, age => #{age}, email => #{email}"
  end
end
