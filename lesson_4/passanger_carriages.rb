class PassangerCarriages < Carriages
  attr_reader :type, :free, :occupied

  def initialize(number, seat)
    super(number)
    @type = 'passanger'
    @free = seat
    @occupied = 0
  end

  def take_place
    @free -= 1
    @occupied += 1
  end
end
