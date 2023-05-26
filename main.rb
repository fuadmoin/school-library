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
    break unless handle_choice(choice)
  end
end

def handle_choice(choice)
  actions = {
    1 => method(:handle_list_books),
    2 => method(:handle_list_people),
    3 => method(:handle_add_person),
    4 => method(:handle_add_book),
    5 => method(:handle_loop_create_rental),
    6 => method(:handle_list_rentals_by_person_id),
    7 => -> { false }
  }

  action = actions[choice]
  if action
    action.call
    result = action.call
    return result if result == false
  else
    puts 'Invalid choice!'
  end
  true
end

def handle_list_books
  list_books
end

def handle_list_people
  list_people
end

def handle_add_person
  add_person
end

def handle_add_book
  add_book
end

def handle_loop_create_rental
  loop_create_rental
end

def handle_list_rentals_by_person_id
  list_rentals_by_person_id
end

populate
main
