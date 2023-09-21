require_relative 'nameable'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'classroom'
require_relative 'data/data_manager'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    @data_manager = DataManager.new
    load_data # Load
  end

  def load_data
    @data_manager.load_data
    @books = @data_manager.books
    @people = @data_manager.people
    @rentals = @data_manager.rentals
  end

  def save_data
    @data_manager.books = @books
    @data_manager.people = @people
    @data_manager.rentals = @rentals
    @data_manager.save_data
  end

  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      puts "Name: #{person.name}, Type: #{person.class}, Id #{person.id}, Age #{person.age}"
    end
  end

  def create_person
    puts 'Choose the person type:'
    puts '1. Student'
    puts '2. Teacher'
    print 'Enter your choice: '
    choice = gets.chomp.to_i
    case choice
    when 1
      student = create_student
      @people << student
      puts 'The student added'
    when 2
      teacher = create_teacher
      @people << teacher
      puts 'Teacher added'
    else
      puts 'Invalid choice.'
    end
    save_data
  end

  def create_student
    print 'Enter student name: '
    name = gets.chomp
    print 'Enter student Age: '
    age = gets.chomp.to_i
    print 'Enter student classroom: '
    classr = gets.chomp
    classroom = Classroom.new(classr)
    print 'Has the permission? [y/n]: '
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(name, age, classroom, parent_permission: parent_permission)
  end

  def create_teacher
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher Age: '
    age = gets.chomp.to_i
    print 'Enter the specialization: '
    specialization = gets.chomp
    Teacher.new(name, age, specialization)
  end

  def create_book
    print 'Enter title for book: '
    title = gets.chomp
    print 'Enter the author of book: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'The book added'
  end

  def create_rental
    puts 'Select a book'
    @books.each_with_index { |book, index| puts "#{index}), #{book.title}" }
    booki = gets.chomp.to_i
    puts 'Select a person:'
    @people.each_with_index { |person, index| puts "#{index}), #{person.name}" }
    personi = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[booki], @people[personi])
    puts 'Rental created'
  end

  def list_rentals_for_person
    print 'Enter person id: '
    personi = gets.chomp.to_i
    rentals = @rentals.select do |rental|
      rental.person && rental.person.id == personi
    end
    if rentals.empty?
      puts 'No rentals found for that id.'
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def exit_app
    save_data
    puts 'exited'
    exit
  end
end
