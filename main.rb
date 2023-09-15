require_relative 'app'
require_relative 'nameable'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

def main
  books = [], people = [], rentals = []
  menu_options = [
    { number: 1, label: 'List all books', action: -> { list_books(books) } },
    { number: 2, label: 'List all people', action: -> { list_people(people) } },
    { number: 3, label: 'Create a person', action: -> { create_person_option(people) } },
    { number: 4, label: 'Create a book', action: -> { create_book_option(books) } },
    { number: 5, label: 'Create a rental', action: -> { create_rental_option(books, people, rentals) } },
    { number: 6, label: 'List rentals for a person', action: -> { list_rentals_option(people, rentals) } },
    { number: 7, label: 'Quit', action: -> { exit_app } }
  ]

  loop do
    display_menu(menu_options)
    choice = gets.chomp.to_i
    if choice.between?(1, menu_options.size)
      menu_options[choice - 1][:action].call
    else
      invalid_choice
    end
    break if choice == 7
  end
end

def display_menu(menu_options)
  puts 'Options:'
  menu_options.each { |option| puts "#{option[:number]}. #{option[:label]}" }
  print 'Enter your choice: '
end

def menu_options
  [
    { number: 1, label: 'List all books', action: method(:list_books) },
    { number: 2, label: 'List all people', action: method(:list_people) },
    { number: 3, label: 'Create a person', action: method(:create_person_option) },
    { number: 4, label: 'Create a book', action: method(:create_book_option) },
    { number: 5, label: 'Create a rental', action: method(:create_rental_option) },
    { number: 6, label: 'List rentals for a person', action: method(:list_rentals_option) },
    { number: 7, label: 'Quit', action: method(:exit_app) }
  ]
end

def create_person_option(people)
  print 'Enter person name: '
  name = gets.chomp
  print 'Enter person type (teacher or student): '
  type = gets.chomp.downcase
  print 'Enter ID for person: '
  id = gets.chomp.to_i
  person = create_person(id, name, type)
  people << person if person
end

def create_book_option(books)
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter book author: '
  author = gets.chomp
  book = create_book(title, author)
  books << book
end

def create_rental_option(books, people, rentals)
  print 'Enter book title for rental: '
  book_title = gets.chomp
  print 'Enter person name for rental: '
  person_name = gets.chomp
  print 'Enter rental date (yyyy-mm-dd): '
  date = gets.chomp
  book = books.find { |b| b.title == book_title }
  person = people.find { |p| p.name == person_name }
  if book && person
    rental = create_rental(book, person, date)
    rentals << rental
  else
    puts 'Book or person not found.'
  end
end

def list_rentals_option(_people, rentals)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  list_rentals_for_person(person_id, rentals)
end

def exit_app
  puts 'Exiting the app.'
end

main
