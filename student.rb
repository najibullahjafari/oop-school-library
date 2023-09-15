require './person'

class Student < Person
  attr_accessor :name

  def initialize(id, name: 'Unknown', age: 0)
    super(id, name, age)
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
