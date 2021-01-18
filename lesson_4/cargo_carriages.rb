class CargoCarriages < Carriages
  attr_reader :type, :free, :occupied

  def initialize(number, volume)
    super(number)
    @type = 'cargo'
    @free = volume
    @occupied = 0
  end

  def take_volume(content)
    @free -= content
    @occupied += content
  end
end
