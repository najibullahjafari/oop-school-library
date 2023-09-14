# Create a class Nameable. Implement a method called correct_name that will raise a NotImplementedError.

class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement the correct_name method'
  end
end
