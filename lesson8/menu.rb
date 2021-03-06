class Menu
  attr_reader :stations, :trains, :routes, :carriges

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriges = []
  end

  def user_data
    loop do
      puts 'Нажмите 1 чтобы создать станцию'
      puts 'Нажмите 2 чтобы создать поезд'
      puts 'Нажмите 3 чтобы создать пассажирский вагон'
      puts 'Нажмите 4 чтобы создать грузовой вагон'
      puts 'Нажмите 5 чтобы создать маршрут'
      puts 'Нажмите 6 чтобы редактировать маршрут'
      puts 'Нажмите 7 чтобы назначить маршрут поезду'
      puts 'Нажмите 8 чтобы прицепить вагоны'
      puts 'Нажмите 9 чтобы отцепить вагоны'
      puts 'Нажмите 10 чтобы переместить вагоны на станцию вперед'
      puts 'Нажмите 11 чтобы переместить вагоны на станцию назад'
      puts 'Нажмите 12 чтобы просмотреть список станций'
      puts 'Нажмите 13 чтобы просмотреть список поездов на станции'
      puts 'Нажмите 0 чтобы закончить программу'
      x = gets.to_i
      break if x.zero?

      case x
      when 1
        add_station
      when 2
        create_train
      when 3
        create_passenger_carrige
      when 4
        create_cargo_carrige
      when 5
        create_route
      when 6
        edit_route
      when 7
        assign_route
      when 8
        add_carriage
      when 9
        delete_carriage
      when 10
        move_forward
      when 11
        move_back
      when 12
        show_stations
      when 13
        show_trains
      when 666
        generate_data
      else
        puts 'Вы ввели что-то не то'
      end
    end
  end

  def add_station
    puts 'Введите название станции'
    name = gets.chomp
    @stations << Station.new(name)
  end

  def create_train
    puts 'Введите номер поезда в формате: xxx-12'
    number = gets.chomp
    puts 'Если вы хотите создать пассажирский поезд, ведите: 1, или если вы хотите создать грузовой поезд, то ведите: 2'
    @type = gets.chomp
    if @type == '1'
      @trains << PassengerTrain.new(number)
      puts "Пассажирский поезд #{number} успешно создан"
    elsif @type == '2'
      @trains << CargoTrain.new(number)
      puts "Грузовой поезд #{number} успешно создан"
    else
      puts 'Необходимо указать 1 или 2, давайте попробуем еще раз'
      create_train
    end
  rescue StandardError
    puts 'Указан неверный номер поезда'
    create_train
  end

  def create_passenger_carrige
    puts 'Введите колличество мест в вагоне'
    seats = gets.to_i
    @carriges << PassengerCarriage.new(seats)
  end

  def create_cargo_carrige
    puts 'Введите объем вагона'
    volume = gets.to_i
    @carriges << CargoCarriage.new(volume)
  end

  def create_route
    puts 'Введите номер маршрута'
    route_number = gets.to_i
    @stations.each_with_index do |station, station_index|
      puts "#{station_index}; #{station.name}"
    end
    puts 'Для создания маршрута введите первую станцию'
    first_station = gets.to_i
    puts 'Введите конечную станцию'
    last_station = gets.to_i
    @routes << Route.new(@stations[first_station], @stations[last_station], route_number)
  end

  def edit_route
    @stations.each_with_index do |station, station_index|
      puts "#{station_index}; #{station.name}"
    end
    puts 'Введите номер станции которую вы хотите добавить в маршрут'
    station = gets.to_i
    @routes.each_with_index do |route, route_index|
      puts "#{route_index}; #{route.route_number}"
    end
    puts 'Выберете номер маршрута'
    route = gets.to_i
    puts 'введите 1, если хотите удалить станцию либо введите 2, если хотите добавить станцию'
    choice = gets.to_i
    @routes[route].add_stations(station) if choice == 2
    @routes[route].delete_staion(station) if choice == 1
  end

  def choose_train
    @trains.each_with_index do |train, train_index|
      puts "#{train_index}; #{train.number}"
    end
    puts 'Выберете поезд'
    @trains[gets.to_i]
  end

  def assign_route
    @routes.each_with_index do |route, route_index|
      puts "#{route_index}; #{route.route_number}"
    end
    puts 'Укажите номер маршрута'
    selected_route = gets.to_i
    selected_train = choose_train
    selected_train.assign route(@routes[selected_route])
  end

  def choose_carriage
    @carriges.each_with_index do |wagon, wagon_index|
      puts "#{wagon_index}; #{wagon.type_carriage}"
    end
    puts 'Выберете вагон'
    @carriges[gets.to_i]
  end

  def add_carriage
    selected_train = choose_train
    wagon = choose_carriage
    selected_train.add_carriage(wagon)
  end

  def delete_carriage
    selected_train = choose_train
    wagon = choose_carriage
    selected_train.delete_carriage(wagon)
  end

  def move_forward
    selected_train = choose_train
    selected_train.move_forward
  end

  def move_back
    selected_train = choose_train
    selected_train.move_back
  end

  def show_stations
    @stations.each do |station|
      puts station.name
    end
  end

  def show_trains
    @stations.each_with_index do |station, station_index|
      puts "#{station_index}; #{station.name}"
    end
    puts 'Введите номер станции на которой вы хотите посмотреть поезда'
    station = gets.to_i
    puts @stations[station].trains
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

  def generate_carrige
    @carriges << PassengerCarriage.new
    @carriges << CargoCarriage.new
    @carriges << PassengerCarriage.new
  end

  def generate_data
    generate_station
    generate_train
    generate_carrige
  end
end
