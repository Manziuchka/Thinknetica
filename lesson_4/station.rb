require_relative 'instance_counter'

class Station 
  include InstanceCounter
  attr_reader :name, :trains
  NAME = /^[a-z]{2,}/i
        
  def initialize(name)
    @name = name
    validate!
    @trains = []
    self.class.add_station(self)
    register_instance
  end
 
  class << self
    attr_reader :stations
  
    def add_station(station)
      @@stations ||= []
      @@stations << station
    end
  
    def all_stations
      @@stations
    end
  end

  def valid?
    validate!
    rescue
      false
  end

  def all_stations
    self.class.all_stations
  end

  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_type_trains(type)
    @trains.select {|train| train.type == type}
  end

  def each_train(&block) 
    block_given? ? @trains.each { |train| block.call(train) } : trains
  end

  protected
  
  def validate!
   raise StandardError, "Station name must include a-z characters" if name !~ NAME
  end
end 
