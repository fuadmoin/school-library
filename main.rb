require_relative './book'
require_relative './person'
require_relative './teacher'
require_relative './student'
require_relative './classroom'
require_relative './app'
require_relative './rental'

@books = []
@students = []
@teachers = []
@rentals = []

def main
  loop do
    display_menu
    choice = gets.chomp.to_i
    break if choice == 7

    handle_choice(choice)
  end
end

def handle_choice(choice)
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
    loop_create_rental
  when 6
    list_rentals_by_person_id
  else
    puts 'Invalid choice!'
  end
end

populate
main
