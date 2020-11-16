require_relative 'manufacturer'

class Train
  include Manufacturer
  attr_accessor :speed
  attr_reader :carriages, :station, :type, :route, :number

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
  end

  class << self
    attr_reader :trains
    
    def find(number)
      trains.key?(number) ? trains[number] : nill
    end
  end

  def boost_speed
    @speed += 10
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
