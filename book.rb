require './rental'
require './person'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(self, person, date)
    rentals << rental
    person.add_rental(rental)
  end
end
