class PassengerTrain < Train

  attr_reader :number, :type

  def initialize (number)
    super
    @type = "passanger"
  end

  def add_carriage
    @passanger_carriage + 1 if @speed == 0
  end

  def delete_carriage
    @passanger_carriage - 1 if @speed == 0
    @passanger_carriage = 0 if @carriage < 0
  end
end
