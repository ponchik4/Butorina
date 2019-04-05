require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'freight_car'
require_relative 'coach'


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

  station1 = Station.new if value == "1"
  train1 = Train.new if value == "2"

  break if value == "0"
  case x
when 1
  puts Station.new
when 2
  puts Train.new
when 3
when 4
when 5
when 6
when 7
when 8
when 9

else
  puts "Some other number"
end
end
