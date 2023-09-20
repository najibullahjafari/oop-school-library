# data_manager.rb
require 'json'

class DataManager
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Load data from JSON files
  def load_data
    load_books
    load_people
    load_rentals
  end

  # Save data to JSON files
  def save_data
    begin
      save_books
      save_people
      save_rentals
      puts 'Data saved successfully.'
    rescue StandardError => e
      puts "Error saving data: #{e.message}"
    end
  end

  private

  # Load books 
  def load_books
    return unless File.exist?('books.json')

    json_str = File.read('books.json')
    @books = JSON.parse(json_str).map { |book_data| Book.new(book_data['title'], book_data['author']) }
  end

  # Save books
  def save_books
    File.open('books.json', 'w') do |file|
      file.puts @books.map { |book| { 'title' => book.title, 'author' => book.author } }.to_json
    end
  end

  # Load people 
  def load_people
    return unless File.exist?('people.json')

    json_str = File.read('people.json')
    @people = JSON.parse(json_str).map do |person_data|
      if person_data['type'] == 'Student'
        classroom = Classroom.new(person_data['classroom'])
        Student.new(person_data['name'], person_data['age'], classroom, parent_permission: person_data['parent_permission'])
      elsif person_data['type'] == 'Teacher'
        Teacher.new(person_data['name'], person_data['age'], person_data['specialization'])
      else
        nil
      end
    end.compact
  end


  # Save people 
def save_people
  # existing_people = []

  # if File.exist?('people.json')
  #   json_str = File.read('people.json')
  #   existing_people = JSON.parse(json_str)
  # end

  serialized_people = @people.map do |person|
    if person.is_a?(Student)
      {
        'id' => person.id,
        'name' => person.name,
        'age' => person.age,
        'classroom' => person.classroom.label,
        'type' => 'Student',
        'parent_permission' => person.instance_variable_defined?(:@parent_permission) ? person.instance_variable_get(:@parent_permission) : nil,
        'rentals' => person.rentals.map { |rental| { 'date' => rental.date, 'book_id' => rental.book.id } }
      }
    elsif person.is_a?(Teacher)
      {
        'id' => person.id,
        'name' => person.name,
        'age' => person.age,
        'specialization' => person.specialization,
        'type' => 'Teacher',
        'rentals' => person.rentals.map { |rental| { 'date' => rental.date, 'book_id' => rental.book.id } }
      }
    end
  end

  all_people = existing_people + serialized_people

  File.open('people.json', 'w') do |file|
    file.puts all_people.to_json
  end
end


  # Load rentals 
  def load_rentals
    return unless File.exist?('rentals.json')

    json_str = File.read('rentals.json')
    @rentals = JSON.parse(json_str).map do |rental_data|
      book = @books.find { |b| b.id == rental_data['book_id'] }
      person = @people.find { |p| p.id == rental_data['person_id'] }
      Rental.new(rental_data['date'], book, person)
    end
  end

  # Save rentals 
  def save_rentals
    File.open('rentals.json', 'w') do |file|
      file.puts @rentals.map { |rental| { 'date' => rental.date, 'book_id' => rental.book.id, 'person_id' => rental.person.id } }.to_json
    end
  end
end
