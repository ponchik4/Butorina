require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains
  @@stations = []

  def initialize(name)
   @name = name
   @trains = []
   validate!
   register_instance
   self.class.all << self
  end

  def each_train
    @trains.each do |train|
      yield(train)
    end
  end

  def valid?
    validate!
    true
  rescue
    false
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

  private

  def validate!
    raise "Name can't be nil" if name.nil?
  end
end
