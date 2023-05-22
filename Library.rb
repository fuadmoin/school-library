class Person
  def initialize(age, name = "unknown", parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = 0
  end

  def get_id
    @id
  end

  def get_name
    @name
  end

  def get_age
    @age
  end

  def set_name(name)
    @name = name
  end

  def set_age(age)
    @age = age
  end

  private def of_age
    @age >= 18
  end

  public def can_use_services
    of_age || @parent_permission
  end
end

class Student < Person
  def initialize(age, classroom, parent_permission = true, name = "unknown")
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

class Teacher < Person
  def initialize(age, specialization, name = "unknown", parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end




fuad = Student.new(17, "Grade 8", false, "Fuad")
fuad.set_age(16)
puts fuad.can_use_services

reviewer = Teacher.new(29, "Computer Science", "Jackson")
puts reviewer.can_use_services
