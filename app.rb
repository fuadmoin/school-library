require_relative './book'
require_relative './person'
require_relative './rental'
require_relative './teacher'
require_relative './student'
require_relative './classroom'

def populate
  grade9 = Classroom.new('Grade 9')
  student1 = Student.new(17, grade9, 'std1', parent_permission: true)
  student2 = Student.new(18, grade9, 'std2')
  @students << (student1)
  @students << (student2)
  teacher = Teacher.new(29, 'Computer Science', 'Ms. Langtree')
  teacher2 = Teacher.new(29, 'Computer Science', 'Ms. Lemon')
  @teachers << (teacher)
  @teachers << (teacher2)
  book1 = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
  book2 = Book.new('The Hobbit', 'J. R. R. Tolkien')
  @books << book1
  @books << book2
end

def display_menu
  system 'cls'
  puts 'Welcome to School Library App!'.center(40, '-')
  puts "\n"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Add a person'
  puts '4 - Add a book'
  puts '5 - Exit'
  print 'Enter your choice: '
end

def list_books
  system 'cls'
  puts 'List of books'.center(32)
  count = 0
  @books.each do |book|
    puts "Book #{count += 1} Title: #{book.title} Author: #{book.author}"
  end
  puts ''
  print 'press r to return to the main menu... : '
  choice2 = gets.chomp
  system 'cls' if %w[r R].include?(choice2)
end

def list_people
  system 'cls'
  puts 'List of people'.center(32)
  count = 0
  @students.each do |student|
    puts "Student #{count += 1} Name: #{student.name} Age: #{student.age} "
  end
  count = 0
  @teachers.each do |teacher|
    puts "Teacher #{count += 1} Name: #{teacher.name} Age: #{teacher.age} "
  end
  puts ''
  print 'press r to return to the main menu... : '
  choice2 = gets.chomp
  system 'cls' if %w[r R].include?(choice2)
end

def add_person
  system 'cls'
  loop do
    print 'Do you want to add a student (1) or a teacher (2)? (Enter 3 to go back): '.center(10)
    choice3 = gets.chomp.to_i
    case choice3
    when 1
      add_student_loop
    when 2
      add_teacher_loop
    when 3
      system 'cls'
      break
    else
      puts 'Invalid choice!'
    end
  end
end

def add_student_loop
  loop do
    add_student
    system 'cls'
    puts 'Student added!'
    puts '1: Add another student'
    puts '2: Return to previous menu'
    print 'Enter your choice: '
    choice2 = gets.chomp.to_i
    if choice2 == 2
      system 'cls'
      break
    end
    system 'cls'
  end
end

def add_student
  puts 'Add a student'.center(32)
  print 'age: '
  age = gets.chomp.to_i
  print 'Classroom: '
  classroom = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? (Y/N): '
  parent_permission = gets.chomp
  parent_permission = %w[Y y].include?(parent_permission)
  clsrm = Classroom.new(classroom)
  @students.push(Student.new(age, clsrm, name, parent_permission: parent_permission))
end

def add_teacher_loop
  loop do
    add_teacher
    system 'cls'
    puts 'Teacher added!'
    puts '1: Add another teacher'
    puts '2: Return to previous menu'
    print 'Enter your choice: '
    choice2 = gets.chomp.to_i
    if choice2 == 2
      system 'cls'
      break
    end
    system 'cls'
  end
end

def add_teacher
  puts 'Add a teacher'.center(32)
  print 'age: '
  age = gets.chomp.to_i
  print 'Specialization: '
  specialization = gets.chomp
  print 'Name: '
  name = gets.chomp
  @teachers.push(Teacher.new(age, specialization, name))
end

def add_book
  system 'cls'
  puts 'Add a book'.center(32)
  print 'Title:'
  title = gets.chomp
  print 'Author:'
  author = gets.chomp
  @books.push(Book.new(title, author))
  loop do
    system 'cls'
    puts 'Book added!'
    puts '1: Add another book'
    puts '2: Return to main menu'
    print 'Enter your choice: '
    choice2 = gets.chomp.to_i
    if choice2 == 2
      system 'cls'
      break
    end
  end
end
