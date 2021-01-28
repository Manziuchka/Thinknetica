# frozen_string_literal: true

class PassangerTrain < Train
  attr_reader :type, :number

  def initialize(number)
    super(number)
    @type = 'passanger'
  end
end
