class Person
  def intitialize(id, name = 'Unknown',age = 0 ,parent_permission = true)
    @id = id
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def name = (value)
    @name = value
  end

  def age = (value)
    @age = value
  end

  def private_of_age?
    @age >= 18
  end

  def can_use_services?
    @age > || parent_permission
  end

end
