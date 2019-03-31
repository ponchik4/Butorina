class Station
  attr_reader :name, :trains

  def initialize(name)
   @name = name
   @trains = []
  end

  def add_train (train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def get_train_by_type(type)
    @trains.select { |train| train.type == train }
  end
end


class Route
  def initialize (first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = []
  end

  def stations
  [@first_station, @stations, @last_station].flatten
  end

  def add_stations(station)
    @stations.push(station)
  end

  def intermediate_staion(station)
    return if [@first_station, @last_station].include?(station)
    @stantions.delete(station)
  end
end


class Train
  attr_reader :carriage, :current_station, :speed, :type

  def initialize (number, type)
    @number = number
    @type = type
    @carriage = 0
  end

  def increase_speed(speed = 5)
    @speed += speed
    @speed = 0 if @speed < 0
  end

  def decrease_speed(speed = 5)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriage + 1 if @speed == 0
  end

  def delete_carriage
    @carriage - 1 if @speed == 0
    @carriage = 0 if @carriage < 0
  end

  def set_route(route)
    @route = route
    @current_station = route.stations.first
  end

  def move_forward
   @current_station.remove_train(self)
   @current_station = next_station
   @current_station.add_train(self)
  end

  def move_back
    @current_station.remove_train(self)
    @current_station = previous_station
    @current_station.add_train(self)
  end

  def next_station
   @route.stations[get_current_station_index(@current_station) + 1] if @current_station != @last_station
  end

  def previous_station
   @route.stations[get_current_station_index(@current_station) - 1] if @current_station != @first_station
  end

  def get_current_station_index(current_station)
    @route.stations.index(current_station)
  end
end
