require_relative 'instance_counter'
require_relative 'Manufacturer'

class CargoCarriage
  include InstanceCounter
  include Manufacturer
  attr_reader :type_carriage

  def initialize
    @type_carriage = :cargo
    register_instance
  end
end
