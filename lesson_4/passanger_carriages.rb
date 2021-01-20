class PassangerCarriages < Carriages
  attr_reader :type, :free, :occupied
  
  ONE_SEAT = 1

  def initialize(number)
    super(number)
    @type = 'passanger'
  end

  def take_seat
    fill(ONE_SEAT)
  end
end
