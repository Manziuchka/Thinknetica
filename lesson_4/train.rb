require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  attr_accessor :speed
  attr_reader :carriages, :station, :type, :route, :number
  TRAIN_NUMBER = /^[a-z0-9]{3}-*[a-z0-9]{2}$/i

  def initialize(number)
    @number = number
    validate!
    @carriages = []
    @speed = 0
    self.class.add_new_train(self, number)
    register_instance
  end

  def valid?
    validate!
    rescue
      false
  end

  class << self
    attr_reader :trains

    def add_new_train(train, number)
      @@trains ||= {}
      @@trains[number] = train
    end
    
    def find(number)
      @@trains.key?(number) ? @@trains[number] : nil
    end
  end

  def boost_speed
    @speed += 10
  end
 
  def find(number)
    self.class.find(number)
  end

  def stop_train
    @speed = 0
  end

  def add_carriages(carriages)
    return 'Error' if carriages.type != @type && @speed == 0
    @carriages << carriages
  end

  def delete_carriages(carriages)
    @carriages.delete(carriages) if @speed == 0
  end

  def each_carriage(&block)
    block_given? ? carriages.each_with_index{|carriage, index| block.call(carriage, index)} : carriages
  end
  
  def add_route(route)
    @route = route
    @station = route.stations.first
    @station.add_train(self)
  end

  def current_station
    @route.stations[current_station_index]
  end

  def next_station
    @route.stations[current_station_index + 1] unless last?
  end

  def previous_station
    @route.stations[current_station_index - 1] unless first?
  end

  def move_next_station
    unless last?
      @station.send_train(self)
      @station = @route.stations[current_station_index + 1] 
      @station.add_train(self)
    end
    @station
  end

  def move_previous_station
    unless first?
      @station.send_train(self)
      @station = @route.stations[current_station_index - 1]
      @station.add_train(self)
    end
    @station
  end

  def show_route
    @route.show_route
  end

  private

  def validate!
    raise StandardError, "Wrong train number" if number !~ TRAIN_NUMBER
  end

  def current_station_index
    @route.stations.index(@station)
  end

  def first?
    @station == @route.stations.first
  end

  def last?
    @station == @route.stations.last
  end
end
