class Book
  attr_accessor :title, :author, :id, :rentals

  @@last_id = 0

  def initialize(title, author)
    @title = title
    @author = author
    @id = generate_id
    @rentals = []
  end

  def add_rental(person, date)
    @rentals << Rental.new(date, self, person)
  end

  def generate_id
    @@last_id += 1
  end

  # Add methods for handling rentals, e.g., check_in and check_out
end
