require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'

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
      Station.new
    when 2
      Train.new
    when 3
      Route.add_stations
    when 4
      Train.set_route
    when 5
      PassengerTrain.add_carriage if @type = passanger
      CargoTrain.add_carriage if @type = cargo
    when 6
      PassengerTrain.delete_carriage if @type = passanger
      CargoTrain.delete_carriage if @type = cargo
    when 7
      Train.move_forward
    when 8
      Train.move_back
    when 9
      Route.stations
  else
    puts "Вы ввели что-то не то"
  end
end
