require './person'

class Student < Person
  def initialize(id, age: 0, parent_permission: true, classroom: 'Unknown', name: 'Unknown')
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
