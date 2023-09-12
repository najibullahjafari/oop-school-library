class Person
  def initialize(id, name = 'Unknown', age = 0, parent_permission: true)
    @id = id
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  attr_writer :name, :age

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
