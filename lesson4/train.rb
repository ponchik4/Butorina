class Train
  attr_reader :current_station, :speed, :carriage, :route, :number

  def initialize (number)
    @number = number
    @carriage = []
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

  def add_carriage(wagon)
    @carriage << wagon if @speed == 0 && wagon.type == self.type
  end

  def delete_carriage(wagon)
    @carriage.delete_at(-1) if @speed == 0 && @carriage.any?
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

  protected #Эти методы не используются другими объектами, но используются дочерними классами.

  def next_station
    @route.stations[@current_station_index] if @current_station != @route.last_station
  end

  def previous_station
    @route.stations[@current_station_index] if @current_station != @route.first_station
  end
end
