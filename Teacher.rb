require './Person'
class Teacher 
  def intitialize(specialization, name = "Unkown", age = 0, id, parent_permission)
    super(name, age,parent_permission, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end