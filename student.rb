require './person'

class Student < Person
  attr_accessor :classroom, :name

  def initialize(id, age: 0, parent_permission: true, name: 'Unknown')
    super(id, name, age, parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
