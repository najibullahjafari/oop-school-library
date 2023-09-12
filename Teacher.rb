require './person'

class Teacher
  def initialize(id, specialization, name = 'Unknown', age = 0, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
