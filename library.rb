class Person
    def initialize(age, name = 'unknown', parent_permission: true)
      @name = name
      @age = age
      @parent_permission = parent_permission
      @id = 0
    end
  
    attr_accessor :name, :age
  
    attr_reader :id
  
    def can_use_services
      of_age || @parent_permission
    end
  
    private
  
    def of_age
      @age >= 18
    end
  end
  
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
  
  class Teacher < Person
    def initialize(age, specialization, name = 'unknown', parent_permission: true)
      super(age, name, parent_permission: parent_permission)
      @specialization = specialization
    end
  
    def can_use_services
      true
    end
  end
  
  fuad = Student.new(17, 'Grade 8', 'Fuad', parent_permission: true)
  fuad.age = 16
  puts fuad.age
  puts fuad.can_use_services
  reviewer = Teacher.new(29, 'Computer Science', parent_permission: false)
  puts reviewer.can_use_services
  