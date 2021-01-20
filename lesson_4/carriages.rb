require_relative 'manufacturer'

class Carriages
  include Manufacturer
  attr_reader :number, :capacity, :filled_capacity
  
  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @filled_capacity = 0
  end
  
  def fill(capacity)
    validate_free!(capacity)
    self.filled_capacity += capacity
  end

  def free_capacity
    capacity - filled_capacity
  end

  protected

  attr_writer :filled_capacity

  def validate_free!(capacity)
    raise StandardError, 'Carriage is full' if free_space < capacity
  end
end
