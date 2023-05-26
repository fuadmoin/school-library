require_relative './nameable'
require_relative './name_decorator'
class Person < Nameable
  attr_accessor :name, :age

  attr_reader :id, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..10_000)
    @rentals = []
    super()
  end

  def can_use_services
    of_age || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age
    @age >= 18
  end
end
