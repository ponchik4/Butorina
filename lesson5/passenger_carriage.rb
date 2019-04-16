require_relative 'instance_counter'
require_relative 'Manufacturer'

class PassengerCarriage
  include InstanceCounter
  attr_reader :type_carriage

  def initialize
    @type_carriage = :passenger
    register_instance
  end
end
