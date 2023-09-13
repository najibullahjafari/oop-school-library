# Create a class Nameable. Implement a method called correct_name that will raise a NotImplementedError.

class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement the correct_name method'
  end
end

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

# Prepare base Decorator Make sure that it inherits from Nameable.
class DecoratorBase < Nameable
  def initialize(nameable_obj)
    super()
    @nameable = nameable_obj
  end

  def correct_name
    @nameable.correct_name
  end
end

# Create a class that inherits from the base Decorator class.

class CapitalizeDecorator < DecoratorBase
  def correct_name
    super.capitalize
  end
end

# For the TrimmerDecorator: Create a class that inherits from the base Decorator class.

class TrimmerDecorator < DecoratorBase
  def correct_name
    super[0, 10]
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
