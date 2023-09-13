require './nameable'
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
