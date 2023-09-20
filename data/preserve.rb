require 'json';

# Get Data
def get_data(file_name)
  if File.exist?(file_name)
    file_name = JSON.parse(File.read(file_name))
    return  "Data get from '#{file_name}'"
  else
    return []
  end
end

# Insert Data
def insert_data(file_name, data)
 if File.exist?(file_name)
    file = File.write(file_name, JSON.pretty_generate(data))
      return "Data has been inserted into '#{file_name}'"
    else
      return []
    end
  end

# Save Books
def save_books(books)
# &:to_json is used to convert elements to JSON.
 data = books.map(&:to_json)
 insert_data('books.json',data)
end

# Save People
def save_people(person)
  data = person.map(&:to_json)
  insert_data('person.json',data)
end



# Perserve
books_preserve = get_data('book.json')
