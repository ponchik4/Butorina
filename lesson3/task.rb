class Station

  attr_accessor :trains
  attr_reader :name

  def initialize(name)
   @name = name
   @trains = []
  end

  def add_train (train)
    self.trains << train
  end

  def remove_train(train)
    self.trains.delete(train)
  end

  def get_train_by_type(type)
    self.trains.select.count { |train| train.type == train }
  end

end




class Route

  attr_accessor :stations

  def initialize (first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_stations(station)
    @stations.add(1, station)
  end

  def intermediate_staion(station)
    stantions.delete(station)
  end

  def show_staion
    @stantions.each { |station| puts station.name }
  end

end



Класс Train (Поезд):




class Train

  attr_accessor :speed
  attr_reader :carriage, :add_carriage, :show_staion, :next_station, :current_station, :previous_station


  def initialize (number, type, carriage, route)
    @number = number
    @type = type
    @carriage = carriage
    @route = route.stations[0]
    @current_station = @route
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriage.add +=1 if @speed == 0
  end

  def delete_carriage
    @carriage.delete -=1 if @speed == 0
  end

  def current_station
   @route.stations[@current_station]
  end

  def next_station
   @route.stations[@current_station + 1]
  end

  def previous_station
   @route.stations[@current_station - 1]
  end

end
