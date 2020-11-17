require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :stations
 
  def initialize(first, last)
    @stations = [first, last]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_route
   @stations.first.name + " --> " + @stations.last.name
  end

  def show_all_stations
    @stations.each_with_index {|station, index| puts "#{index+1}. #{station.name}"}
  end
end
