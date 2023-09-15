require './person'

class Student < Person
  attr_accessor :name

  def initialize(id, age: 0, parent_permission: true, name: 'Unknown')
    super(id, name, age, parent_permission)
    @classroom = nil
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
