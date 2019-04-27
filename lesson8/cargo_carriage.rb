require_relative 'instance_counter'
require_relative 'Manufacturer'

class CargoCarriage
  include InstanceCounter
  include Manufacturer

  attr_reader :type_carriage, :occupied_volume

  def initialize(volume)
    @type_carriage = :cargo
    @volume = volume
    register_instance
  end

  def take_volume(volume)
    @occupied_volume += volume
    raise "Не хватает места, вы пожете занять #{vacant_volume}" if @occupied_volume > @volume
  end

  def vacant_volume
    @volume - @occupied_volume
  end
end
