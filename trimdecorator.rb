require './decoratorbase'
# For the TrimmerDecorator: Create a class that inherits from the base Decorator class.

class TrimmerDecorator < DecoratorBase
  def correct_name
    super[0, 10]
  end
end
