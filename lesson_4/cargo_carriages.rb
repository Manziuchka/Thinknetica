# frozen_string_literal: true

class CargoCarriages < Carriages
  attr_reader :type, :free, :occupied

  def initialize(number, _volume)
    super(number)
    @type = 'cargo'
  end
end
