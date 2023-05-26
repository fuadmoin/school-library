require_relative './person'
require_relative './classroom'
class Student < Person
  attr_accessor :classroom, :name, :age

  def initialize(age, croom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    add_to_classroom(croom)
    @hooky = '¯\(ツ)/¯'
  end

  def play_hooky
    @hooky
  end

  def add_to_classroom(croom)
    @classroom = croom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
