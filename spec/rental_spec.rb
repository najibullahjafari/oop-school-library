require 'date'
require_relative '../rental'

describe Rental do
  it 'should initialize with the correct attributes' do
    date = Date.new(2023, 9, 21)
    book = instance_double('Book', rentals: [])
    person = instance_double('Person', rentals: [])

    rental = Rental.new(date, book, person)

    expect(rental.date).to eq(date)
    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
  end
end
