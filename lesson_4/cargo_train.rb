# frozen_string_literal: true

class CargoTrain < Train
  attr_reader :type, :number

  def initialize(number)
    super(number)
    @type = 'cargo'
  end
end
