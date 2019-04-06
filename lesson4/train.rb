class Train
  attr_reader :carriage, :current_station, :speed, :type

  def initialize (number, type)
    @number = number
    @type = type
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

  def set_route(route)
    @route = route
    @current_station = route.stations.first
    @current_station_index = 0
  end

  def move_forward
    if next_station
      @current_station.remove_train(self)
      @current_station_index += 1
      @current_station = next_station
      @current_station.add_train(self)
    end
  end

  def move_back
    if previous_station
      @current_station.remove_train(self)
      @current_station_index -= 1
      @current_station = previous_station
      @current_station.add_train(self)
    end
  end

  protected #Эти методы не используются другими объектами, но используется дочерними классами.

  def next_station
    @route.stations[@current_station_index] if @current_station != @route.last_station
  end

  def previous_station
    @route.stations[@current_station_index] if @current_station != @route.first_station
  end
end