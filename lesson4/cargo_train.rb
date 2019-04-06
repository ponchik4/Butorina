class CargoTrain < Train
  attr_reader :number, :type

  def initialize (number)
    super
    @type = "сargo"
  end

  def add_carriage
    @cargo_carriage + 1 if @speed == 0
  end

  def delete_carriage
    @cargo_carriage - 1 if @speed == 0
    @cargo_carriage = 0 if @carriage < 0
  end
end
