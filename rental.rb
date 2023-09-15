require './book'
require './person'
class Rental
     attr_accessor :book, :person, :date
    def initialize(book, person, date)
        @date = date    
        @book = book
        @person = person
    end
end