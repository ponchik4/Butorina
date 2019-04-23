require_relative 'instance_counter'
require_relative 'Manufacturer'

class PassengerCarriage
  include InstanceCounter
  include Manufacturer

  attr_reader :type_carriage, :occupied_seat, :number

  def initialize(seats, number)
    @type_carriage = :passenger
    @seats = seats
    @occupied = 0
    @number = 
  end

  def occupied_seat
    @occupied += 1
    raise "Не хватает места, свободных осталось: #{self.vacant?}" if @occupied > @seats
  end

  def vacant?
    @seats - @occupied
  end
end
