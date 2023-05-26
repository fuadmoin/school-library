require_relative './book'
require_relative './person'
require_relative './teacher'
require_relative './student'
require_relative './classroom'
require_relative './app'

@books = []
@students = []
@teachers = []

def main
  loop do
    display_menu
    choice = gets.chomp.to_i
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      add_person
    when 4
      add_book
    when 5
      break
    else
      puts 'Invalid choice!'
    end
  end
end

populate
main
