require_relative './person'
class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @hooky = '¯\(ツ)/¯'
  end

  def play_hooky
    @hooky
  end
end

fuad = Student.new(17, 'Grade 8', 'Fuad', parent_permission: true)
fuad.age = 16
puts fuad.age
puts fuad.can_use_services
