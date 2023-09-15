require './nameable'
require './book'
require './capitalizer'
require './trimdecorator'
require './decoratorbase'
require './rental'

# Make sure that your Person class inherits from Nameable

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(id, name = 'Unknown', age = 0, parent_permission: true)
    super()
    @id = id
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(book, self, date) # Create a new rental with the person itself
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
