require './person'

class Teacher < Person
  def initialize(id, name = 'Unknown', age = 0)
    super(id, name, age)
  end

  def can_use_services?
    true
  end
end
