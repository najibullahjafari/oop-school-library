require './decoratorbase'
# Create a class that inherits from the base Decorator class.

class CapitalizeDecorator < DecoratorBase
  def correct_name
    super.capitalize
  end
end
