require_relative 'station'
require_relative 'route'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'menu'


def start
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
    when 1 Menu.add_station
    when 2 Menu.create_train
    when 3 Menu.create_route
    when 4 Menu.assign_route
    when 5 Menu.add_carriage
    when 6 Menu.delete_carriage
    when 7 Menu.move_forward
    when 8 Menu.move_back
    when 9 Menu.show_stations_and_trains
    else
      puts "Вы ввели что-то не то"
    end
    end
  end
