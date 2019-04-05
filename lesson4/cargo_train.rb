require_relative 'train'

class Cargo_Train < Train
  attr_reader :number, :type

  def initialize (number)
    super
    @type = "сargo"
  end

  def add_carriage

  end
end
