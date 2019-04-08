class Menu

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
  puts "Если вы хотите создать пассажирский поезд, ведите: passenger,
  или если вы хотите создать грузовой поезд, то ведите: cargo"
  @type = gets.chomp
  @trains << PassengerTrain.new(number) if @type = passenger
  @trains << CargoTrain.new(number) if @type = cargo
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
  puts "#{@trains.each do |train|
    puts train.number
  end} укажите номер поезда, которому вы хотите задать маршрут"
  selected_train = gets.chomp
  puts "#{@routes.each do |route|
    puts route.route_number
  end} укажите номер маршрута"
  selected_route = gets.chomp
  Train.set_route
end

def add_carriage
end

def delete_carriage
end

def move_forward
end

def move_back
end

def show_stations_and_trains
end


end
