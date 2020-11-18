require_relative 'instance_counter'

class Station 
  include InstanceCounter
  attr_reader :name, :trains
        
  def initialize(name)
    @name = name
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

end 
