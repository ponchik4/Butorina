require_relative 'InstanceCounter'
require_relative 'Manufacturer'

class CargoCarriage
  attr_reader :type_carriage

  def initialize
    @type_carriage = :cargo
    register_instance
  end
end
