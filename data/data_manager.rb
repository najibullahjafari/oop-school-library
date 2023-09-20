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
    save_books
    save_people
    save_rentals
    puts 'Data saved successfully.'
  rescue StandardError => e
    puts "Error saving data: #{e.message}"
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
        Student.new(person_data['name'], person_data['age'], classroom,
                    parent_permission: person_data['parent_permission'])
      elsif person_data['type'] == 'Teacher'
        Teacher.new(person_data['name'], person_data['age'], person_data['specialization'])
      end
    end.compact
  end

  # Save people
  def save_people
    serialized_people = @people.map do |person|
      data = {
        'id' => person.id,
        'name' => person.name,
        'age' => person.age,
        'type' => person.is_a?(Student) ? 'Student' : 'Teacher',
        'rentals' => person.rentals.map { |rental| { 'date' => rental.date, 'book_id' => rental.book.id } }
      }

      data['classroom'] = person.classroom.label if person.is_a?(Student)
      data['specialization'] = person.specialization if person.is_a?(Teacher)
      data['parent_permission'] = person.instance_variable_get(:@parent_permission) if person.is_a?(Student)

      data
    end

    File.open('people.json', 'w') do |file|
      file.puts serialized_people.to_json
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
  rescue Errno::ENOENT
    # Handle the case when 'rentals.json' doesn't exist
    @rentals = []
  rescue JSON::ParserError => e
    # Handle JSON parsing errors
    puts "Error parsing 'rentals.json': #{e.message}"
    @rentals = []
  end

  # Save rentals
  def save_rentals
    File.open('rentals.json', 'w') do |file|
      rental_data = @rentals.map do |rental|
        book_id = rental.book ? rental.book.id : nil
        person_id = rental.person ? rental.person.id : nil
  
        {
          'date' => rental.date,
          'book_id' => book_id,
          'person_id' => person_id
        }
      end
  
      file.puts rental_data.to_json
    end
  end
  
end
