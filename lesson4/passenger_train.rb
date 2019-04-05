require_relative 'train'

class Passenger_Train < Train
  attr_reader :number, :type

  def initialize (number)
    super
    @type = "passanger"
  end

  def add_carriage

  end
end
