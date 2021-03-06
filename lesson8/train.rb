require_relative 'instance_counter'
require_relative 'manufacturer'

class Train
  include InstanceCounter
  include Manufacturer

  attr_reader :current_station, :speed, :carriage, :route
  attr_accessor :number
  NUMBER_FORMAT = /^[a-z]{3}-*[a-z\d]{2}$/i.freeze
  @trains = {}

  def initialize(number)
    @number = number
    @carriage = []
    validate!
    register_instance
    @@trains[number] = self
  end

  def each_carriage
    @carriage.each.with_index(1) do |carriage, index|
      yield(carriage, index)
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def self.find(number)
    @@trains[number]
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
    @carriage << wagon if @speed.zero? && wagon.type == type
  end

  def delete_carriage(_wagon)
    @carriage.delete_at(-1) if @speed.zero? && @carriage.any?
  end

  def assign_route(route)
    @route = route
    @current_station = route.stations.first
    @current_station_index = 0
  end

  def move_forward
    return unless next_station

    @current_station.remove_train(self)
    @current_station_index += 1
    @current_station = next_station
    @current_station.add_train(self)
  end

  def move_back
    return unless previous_station

    @current_station.remove_train(self)
    @current_station_index -= 1
    @current_station = previous_station
    @current_station.add_train(self)
  end

  protected # These methods are not used by other objects, but are used by child classes.

  def validate!
    raise "Number can't be nil" if number.nil?
    raise 'Number should be at least 5-6 symbols' if number.length > 6 && number.length < 5
    raise 'Number has invalid format' if number !~ NUMBER_FORMAT
  end

  def next_station
    @route.stations[@current_station_index] if @current_station != @route.last_station
  end

  def previous_station
    @route.stations[@current_station_index] if @current_station != @route.first_station
  end
end
