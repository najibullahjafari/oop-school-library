require_relative 'app'
require_relative 'nameable'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

def main
  books = []
  people = []
  rentals = []

  loop do
    # Present the user with a list of options
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
    print 'Enter your choice: '

    choice = gets.chomp.to_i

    case choice
    when 1
      list_books(books)
    when 2
      list_people(people)
    when 3
      print 'Enter person name: '
      name = gets.chomp
      print 'Enter person type (teacher or student): '
      type = gets.chomp.downcase
      person = create_person(name, type)
      people << person if person
    when 4
      print 'Enter book title: '
      title = gets.chomp
      print 'Enter book author: '
      author = gets.chomp
      book = create_book(title, author)
      books << book
    when 5
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
    when 6
      print 'Enter person ID: '
      person_id = gets.chomp.to_i
      list_rentals_for_person(person_id, rentals)
    when 7
      puts 'Exiting the app.'
      break
    else
      puts 'Invalid choice. Please enter a valid option.'
    end
  end
end
main
