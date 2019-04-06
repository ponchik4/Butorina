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
      station1 = Station.new('station1')
      station2 = Station.new('station2')
    when 2
      train1 = Train.new('67', 'cargo')
    when 3
      route = Route.new(station1, station2)
    when 4
      route = train1.set_route(route)
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
