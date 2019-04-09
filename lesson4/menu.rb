class Menu
  attr_reader :add_station, :create_train, :create_route

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
