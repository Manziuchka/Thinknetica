class CargoCarriages < Carriages
  attr_reader :type

  def initialize(number)
    super(number)
    @type = 'cargo'
  end
end
