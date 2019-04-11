class Route
  attr_reader :last_station, :first_station, :route_number

  def initialize (first_station, last_station, route_number)
    @first_station = first_station
    @last_station = last_station
    @stations = []
    @route_number = route_number
  end

  def stations
  [@first_station, @stations, @last_station].flatten
  end

  def add_stations(station)
    @stations.push(station)
  end

  def delete_staion(station)
    return if [@first_station, @last_station].include?(station)
    @stantions.delete(station)
  end
end
