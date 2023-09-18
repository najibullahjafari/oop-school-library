require_relative 'app'
require_relative 'nameable'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative './lib/main_methods'

# Define the 'act' hash here
ACTION = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals_for_person,
  7 => :exit_app
}.freeze

def display_menu
  puts "\nPlease choose an option:"
  ACTION.each { |k, v| puts "#{k} - #{v.to_s.tr('_', ' ')}" }
  print 'Option: '
  gets.chomp.to_i
end

def main
  app = App.new

  loop do
    option = display_menu
    handle_option(app, option)
  end
end

main
