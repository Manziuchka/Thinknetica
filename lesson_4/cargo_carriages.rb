class CargoCarriages < Carriages
  attr_reader :type, :free, :occupied

  def initialize(number, volume)
    super(number)
    @type = 'cargo'
  end
end
