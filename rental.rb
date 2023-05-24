require_relative './person'
require_relative './book'
class Rental
  attr_reader :person, :book

  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end
end

person = Person.new(22, 'maximilianus')
person2 = Person.new(15, 'fuad')
book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
book2 = Book.new('The Hobbit', 'J. R. R. Tolkien')
book3 = Book.new('Lost', 'NetMessage')
rental = Rental.new('2021-01-01', person, book)
Rental.new('2021-01-02', person, book2)
Rental.new('2021-01-03', person2, book)
Rental.new('2021-01-04', person2, book3)
puts rental.date
puts book.rentals.count
puts(book.rentals.map(&:date))
puts person.rentals.count
puts rental.person.name
puts rental.book.title
puts rental.person.can_use_services
