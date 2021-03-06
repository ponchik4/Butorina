class Route
  attr_reader :last_station, :first_station

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
