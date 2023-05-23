require_relative './person'
class Teacher < Person
  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end

reviewer = Teacher.new(29, 'Computer Science', parent_permission: false)
puts reviewer.can_use_services
