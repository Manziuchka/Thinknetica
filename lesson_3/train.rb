# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, 
# эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). 
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train
  attr_accessor :speed
  attr_reader :carriages, :station, :type

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def boost_speed
    @speed += 10
  end

  def stop_train
    @speed = 0
  end

  def add_carriages
    @carriages += 1 if @speed == 0
  end

  def delete_carriages
    @carriages -= 1 if @speed == 0 && @carriages > 0
  end
  
  def add_route(route)
    @route = route
    @station = route.stations.first
    route.stations.first.add_train(self)
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
