require_relative 'InstanceCounter'

class Station
  attr_reader :name, :trains

  def initialize(name)
   @name = name
   @trains = []
   @@stations = []
   register_instance
  end

  def self.all
    @@stations
  end

  def add_train (train)
    @trains << train
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def get_train_by_type(type)
    @trains.select { |train| train.type == train }
  end
end
