require './nameable'
require './capitalizedecorator'
require './trimdecorator'
require './decoratorbase'
# Make sure that your Person class inherits from Nameable

class Person < Nameable
  def initialize(id, name = 'Unknown', age = 0, parent_permission: true)
    super()
    @id = id
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def correct_name
    @name
  end

  attr_accessor :name, :age
  attr_reader :id

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
