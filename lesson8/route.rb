require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :last_station, :first_station, :route_number

  def initialize(first_station, last_station, route_number)
    @first_station = first_station
    @last_station = last_station
    @stations = []
    @route_number = route_number
    validate!
    register_instance
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
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

  private

  def validate!
    raise "first_station can't be nil" if first_station.nil?
    raise "last_station can't be nil" if last_station.nil?
    raise "route_number can't be nil" if route_number.nil?
  end
end
