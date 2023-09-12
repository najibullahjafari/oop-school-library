require './Person.rb'
class Student < Person
  def intitialize(classroom= 'Unkown', name = "Unkown", age = 0, id, parent_permission)
    super(name, age, parent_permission, id)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end