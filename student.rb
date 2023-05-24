require_relative './person'
require_relative './classroom'
class Student < Person
  attr_accessor :classroom

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

grade8 = Classroom.new('Grade 8')
fuad = Student.new(17, grade8, 'Fuad', parent_permission: true)
fuad.age = 16
puts fuad.age
puts fuad.can_use_services
puts fuad.classroom.label
