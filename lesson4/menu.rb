class Menu
  attr_reader :add_station, :create_train, :create_route

  def user_data
    loop do
      puts "Нажмите 1 чтобы создать станцию"
      puts "Нажмите 2 чтобы создать поезд"
      puts "Нажмите 3 чтобы создать или редактировать маршрут"
      puts "Нажмите 4 чтобы назначить маршрут поезду"
      puts "Нажмите 5 чтобы добавить вагоны"
      puts "Нажмите 6 чтобы отцепить вагоны"
      puts "Нажмите 7 чтобы переместить вагоны на станцию вперед"
      puts "Нажмите 8 чтобы переместить вагоны на станцию назад"
      puts "Нажмите 9 чтобы просмотреть список станций и список поездов на станции"
      puts "Нажмите 0 чтобы закончить программу"
      x = gets.to_i
      break if x == 0
      case x
      when 1
        menu.add_station
      when 2
        menu.create_train
      when 3
        menu.create_route
      when 4
        menu.assign_route
      when 5
        menu.add_carriage
      when 6
        menu.delete_carriage
      when 7
        menu.move_forward
      when 8
        menu.move_back
      when 9
        menu.show_stations_and_trains
      else
        puts "Вы ввели что-то не то"
      end
    end
  end

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def add_station
    puts "Введите название станции"
    name = gets.chomp
    @stations << Station.new(name)
  end

  def create_train
    puts "Введите номер поезда"
    number = gets.chomp
    puts "Если вы хотите создать пассажирский поезд, ведите: passenger, \
    или если вы хотите создать грузовой поезд, то ведите: cargo"
    @type = gets.chomp
    if @type == "passenger"
      @trains << PassengerTrain.new(number)
    elsif @type == "cargo"
      @trains << CargoTrain.new(number)
    else
      puts "Вы допустили ошибку, попробуйте еще раз"
    end
  end

  def create_route
    puts "Для создания маршрута введите первую станцию"
    first_station = gets.chomp
    puts "Введите конечную станцию"
    last_station = gets.chomp
    puts "Введите номер маршрута"
    route_number = gets.chomp
    @routes << Route.new(first_station, last_station, route_number)
  end

  def assign_route
    @trains.each do |train|
      puts train.number
    end
    puts "Укажите номер поезда, которому вы хотите задать маршрут"
    selected_train = gets.chomp
    @routes.each do |route|
      puts route.route_number
    end
    puts "Укажите номер маршрута"
    selected_route = gets.chomp
    (selected_train).set_route(selected_route)
  end

  def add_carriage
    (selected_train).add_carriage
  end

  def delete_carriage
    (selected_train).delete_carriage
  end

  def move_forward
    (selected_train).move_forward
  end

  def move_back
    (selected_train).move_back
  end

  def show_stations_and_trains
    @stations.each do |staion|
      puts staion.name
    end
  end

  def generate_station
    @stations << Station.new('msk')
    @stations << Station.new('spb')
    @stations << Station.new('pskov')
  end
  def generate_train
    @trains << PassengerTrain.new('xxxx1')
    @trains << PassengerTrain.new('s222222pb')
    @trains << PassengerTrain.new('sdfsdfdsfds')
    @trains << CargoTrain.new('XXXX32')
  end

  def generate_data
    generate_station
    generate_train
  end
end
