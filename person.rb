require './nameable'
require './book'
require './capitalizer'
require './trimdecorator'
require './decoratorbase'
require './rental'

# Make sure that your Person class inherits from Nameable

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id, :classroom

  def initialize(name, age = 0, parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def add_rental(book, date)
    @rentals << Rental.new(date, book, self) # Create a new rental with the person itself
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
