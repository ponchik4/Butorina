require_relative 'instance_counter'
require_relative 'Manufacturer'

class PassengerCarriage
  include InstanceCounter
  include Manufacturer

  attr_reader :type_carriage, :occup_seat, :number

  def initialize(seats)
    @type_carriage = :passenger
    @seats = seats
    @occupied = 0
  end

  def occupied_seat
    @occupied += 1
    raise "Не хватает места, свободных осталось: #{vacant?}" if @occupied > @seats
  end

  def vacant?
    @seats - @occupied
  end
end
