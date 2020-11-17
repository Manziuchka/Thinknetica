require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passanger_train'
require_relative 'cargo_train'
require_relative 'carriages'
require_relative 'passanger_carriages'
require_relative 'cargo_carriages'
require_relative 'manufacturer'

class Main

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def help
    puts "Создать пассажирский поезд: create_train"
    puts "Создать станцию: create_station"
    puts "Показать все станции: show_all_stations"
    puts "Показать все поезда: show_all_trains"
    puts "Создать маршрут: create_route"
    puts "Добавить станцию в маршрут: add_station"
    puts "Удалить станцию из маршрута: delete_station"
    puts "Назначить маршрут поезду: add_route"
    puts "Добавить вагон к поезду: add_carriages"
    puts "Отцепить вагон от поезда: delete_carriages"
    puts "Переместить поезд вперед: move_next_station"
    puts "Переместить поезд назад: move_previous_station"
  end

  def interface
    help
    loop do
      puts "Введите команду "
      case gets.chomp
      when "exit"
        break
      when "create_train"
        create_train
      when "create_station"
        create_station
      when "show_all_stations"
        show_all_stations
      when "show_all_trains"
        show_all_trains
      when "create_route"
        create_route
      when "add_station"
        add_station
      when "delete_station"
        delete_station
      when "add_route"
        add_route
      when "add_carriages"
        add_carriages
      when "delete_carriages"
        delete_carriages
      when "move_next_station"
        move_next_station
      when "move_previous_station"
        move_previous_station
    end
  end

  def create_station
    puts "Введите имя станции"
    station = Station.new(gets.chomp)
    @stations << station
    station
  end

  def show_all_stations
    puts Station.all
  end

  def create_train
    puts "Для создания пассажирского поезда нажмите 1. Для создания грузового поезда нажмите 2"
    choose = gets.chomp.to_i
    if choose == 1
      puts "Введите номер пассажирского поезда"
      number = gets.chomp
      @trains << PassangerTrain.new(number)
      elsif choose == 2
        puts "Введите номер грузового поезда"
        number = gets.chomp
        @trains << CargoTrain.new(number)
      else 
        puts "ERROR"
    end
  end

  def show_all_trains
    @trains.each_with_index {|train, index| puts "#{index+1}. #{train.type} № #{train.number}"}
  end

  def create_route
    puts "Введите первую станцию "
    first = Station.new(gets.chomp)
    puts "Введите последнюю станцию "
    last = Station.new(gets.chomp)
    @routes << Route.new(first, last)
  end

  def add_station
    route = choose_route
    puts "Выбранный маршрут: " + route.show_route
    station = create_station
    puts "Новая станция: #{station.name}"
    route.add_station(station)
    route.show_all_stations
  end

  def delete_station
    route = choose_route
    route.show_all_stations
    puts "Выберите номер станции: "
    station_index = gets.chomp.to_i
    route.delete_station(route.stations[station_index-1])
    puts "Маршрут: "
    route.show_all_stations
  end

  def add_route
    train = choose_train
    route = choose_route
    train.add_route(route)
  end

  def add_carriages
    train = choose_train
    carriages = create_carriages
    puts "Вагоны в поезде: #{train.carriages}"
    train.add_carriages(carriages)
    puts "Вагоны в поезде: #{train.carriages}"
  end
 
  def delete_carriages
    train = choose_train
    train.carriages.each_with_index {|carriage, index| puts "#{index+1}. #{carriage.number}"}
    puts "Выберите порядковый номер вагона: "
    carriage_index = gets.chomp.to_i
    train.delete_carriages(train.carriages[carriage_index-1])
    puts "Колличество вагонов: #{train.carriages}"
  end
  
  def move_next_station
    train = choose_train
    puts "Текущая станция: #{train.current_station.name}"
    train.move_next_station
    puts "Текущая станция: #{train.current_station.name}"
  end

  def move_previous_station
    train = choose_train
    puts "Текущая станция: #{train.current_station.name}"
    train.move_previous_station
    puts "Текущая станция: #{train.current_station.name}"
  end

  private
  def choose_route
    @routes.each_with_index {|route, index| puts "#{index+1}. #{route.show_route}"}
    puts "Выберите номер маршрута: "
    route_index = gets.chomp.to_i
    @routes[route_index-1]
  end

  def choose_train
    show_all_trains
    puts "Выберите порядковый номер поезда: "
    train_index = gets.chomp.to_i
    train = @trains[train_index-1]
  end
  
  def create_carriages
    puts "Введите 1 если нужен пассажирский вагон и 2 если нужен грузовой вагон"
    choose = gets.chomp.to_i
    puts "Введите номер вагона"
    number_carriages = gets.chomp.to_i
    if choose == 1 
      carriages = PassangerCarriages.new(number_carriages)
      puts "Создан вагон типа #{carriages.type} с номером #{number_carriages}"
    elsif choose == 2
      carriages = CargoCarriages.new(number_carriages)
      puts "Создан вагон типа #{carriages.type} с номером #{number_carriages}"
    else
        puts "ERROR"
    end
    carriages
  end

  Main.new.interface
end
