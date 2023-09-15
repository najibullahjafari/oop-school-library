require_relative 'nameable'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'classroom'


def list_books(books)
  puts 'List of Books:'
  books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

def list_people(people)
  puts 'List of People:'
  people.each do |person|
    puts "Name: #{person.name}, Type: #{person.class}"
  end
end

def create_person(name, type)
  if type == 'teacher'
    Teacher.new(name)
  elsif type == 'student'
    Student.new(name)
  else
    puts 'Invalid person type.'
  end
end

def create_book(title, author)
  Book.new(title, author)
end

def create_rental(book, person, date)
  Rental.new(book, person, date)
end

def list_rentals_for_person(person_id, rentals)
  puts "Rentals for Person ID #{person_id}:"
  person_rentals = rentals.select { |rental| rental.person.id == person_id }
  person_rentals.each do |rental|
    puts "Book: #{rental.book.title}, Date: #{rental.date}"
  end
end
